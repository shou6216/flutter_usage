# Flutter学習用プロジェクト

## 目的

* Flutterアプリ開発の全体像把握
* Android or iOSの実機実行までの流れやってみる
* Dartの学習
* Codemagic使ってみる

## 開発環境

* Windows 10
* Android Studio 4.0
* Flutter 1.20.0-8.0.pre.57
* Git 2.27.0.windows.1
* Xperia 10 II(Android 10)
  * 開発PCで実機デバッグ実行の設定済

## 構築手順

### Flutter

1. 基本[ここ](https://flutter.dev/docs/get-started/install/windows)みればできる
2. Flutter SDKダウンロード
    * 今後のアップデートを考えてGitでcloneした方がよい

    ```sh
    > git clone https://github.com/flutter/flutter.git -b stable
    ```

3. 環境変数のPATHに追加
    * FLUTTER_HOME : /path/to/flutter
    * PATH : %PATH%;%FlUTTER_HOME%/bin
4. コマンドプロンプトなどでcloneした場所に移動
5. コマンド実行

    ```sh
    > flutter doctor
    ```

6. 初期設定

    ```sh
    > flutter config --enable-web
    ```

### Android Studio

1. Android Studioダウンロード&インストール
2. Flutterプラグイン追加
    * pluginsで「Flutter」で検索すると出る
    * 再起動して反映

### Flutterプロジェクト作成

1. Android Studio起動
2. 「Start a new Flutter project」選択
3. 普通に作りたいものや名前を指定する
    * Flutter SDKは↑で配置した場所

## アプリ

### 仕様

* DQWの図鑑虹埋めとこころS取得状態を管理
  * 図鑑の銅、銀やこころのS以下の状態は管理しない

### 画面構成

* 一覧画面
* 追加・更新画面

### ストレージ

* SQLite

## コマンド

### プロジェクト作成

```sh
> flutter create アプリ名
```

### 実行可能デバイスの確認

```sh
> flutter devices
```

### 実行

```sh
> flutter run --device-id XXXXX(devicesで取得するID)
```

## Tips

### 画面遷移

* https://github.com/shou6216/flutter_usage/commit/da6e70e5145820a345cf5fbbc336a650d353724f

#### 定義

```dart
return MaterialApp(
    routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MyHomePage(),
        '/new': (BuildContext context) => new NewMonsterPage()
});
```

* `routes`で画面定義名(/home、/new)と画面オブジェクトを定義します

#### 遷移元画面に戻った後の処理

```dart
Navigator.of(context).pushNamed('/new').then((value) {
                  if (value) {
                    setState(() => {print('reloaded search results')});
                  }
                })
```

* (ボタン押下時など)↑のように遷移する。`pushNamed('/new')`の戻り値は`Future`になっていて、遷移先から戻ってきた後に処理をしたい場合は
ここで行う。`value`は遷移先からの戻り値。

#### 遷移元画面にパラメータを渡す

```dart
class _NewMonsterPageState extends State<NewMonsterPage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop(_shouldReload);
          return Future.value(true);
        },
        child: Scaffold()
    )
  }
```

* `WillPopScope`で遷移元画面に戻る前のイベントを拾える。
そこで、`Navigator.of(context).pop()`に返したいオブジェクトをセットする

#### 遷移先にパラメータを渡す

```dart
Navigator.of(context).pushNamed('/new',arguments: monster)
```

* `arguments`に渡したいオブジェクトをセットする

```dart
final Monster monster = ModalRoute.of(context).settings.arguments;
```

* `settings.arguments`で受け取る

### 非同期描画

* https://github.com/shou6216/flutter_usage/commit/ea76dc0b0dd21a724bdc167d74c00dfd472cab59

* `FutureBuilder`を使う

### スクロール

* https://github.com/shou6216/flutter_usage/commit/42b66d7f7847255ee2428932e874816e5b7e13ff

* `SingleChildScrollView`を使う

### 入力フォーム

* https://github.com/shou6216/flutter_usage/commit/3cd0ad229b89fb30cee6b5388af4374f32c4c9e3

* `TextFormField`を使う

### SQLite

* https://github.com/shou6216/flutter_usage/blob/master/pubspec.yaml#L26-L27
  * `sqflite`使う
  * `path`は、sqliteファイルを配置する場所を指定する際に利用する
    * AndroidとiOSでフォルダ構成が異なる部分を吸収してくれる
* https://github.com/shou6216/flutter_usage/blob/master/lib/database_helper.dart

### 国際化

* https://github.com/shou6216/flutter_usage/blob/master/pubspec.yaml#L28-L30
* https://github.com/shou6216/flutter_usage/commit/6a3ba02eda6f8db1e7f54f8e8ce794f684c476e3

## CodeMagic

* アカウント作成
  * GitHubアカウントで作れる
* リポジトリを登録
* `Start Build`するとビルド開始
* 正常終了するとGitHubアカウントのメールアドレスにapkファイルが添付されたメールが届く
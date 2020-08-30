# Flutter学習用プロジェクト

## 目的

* Flutterアプリ開発の全体像把握
* AndroidとiOSアプリ実機実行までの流れやってみる
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

#### Android Studio

1. Android Studio起動
2. 「Start a new Flutter project」選択
3. 普通に作りたいものや名前を指定する
    * Flutter SDKは↑で配置した場所

#### コマンド

```sh
> flutter create アプリ名
```

## 実行

### 実行可能デバイスの確認

```sh
> flutter devices
```

### コマンド

```sh
> flutter run --device-id XXXXX(devicesで取得するID)
```

## アプリ

### 仕様

* DQWの図鑑虹埋めとこころS取得状態を管理
    * 図鑑の銅、銀やこころのS以下の状態は管理しない
    * 0(未達成)、1(達成)のみ管理

### 画面構成

* 一覧画面
* 更新画面

※モンスター登録画面は用意しない

### 一覧画面

* 検索フィルタ
    * 全て
    * 虹埋め
    * こころS
    * 虹埋め + こころS
* 検索表示
    * 図鑑No
    * 名前
    * 図鑑状態
    * こころ状態
    * 更新画面ボタン

### データ保存

* SQLite
* モンスター追加は、SQL更新で対応
    * 画面からはできない

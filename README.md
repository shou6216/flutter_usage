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

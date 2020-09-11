class Monster {
  final int id;
  final String name;
  final int kill;
  final int heart;

  static List<Monster> v1 = [
    new Monster(id: 1, name: 'スライム', kill: 2, heart: 2),
    new Monster(id: 2, name: 'ドラキー', kill: 2, heart: 2),
    new Monster(id: 3, name: 'スライムベス', kill: 2, heart: 2),
    new Monster(id: 4, name: 'ゴースト', kill: 2, heart: 2),
    new Monster(id: 5, name: 'モーモン', kill: 2, heart: 2),
    new Monster(id: 6, name: 'しましまキャット', kill: 2, heart: 2),
    new Monster(id: 7, name: 'メーダ', kill: 2, heart: 2),
    new Monster(id: 8, name: 'いたずらもぐら', kill: 2, heart: 2),
    new Monster(id: 9, name: 'リリパット', kill: 2, heart: 0),
    new Monster(id: 10, name: 'バブルスライム', kill: 2, heart: 2),
    new Monster(id: 11, name: 'びっくりサタン', kill: 2, heart: 2),
    new Monster(id: 12, name: 'きりかぶこぞう', kill: 2, heart: 0),
    new Monster(id: 13, name: 'メラリザード', kill: 2, heart: 2),
    new Monster(id: 14, name: 'ファーラット', kill: 2, heart: 2),
    new Monster(id: 15, name: 'いっかくうさぎ', kill: 2, heart: 2),
    new Monster(id: 16, name: 'プチアーノン', kill: 2, heart: 2),
    new Monster(id: 17, name: 'さそりばち', kill: 2, heart: 2),
    new Monster(id: 18, name: 'メラゴースト', kill: 2, heart: 0),
    new Monster(id: 19, name: 'オニオーン', kill: 2, heart: 2),
    new Monster(id: 20, name: 'キャタピラー', kill: 2, heart: 0),
    new Monster(id: 21, name: 'メタルスライム', kill: 2, heart: 0),
    new Monster(id: 22, name: 'どくろあらい', kill: 2, heart: 2),
    new Monster(id: 23, name: 'おばけキャンドル', kill: 2, heart: 0),
    new Monster(id: 24, name: 'あやしいかげ', kill: 2, heart: 0),
    new Monster(id: 25, name: 'あばれこまいぬ', kill: 2, heart: 0),
    new Monster(id: 26, name: 'ぶちスライム', kill: 2, heart: 2),
    new Monster(id: 27, name: 'メタッピー', kill: 2, heart: 2),
    new Monster(id: 28, name: 'わらいぶくろ', kill: 2, heart: 0),
    new Monster(id: 29, name: 'キメラ', kill: 2, heart: 2),
    new Monster(id: 30, name: 'キャットフライ', kill: 2, heart: 2),
    new Monster(id: 31, name: 'どろにんぎょう', kill: 2, heart: 2),
    new Monster(id: 32, name: 'おおきづち', kill: 2, heart: 2),
    new Monster(id: 33, name: 'キラースコップ', kill: 2, heart: 2),
    new Monster(id: 34, name: 'ドルイド', kill: 2, heart: 0),
    new Monster(id: 35, name: 'ねこまどう', kill: 2, heart: 2),
    new Monster(id: 36, name: 'しのどれい', kill: 2, heart: 2),
    new Monster(id: 37, name: 'みならいあくま', kill: 2, heart: 2),
    new Monster(id: 38, name: 'おおくちばし', kill: 2, heart: 0),
    new Monster(id: 39, name: 'ホイミスライム', kill: 2, heart: 2),
    new Monster(id: 40, name: 'モコモコじゅう', kill: 2, heart: 0),
    new Monster(id: 41, name: 'メタルブラザーズ', kill: 2, heart: 2),
    new Monster(id: 42, name: 'グレムリン', kill: 2, heart: 0),
    new Monster(id: 43, name: 'くさった死体', kill: 2, heart: 2),
    new Monster(id: 44, name: 'ビッグハット', kill: 2, heart: 0),
    new Monster(id: 45, name: 'ドロヌーバ', kill: 2, heart: 2),
    new Monster(id: 46, name: 'デザートゴースト', kill: 2, heart: 0),
    new Monster(id: 47, name: 'アルミラージ', kill: 2, heart: 2),
    new Monster(id: 48, name: 'スライムつむり', kill: 2, heart: 2),
    new Monster(id: 49, name: 'スノーモン', kill: 2, heart: 0),
    new Monster(id: 50, name: 'キラービー', kill: 2, heart: 2),
    new Monster(id: 51, name: 'スマイルロック', kill: 2, heart: 0),
    new Monster(id: 52, name: 'ポイズンリザード', kill: 2, heart: 2),
    new Monster(id: 53, name: 'ひとくいサーベル', kill: 2, heart: 2),
    new Monster(id: 54, name: 'プリズニャン', kill: 2, heart: 2),
    new Monster(id: 55, name: 'ミケまどう', kill: 0, heart: 0),
    new Monster(id: 56, name: 'マーブルン', kill: 2, heart: 0),
    new Monster(id: 57, name: 'ツンドラキー', kill: 0, heart: 0),
    new Monster(id: 58, name: 'チョコヌーバ', kill: 0, heart: 0),
    new Monster(id: 59, name: 'キラーピッケル', kill: 0, heart: 0),
    new Monster(id: 60, name: 'スウィートバッグ', kill: 2, heart: 0),
    new Monster(id: 61, name: 'メーダプリンス', kill: 0, heart: 0),
    new Monster(id: 62, name: 'のろいの岩', kill: 0, heart: 0),
    new Monster(id: 63, name: 'どくイモムシ', kill: 2, heart: 2),
    new Monster(id: 64, name: 'スカルガルー', kill: 2, heart: 2),
    new Monster(id: 65, name: 'しびれくらげ', kill: 2, heart: 2),
    new Monster(id: 66, name: 'ドラキーマ', kill: 2, heart: 2),
    new Monster(id: 67, name: 'ヘルボックル', kill: 2, heart: 2),
    new Monster(id: 68, name: 'ヘルビースト', kill: 2, heart: 0),
    new Monster(id: 69, name: 'ベビーマジシャン', kill: 2, heart: 0),
    new Monster(id: 70, name: 'がいこつ', kill: 2, heart: 2),
    new Monster(id: 71, name: 'さまようよろい', kill: 2, heart: 2),
    new Monster(id: 72, name: 'サイおとこ', kill: 2, heart: 2),
    new Monster(id: 73, name: 'タホドラキー', kill: 2, heart: 2),
    new Monster(id: 74, name: 'タップデビル', kill: 2, heart: 2),
    new Monster(id: 75, name: 'ガチャコッコ', kill: 2, heart: 2),
    new Monster(id: 76, name: 'ギズモ', kill: 2, heart: 2),
    new Monster(id: 77, name: 'ベビーサタン', kill: 2, heart: 0),
    new Monster(id: 78, name: 'スライムナイト', kill: 2, heart: 0),
    new Monster(id: 79, name: 'ともしびこぞう', kill: 2, heart: 0),
    new Monster(id: 80, name: 'キャットバット', kill: 2, heart: 2),
    new Monster(id: 81, name: 'たまねぎマン', kill: 2, heart: 2),
    new Monster(id: 82, name: 'よろいのきし', kill: 2, heart: 0),
    new Monster(id: 83, name: 'どくどくゾンビ', kill: 2, heart: 2),
    new Monster(id: 84, name: 'トンブレロ', kill: 2, heart: 2),
    new Monster(id: 85, name: 'オーク', kill: 2, heart: 2),
    new Monster(id: 86, name: 'スライムタワー', kill: 2, heart: 2),
    new Monster(id: 87, name: 'ひとくいばこ', kill: 2, heart: 2),
    new Monster(id: 88, name: 'ミイラ男', kill: 2, heart: 2),
    new Monster(id: 89, name: 'ぐんたいガニ', kill: 2, heart: 2),
    new Monster(id: 90, name: 'ごろつき', kill: 2, heart: 0),
    new Monster(id: 91, name: 'ベビーニュート', kill: 2, heart: 2),
    new Monster(id: 92, name: 'はぐれメタル', kill: 2, heart: 0),
    new Monster(id: 93, name: 'ひくいどり', kill: 2, heart: 0),
    new Monster(id: 94, name: 'ベロニャーゴ', kill: 2, heart: 2),
    new Monster(id: 95, name: 'ホークマン', kill: 2, heart: 0),
    new Monster(id: 96, name: 'どくやずきん', kill: 2, heart: 2),
    new Monster(id: 97, name: 'ブラウニー', kill: 2, heart: 2),
    new Monster(id: 98, name: 'ジャガーメイジ', kill: 2, heart: 2),
    new Monster(id: 99, name: 'ハンターフライ', kill: 2, heart: 2),
    new Monster(id: 100, name: 'デッドペッカー', kill: 2, heart: 2),
    new Monster(id: 101, name: 'ケダモン', kill: 2, heart: 2),
    new Monster(id: 102, name: 'どれいへいし', kill: 2, heart: 2),
    new Monster(id: 103, name: 'メタルハンター', kill: 2, heart: 2),
    new Monster(id: 104, name: 'マジカルハット', kill: 2, heart: 2),
    new Monster(id: 105, name: 'キラーマシン', kill: 2, heart: 0),
    new Monster(id: 106, name: 'イエティ', kill: 2, heart: 2),
    new Monster(id: 107, name: 'かえんムカデ', kill: 2, heart: 2),
    new Monster(id: 108, name: 'マミー', kill: 2, heart: 2),
    new Monster(id: 109, name: 'シャドー', kill: 2, heart: 2),
    new Monster(id: 110, name: 'たてまじん', kill: 2, heart: 2),
    new Monster(id: 111, name: 'フレイム', kill: 2, heart: 2),
    new Monster(id: 112, name: 'デビルアーマー', kill: 2, heart: 2),
    new Monster(id: 113, name: 'マドハンド', kill: 2, heart: 2),
    new Monster(id: 114, name: 'しびれだんびら', kill: 2, heart: 2),
    new Monster(id: 115, name: 'ひとつめピエロ', kill: 2, heart: 2),
    new Monster(id: 116, name: 'ベビル', kill: 2, heart: 0),
    new Monster(id: 117, name: 'メタルライダー', kill: 2, heart: 0),
    new Monster(id: 118, name: 'ボーンナイト', kill: 2, heart: 0),
    new Monster(id: 119, name: 'ヒートギズモ', kill: 2, heart: 2),
    new Monster(id: 120, name: 'リザードマン', kill: 2, heart: 2),
    new Monster(id: 121, name: 'ミニデーモン', kill: 2, heart: 2),
    new Monster(id: 122, name: 'ホークブリザード', kill: 2, heart: 2),
    new Monster(id: 123, name: 'ハートナイト', kill: 0, heart: 0),
    new Monster(id: 124, name: 'ゴールデンコーン', kill: 0, heart: 0),
    new Monster(id: 125, name: 'ピンクボンボン', kill: 0, heart: 0),
    new Monster(id: 126, name: 'ももいろ三姉妹', kill: 0, heart: 0),
    new Monster(id: 127, name: 'クイーンモーモン', kill: 0, heart: 0),
    new Monster(id: 128, name: 'とげこんぼう', kill: 0, heart: 0),
    new Monster(id: 129, name: 'アルケミストン', kill: 0, heart: 0),
    new Monster(id: 130, name: 'ファイアボール', kill: 0, heart: 0),
    new Monster(id: 131, name: 'ばくだん岩', kill: 2, heart: 2),
    new Monster(id: 132, name: 'あくま神官', kill: 2, heart: 2),
    new Monster(id: 133, name: 'じごくのよろい', kill: 2, heart: 2),
    new Monster(id: 134, name: 'しりょうのきし', kill: 2, heart: 2),
    new Monster(id: 135, name: 'ピンクモーモン', kill: 2, heart: 2),
    new Monster(id: 136, name: 'ベホイミスライム', kill: 2, heart: 2),
    new Monster(id: 137, name: 'アームライオン', kill: 2, heart: 0),
    new Monster(id: 138, name: 'キラーパンサー', kill: 2, heart: 2),
    new Monster(id: 139, name: 'アローインプ', kill: 2, heart: 2),
    new Monster(id: 140, name: 'メトロゴースト', kill: 2, heart: 2),
    new Monster(id: 141, name: 'つむりんママ', kill: 2, heart: 2),
    new Monster(id: 142, name: 'きめんどうし', kill: 2, heart: 2),
    new Monster(id: 143, name: 'かっちゅうアリ', kill: 2, heart: 2),
    new Monster(id: 144, name: 'パペットマン', kill: 2, heart: 2),
    new Monster(id: 145, name: 'キングスライム', kill: 2, heart: 2),
    new Monster(id: 146, name: 'ヒイラギどうじ', kill: 2, heart: 0),
    new Monster(id: 147, name: 'ドラゴスライム', kill: 2, heart: 2),
    new Monster(id: 148, name: 'ベビーサラマンダ', kill: 2, heart: 2),
    new Monster(id: 149, name: 'サブナック', kill: 0, heart: 1),
    new Monster(id: 150, name: 'ブラッドハンド', kill: 2, heart: 2),
    new Monster(id: 151, name: 'てっこうまじん', kill: 2, heart: 2),
    new Monster(id: 152, name: 'エビルホーク', kill: 2, heart: 0),
    new Monster(id: 153, name: 'まおうのつかい', kill: 0, heart: 1),
    new Monster(id: 154, name: 'トロル', kill: 0, heart: 0),
    new Monster(id: 155, name: 'まほうつかい', kill: 2, heart: 0),
    new Monster(id: 156, name: 'おおさそり', kill: 2, heart: 0),
    new Monster(id: 157, name: 'ドロル', kill: 2, heart: 0),
    new Monster(id: 158, name: 'てつのさそり', kill: 2, heart: 0),
    new Monster(id: 159, name: 'リカント', kill: 2, heart: 2),
    new Monster(id: 160, name: 'ストーンマン', kill: 2, heart: 0),
    new Monster(id: 161, name: 'まどうし', kill: 2, heart: 0),
    new Monster(id: 162, name: 'ドロルメイジ', kill: 2, heart: 0),
    new Monster(id: 163, name: 'リカントマムル', kill: 2, heart: 0),
    new Monster(id: 164, name: 'キースドラゴン', kill: 2, heart: 0),
    new Monster(id: 165, name: 'しのさそり', kill: 2, heart: 0),
    new Monster(id: 166, name: 'キラーリカント', kill: 2, heart: 0),
    new Monster(id: 167, name: 'だいまどう', kill: 2, heart: 0),
    new Monster(id: 168, name: 'ダースドラゴン', kill: 2, heart: 0),
    new Monster(id: 169, name: 'あくまのきし', kill: 0, heart: 0),
    new Monster(id: 170, name: 'ドラゴン', kill: 0, heart: 0),
    new Monster(id: 171, name: 'ゴーレム', kill: 0, heart: 0),
    new Monster(id: 172, name: 'りゅうおう', kill: 0, heart: 2),
    new Monster(id: 173, name: 'もみじこぞう', kill: 2, heart: 0),
    new Monster(id: 174, name: 'ダッシュラン', kill: 2, heart: 0),
    new Monster(id: 175, name: 'テラノライナー', kill: 2, heart: 0),
    new Monster(id: 176, name: 'ガメゴン', kill: 2, heart: 0),
    new Monster(id: 177, name: 'リザードフライ', kill: 2, heart: 0),
    new Monster(id: 178, name: 'ドラゴンフライ', kill: 2, heart: 0),
    new Monster(id: 179, name: 'スカルゴン', kill: 2, heart: 0),
    new Monster(id: 180, name: 'コドラ', kill: 2, heart: 0),
    new Monster(id: 181, name: 'はしりとかげ', kill: 2, heart: 2),
    new Monster(id: 182, name: 'バトルレックス', kill: 2, heart: 2),
    new Monster(id: 183, name: 'デンデン竜', kill: 2, heart: 0),
    new Monster(id: 184, name: 'ドラゴンバゲージ', kill: 2, heart: 0),
    new Monster(id: 185, name: 'スカイドラゴン', kill: 2, heart: 0),
    new Monster(id: 186, name: 'ナウマンボーグ', kill: 0, heart: 0),
    new Monster(id: 187, name: 'ギガデーモン', kill: 2, heart: 2),
    new Monster(id: 188, name: 'キングレオ', kill: 0, heart: 0),
    new Monster(id: 189, name: 'アンドレアル', kill: 2, heart: 2),
    new Monster(id: 190, name: 'デスピサロ', kill: 0, heart: 0),
    new Monster(id: 191, name: 'ヘルバトラー', kill: 2, heart: 2),
    new Monster(id: 192, name: '究極エビルプリースト', kill: 0, heart: 0),
    new Monster(id: 193, name: '究極エビルプリースト', kill: 0, heart: 0),
    new Monster(id: 194, name: 'アイスゴーレム', kill: 0, heart: 2),
    new Monster(id: 195, name: 'スノードラゴン', kill: 0, heart: 2),
    new Monster(id: 196, name: 'ブリザードマン', kill: 2, heart: 2),
    new Monster(id: 197, name: 'スライムかがみもち', kill: 2, heart: 2),
    new Monster(id: 198, name: 'おみくじミミック', kill: 2, heart: 2),
    new Monster(id: 199, name: 'ふくぶくろ', kill: 2, heart: 2),
    new Monster(id: 200, name: 'メタルドラゴン', kill: 0, heart: 0),
    new Monster(id: 201, name: 'メタルホイミン', kill: 2, heart: 2),
    new Monster(id: 202, name: 'つかいま', kill: 2, heart: 2),
    new Monster(id: 203, name: 'プリーストナイト', kill: 2, heart: 2),
    new Monster(id: 204, name: 'ずしおうまる', kill: 2, heart: 2),
    new Monster(id: 205, name: 'くものきょじん', kill: 2, heart: 2),
    new Monster(id: 206, name: 'じごくのもんばん', kill: 2, heart: 2),
    new Monster(id: 207, name: 'セルゲイナス', kill: 2, heart: 2),
    new Monster(id: 208, name: 'キングミニデーモン', kill: 0, heart: 1),
    new Monster(id: 209, name: 'メイジドラキー', kill: 2, heart: 2),
    new Monster(id: 210, name: 'じんめんじゅ', kill: 2, heart: 2),
    new Monster(id: 211, name: 'じごくのハサミ', kill: 0, heart: 0),
    new Monster(id: 212, name: 'ゴールドオーク', kill: 2, heart: 2),
    new Monster(id: 213, name: 'うみぼうず', kill: 2, heart: 2),
    new Monster(id: 214, name: 'ジェリーマン', kill: 2, heart: 2),
    new Monster(id: 215, name: 'さまようたましい', kill: 2, heart: 2),
    new Monster(id: 216, name: 'ベンガルクーン', kill: 2, heart: 2),
    new Monster(id: 217, name: 'ベホイムスライム', kill: 2, heart: 2),
    new Monster(id: 218, name: 'りゅうき兵', kill: 2, heart: 2),
    new Monster(id: 219, name: 'おどるほうせき', kill: 2, heart: 0),
    new Monster(id: 220, name: 'メイジキメラ', kill: 2, heart: 2),
    new Monster(id: 221, name: 'ボーンプリズナー', kill: 2, heart: 2),
    new Monster(id: 222, name: 'シールドオーガ', kill: 2, heart: 2),
    new Monster(id: 223, name: 'マッドフィンガー', kill: 0, heart: 2),
    new Monster(id: 224, name: 'シルバーデビル', kill: 2, heart: 0),
    new Monster(id: 225, name: 'ゲリュオン', kill: 1, heart: 1),
    new Monster(id: 226, name: 'おひなさまスライム', kill: 2, heart: 2),
    new Monster(id: 227, name: 'きりさきピエロ', kill: 2, heart: 2),
    new Monster(id: 228, name: 'さくらこぞう', kill: 2, heart: 2),
    new Monster(id: 229, name: 'カンダタ', kill: 2, heart: 2),
    new Monster(id: 230, name: 'カンダタこぶん', kill: 2, heart: 1),
    new Monster(id: 231, name: 'やまたのおろち', kill: 2, heart: 2),
    new Monster(id: 232, name: 'バラモス', kill: 0, heart: 2),
    new Monster(id: 233, name: 'バラモスブロス', kill: 2, heart: 2),
    new Monster(id: 234, name: 'ゾーマ', kill: 0, heart: 2),
    new Monster(id: 235, name: 'ブラッドソード', kill: 2, heart: 2),
    new Monster(id: 236, name: 'おばけトマト', kill: 2, heart: 2),
    new Monster(id: 237, name: 'フロストギズモ', kill: 2, heart: 2),
    new Monster(id: 238, name: 'マリンスライム', kill: 2, heart: 2),
    new Monster(id: 239, name: 'ミミック', kill: 2, heart: 2),
    new Monster(id: 240, name: 'ブリザード', kill: 2, heart: 2),
    new Monster(id: 241, name: 'だいおうキッズ', kill: 0, heart: 0),
    new Monster(id: 242, name: 'げんじかぶと', kill: 0, heart: 0),
    new Monster(id: 243, name: 'ホラービースト', kill: 0, heart: 0),
    new Monster(id: 244, name: 'メーダロード', kill: 1, heart: 1),
    new Monster(id: 245, name: 'ガーゴイル', kill: 0, heart: 0),
    new Monster(id: 246, name: 'しにがみきぞく', kill: 1, heart: 1),
    new Monster(id: 247, name: 'ダークスライム', kill: 2, heart: 2),
    new Monster(id: 248, name: 'ダークキング', kill: 0, heart: 0),
    new Monster(id: 249, name: 'ベスキング', kill: 2, heart: 0),
    new Monster(id: 250, name: 'スカラベキング', kill: 1, heart: 1),
    new Monster(id: 251, name: 'セキバーン', kill: 2, heart: 0),
    new Monster(id: 252, name: 'スナノサウルス', kill: 2, heart: 2),
    new Monster(id: 253, name: 'ヘルコンドル', kill: 2, heart: 2),
    new Monster(id: 254, name: 'ギガンテス', kill: 0, heart: 0),
    new Monster(id: 255, name: 'まなつのせんし', kill: 2, heart: 2),
    new Monster(id: 256, name: 'スイカ岩', kill: 2, heart: 0),
    new Monster(id: 257, name: 'トロピカルドラゴ', kill: 0, heart: 2),
    new Monster(id: 258, name: 'フレイムドッグ', kill: 2, heart: 2),
    new Monster(id: 259, name: 'キラーベンダーマシン', kill: 2, heart: 1),
    new Monster(id: 260, name: 'キングスイカ岩', kill: 0, heart: 0),
    new Monster(id: 261, name: 'ドラゴンキッズ', kill: 2, heart: 2),
    new Monster(id: 262, name: 'りゅうせんし', kill: 2, heart: 2),
    new Monster(id: 263, name: 'ドラゴンゾンビ', kill: 2, heart: 2),
    new Monster(id: 264, name: 'ドラゴンガイア', kill: 2, heart: 2),
    new Monster(id: 265, name: 'ヘルジュラシック', kill: 2, heart: 2),
    new Monster(id: 266, name: 'ヘルゴースト', kill: 0, heart: 2),
    new Monster(id: 267, name: 'アイアンクック', kill: 0, heart: 0),
    new Monster(id: 268, name: 'メガザルロック', kill: 0, heart: 2),
    new Monster(id: 269, name: 'キラートーチ', kill: 0, heart: 2),
    new Monster(id: 270, name: 'アカイライ', kill: 0, heart: 0),
    new Monster(id: 271, name: 'ホロゴースト', kill: 0, heart: 0),
    new Monster(id: 272, name: 'ボボンガー', kill: 0, heart: 0),
    new Monster(id: 273, name: 'デンタザウルス', kill: 1, heart: 1),
    new Monster(id: 274, name: 'ほのおのせんし', kill: 1, heart: 1),
    new Monster(id: 275, name: 'うごくせきぞう', kill: 1, heart: 1),
    new Monster(id: 276, name: 'エリミネーター', kill: 1, heart: 1),
    new Monster(id: 277, name: 'じごくのつかい', kill: 1, heart: 1),
    new Monster(id: 278, name: 'ワイトキング', kill: 1, heart: 1),
    new Monster(id: 279, name: 'MCカンダタ', kill: 2, heart: 2),
    new Monster(id: 280, name: 'ゴールドマン', kill: 2, heart: 1)
  ];

  Monster({this.id, this.name, this.kill, this.heart});
}

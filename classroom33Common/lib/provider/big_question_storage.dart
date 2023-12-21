import 'package:hooks_riverpod/hooks_riverpod.dart';

import './../schema/question/big_question_item.dart';
import './../schema/question/question_category.dart';
import '../schema/question/small_question_item.dart';

class BigQuestionSet {
  BigQuestionSet({
    required this.id,
    required this.title,
    required this.questions,
    required this.category,
  });
  final int id;
  final String title;
  final List<BigQuestionItem> questions;
  final QuestionCategory category;
}

final questionProvider = Provider(
  (ref) => <BigQuestionSet>[...questions],
);

final questions = <BigQuestionSet>[
  BigQuestionSet(
    id: 1,
    title: r'中学理科',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forJhs,
        questions: [
          SmallQuestionItem(
            id: 10,
            questionStatement: r'この中で軟体動物ではないのはどれか?',
            choices: [r'クラゲ', r'アサリ', r'イカ', r'タニシ'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 12,
            questionStatement: r'双子葉類の特徴の組み合わせとして正しいものは?',
            choices: [r'ひげ根-平行脈', r'ひげ根-網状脈', r'主根と側根-平行脈', r'主根と側根-網状脈'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 15,
            questionStatement: r'このなかで合弁花類であるものはなにか?',
            choices: [r'エンドウ', r'サクラ', r'ヒマワリ', r'アブラナ'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forJhs,
        questions: [
          SmallQuestionItem(
            id: 18,
            questionStatement: r'光源ではないものはどれか?',
            choices: [r'太陽', r'電灯', r'燃えているろうそく', r'月'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 22,
            questionStatement: r'凸レンズを通して見える虚像の説明として正しくないのはどれか?',
            choices: [r'物体が焦点より内側', r'向きが物体と同じ', r'実物より大きい', r'スクリーンにうつる'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 24,
            questionStatement: r'この中で一番高い音が出る弦はどれか?',
            choices: [r'長さ10㎝太さ1㎜', r'長さ10㎝太さ2㎜', r'長さ20㎝太さ1㎜', r'長さ20㎝太さ2㎜'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forJhs,
        questions: [
          SmallQuestionItem(
            id: 8,
            questionStatement: r'空気の量が適切な炎の色はどれか?',
            choices: [r'うすい赤色 ', r'黄色', r'うすい青色', r'無色'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 14,
            questionStatement: r'金属の共通の性質として正しくないのはどれか?',
            choices: [r'磁石につく', r'磨くと金属光沢が出る', r'展性と延性がある', r'電気を良く通し熱を伝えやすい'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 17,
            questionStatement: r'水上置換法で集められないきたいはどれか?',
            choices: [r'水素', r'酸素', r'二酸化炭素', r'アンモニア'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forJhs,
  ),
  BigQuestionSet(
    id: 2,
    title: r'中学社会',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forJhs,
        questions: [
          SmallQuestionItem(
            id: 2,
            questionStatement: r'フランスの国旗の３色が表していないものは?',
            choices: [r'平和', r'自由', r'平等', r'博愛'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 3,
            questionStatement: r'地球で最も大きい大陸は?',
            choices: [r'アフリカ大陸', r'南極大陸', r'北アメリカ大陸', r'ユーラシア大陸'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 4,
            questionStatement: r'世界で面積の大きさが４位内に入らない国は?',
            choices: [r'ロシア', r'アメリカ', r'ブラジル', r'カナダ'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forJhs,
        questions: [
          SmallQuestionItem(
            id: 19,
            questionStatement: r'鳴かぬなら鳴かせてみようホトトギス、と表現した武士は誰?',
            choices: [r'徳川家康', r'織田信長', r'織田信成', r'豊臣秀吉'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 20,
            questionStatement: r'「銀閣寺」の名前の由来はどれ?',
            choices: [r'金閣寺に合わせた', r'材料の一部が銀だった', r'銀ぱくを貼る予定だっ', r'最初は銀だった'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 25,
            questionStatement: r'紙幣が使われたのはいつから?',
            choices: [r'平安時代', r'室町時代', r'明治時代', r'江戸時代'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forJhs,
        questions: [
          SmallQuestionItem(
            id: 158,
            questionStatement: r'日本国憲法の三つの柱でないものは?',
            choices: [r'国民主権', r'基本的人権の尊重', r'象徴天皇制', r'平和主義'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 159,
            questionStatement: r'参議院選は、何年に一回行われるか?',
            choices: [r'2年', r'3年', r'4年', r'6年'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 160,
            questionStatement: r'選ばれた一般人が刑事裁判に参加する制度をなんという?',
            choices: [r'裁判員制度', r'裁判官制度', r'裁判参加制度', r'国民参加裁判制度'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forJhs,
  ),
  BigQuestionSet(
    id: 3,
    title: r'時事(アニメ・ドラマ・映画)',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 136,
            questionStatement: r'今年映画がまだ公開されていないアニメは?',
            choices: [r'すずめの戸締まり', r'コナン', r'ミニオン', r'ワンピース'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 140,
            questionStatement: r'映画トップガン・マーベリックで主人公が最後に乗った戦闘機は?',
            choices: [r'F14', r'F16', r'F18', r'F20'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 142,
            questionStatement: r'今年の金曜ロードショー「夏はジブリ」で放送されてないものは?',
            choices: [r'天空の城ラピュタ', r'耳をすませば', r'となりのトトロ', r'ハウルの動く城'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 148,
            questionStatement: r'ONEPIECE REDのウタの歌を担当した人は?',
            choices: [r'Ado', r'あるふぁきゅん', r'96猫', r'鹿乃'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 149,
            questionStatement: r'ワンピース RED で機材トラブルの時映っていたキャラは?',
            choices: [r'ウソップ', r'サンジ', r'ゾロ', r'チョッパー'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 146,
            questionStatement: r'名探偵コナンハロウィンの花嫁のスペシャルゲストキャラの出身地は?',
            choices: [r'アメリカ', r'イギリス', r'ロシア', r'スウェーデン'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 147,
            questionStatement: r'約束のネバーランドとほぼ同時に完結したJUMP作品は?',
            choices: [r'銀魂', r'食戟のソーマ', r'チェンソーマン', r'鬼滅の刃'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 150,
            questionStatement: r'今年実写化されるジブリ作品は?',
            choices: [r'思い出のマーニー', r'風立ちぬ', r'千と千尋の神隠し', r'耳をすませば'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 154,
            questionStatement: r'大河ドラマ｢鎌倉殿の十三人｣で小栗旬さんが演じる主人公は誰?',
            choices: [r'源頼朝', r'源義朝', r'北条義時', r'北条泰時'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ],
    category: QuestionCategory.topicsOfTheDay,
  ),
  BigQuestionSet(
    id: 4,
    title: r'時事(日本)',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 135,
            questionStatement: r'2022年7月2日に起こった大規模通信障害はどの会社が原因?',
            choices: [r'ソフトバンク', r'au', r'docomo', r'楽天モバイル'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 138,
            questionStatement: r'今年神奈川で開かれる大会はなんでしょう?',
            choices: [r'国民体育大会', r'全国健康福祉祭', r'万国博覧会', r'国際園芸博覧会'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 151,
            questionStatement: r'2022年の箱根駅伝、優勝したのは何大学?',
            choices: [r'駒澤大学', r'青山学院大学', r'東海大学', r'日本体育大学'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 141,
            questionStatement: r'今年4月から成人が18になったが、新しくできるようになったことは?',
            choices: [r'車の運転', r'国民年金', r'公認会計士の資格の取得', r'5年パスポートの取得'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 143,
            questionStatement: r'新500円玉に使われている金属は?',
            choices: [r'亜鉛', r'鉄', r'アルミニウム', r'ニホニウム'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 155,
            questionStatement: r'東京ディズニーシーは昨年、オープン何周年を迎えたでしょう?',
            choices: [r'15周年', r'20周年', r'25周年', r'30周年'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 152,
            questionStatement: r'今年の夏の甲子園、優勝したのはどこの高校?',
            choices: [r'大阪桐蔭高校', r'近江高校', r'下関国際高校', r'仙台育英高校'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 156,
            questionStatement: r'今年のトレンドカラーに含まれていないのは次のうちどれ?',
            choices: [r'パープル', r'イエロー', r'オレンジ', r'ブラック'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 157,
            questionStatement: r'今年鉄道は開通してから節目の年を迎えました。さて、何周年?',
            choices: [r'50周年', r'100周年', r'150周年', r'200周年'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ],
    category: QuestionCategory.topicsOfTheDay,
  ),
  BigQuestionSet(
    id: 5,
    title: r'時事(テーマなし)',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 131,
            questionStatement: r'今年行われるサッカーW杯で日本とグループリーグでない国は?',
            choices: [r'スペイン', r'ニュージーランド', r'コスタリカ', r'ドイツ'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 132,
            questionStatement: r'2022年7月9日、イーロン・マスクが買収を辞めたのは何社?',
            choices: [r'Twitter', r'Instagram', r'YouTube', r'zenly'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 134,
            questionStatement: r'2022年7月23日、WHOが緊急事態と発表した病気は?',
            choices: [r'COVID19', r'サル痘', r'インフルエンザ', r'りんご病'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 139,
            questionStatement: r'大谷翔平が成した2桁勝利2桁ホームランは何年ぶりの偉業か?',
            choices: [r'100', r'104', r'106', r'107'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 133,
            questionStatement: r'大谷翔平が104年ぶりに達成したのは誰の記録?',
            choices: [r'ソト', r'ラミレス', r'ダルビッシュ有', r'ベーブ・ルース'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 137,
            questionStatement: r'スタバの今年の期間限定のフラペチーノでないものは?',
            choices: [r'バナナナバナナ', r'ザメロンオブメロン', r'フルーツGYUNEW', r'さくら咲いたベリー'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.topicsOfTheDay,
        questions: [
          SmallQuestionItem(
            id: 144,
            questionStatement: r'今年JAXAを早期退職した元宇宙飛行士は誰?',
            choices: [r'野口聡一さん', r'山崎直子さん', r'向井千秋さん', r'秋山豊寛さん'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 145,
            questionStatement: r'2020オリンピックの日本の金メダルの数は?',
            choices: [r'27', r'24', r'17', r'14'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 153,
            questionStatement: r'今年、冬季オリンピックが開催されたのはどこの国?',
            choices: [r'カナダ', r'中国', r'ノルウェー', r'オーストリア'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
    ],
    category: QuestionCategory.topicsOfTheDay,
  ),
  BigQuestionSet(
    id: 6,
    title: r'雑学(日本)',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 118,
            questionStatement: r'日本初の鉄道が走ったのは新橋とどこの駅の間?',
            choices: [r'渋谷', r'浅草', r'桜木町', r'鶴見小野'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 119,
            questionStatement: r'今現在、日本で1番高いビルはどれ?',
            choices: [r'ランドマークタワー', r'六本木ヒルズ', r'あべのハルカス', r'ブルジュ・ハリファ'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 123,
            questionStatement: r'2番目に狭い都道府県はどこ?',
            choices: [r'東京都', r'神奈川県', r'大阪府', r'沖縄県'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 124,
            questionStatement: r'2番目に広い都道府県はどこ?',
            choices: [r'岩手県', r'長野県', r'福島県', r'新潟県'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 126,
            questionStatement: r'日本で1番多い苗字は?',
            choices: [r'田中', r'高橋', r'鈴木', r'佐藤'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 127,
            questionStatement: r'2021年の1世帯あたりの餃子の購入額1位の都市はどこ?',
            choices: [r'盛岡市', r'宇都宮市', r'浜松市', r'宮崎市'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 128,
            questionStatement: r'この中で最大収容人数が1番多いのはどこ?',
            choices: [r'日本武道館', r'有明アリーナ', r'横浜アリーナ', r'ぴあアリーナMM'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 129,
            questionStatement: r'次の都市のうち政令指定都市であるものはどれ?',
            choices: [r'佐賀市', r'長崎市', r'熊本市', r'鹿児島市'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 130,
            questionStatement: r'琵琶湖は滋賀県の面積のどれくらいを占めているでしょう?',
            choices: [
              r'約\frac{1}{2}',
              r'約\frac{1}{4}',
              r'約\frac{1}{6}',
              r'約\frac{1}{8}'
            ],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ],
    category: QuestionCategory.trivia,
  ),
  BigQuestionSet(
    id: 7,
    title: r'雑学(YSFH地域)',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 103,
            questionStatement: r'本校スーパーアドバイザー小林誠先生が受賞された賞は何?',
            choices: [r'ノーベル経済学賞', r'ノーベル物理学賞', r'ノーベル化学賞', r'ノーベル平和賞'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 104,
            questionStatement: r'本校に植えられている、学術誌natureより寄贈された木は?',
            choices: [r'月桂樹', r'椿', r'レッドロビン', r'みかん'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 114,
            questionStatement: r'神奈川県に市はいくつある?',
            choices: [r'13', r'16', r'19', r'22'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 105,
            questionStatement: r'本校の住所は横浜市鶴見区小野町〇です。〇に入る数字は?',
            choices: [r'4', r'5', r'6', r'7'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 120,
            questionStatement: r'桜木町に昨年オープンしたロープウェイの名前は?',
            choices: [r'ヨコハマエアキャビン', r'Airヨコハマ', r'cu-mo横浜', r'空YOKOHAMA'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 121,
            questionStatement: r'ベイスターズの親会社、DeNAのゲームは次のうちどれ?',
            choices: [r'原神', r'逆転オセロニア', r'ファミコン', r'エイペックス'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 106,
            questionStatement: r'開校してから今日まで、PTAだよりは何号まで発行されている?',
            choices: [r'27', r'29', r'31', r'33'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 107,
            questionStatement: r'本校の校歌を作詞・作曲されたオオゼキタクさんのデビュー曲は?',
            choices: [r'群青グラフィティ', r'レモン', r'恋オーラ', r'START'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 122,
            questionStatement: r'現在の横浜市の人口は?',
            choices: [r'約3.7万人', r'約37万人', r'約370万人', r'約3700万人'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ],
    category: QuestionCategory.trivia,
  ),
  BigQuestionSet(
    id: 8,
    title: r'雑学(テーマなし)',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 108,
            questionStatement: r'一般的なギターの弦は何本?',
            choices: [r'4', r'5', r'6', r'8'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 115,
            questionStatement: r'焼き鳥のハツとはどこの部分?',
            choices: [r'心臓', r'肺', r'舌', r'脳'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 117,
            questionStatement: r'縄跳びの技で実際にあるのは?',
            choices: [r'はやぶさ', r'飛行機', r'フライングダイナソー', r'ペガサス'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 116,
            questionStatement: r'ライオンは何科の動物?',
            choices: [r'ライオン科', r'ネコ科', r'ヒョウ科', r'イヌ科'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 125,
            questionStatement: r'食欲をそそると言われている色は?',
            choices: [r'赤', r'青', r'紫', r'白'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 110,
            questionStatement: r'車道が左側通行の国はどの国?',
            choices: [r'アメリカ', r'ドイツ', r'マレーシア', r'ベトナム'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.trivia,
        questions: [
          SmallQuestionItem(
            id: 109,
            questionStatement: r'エアコンを省略せずに言うと何?',
            choices: [r'エアコンプリート', r'エアコントローラー', r'エアコング', r'エア・コンディショナー'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 111,
            questionStatement: r'マレーシアを漢字1文字で表すとどの漢字になる?',
            choices: [r'麻', r'磨', r'真', r'馬'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 112,
            questionStatement: r'赤本を出版しているのはどこの会社?',
            choices: [r'旺文社', r'ベネッセ', r'集英社', r'数学社'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
    ],
    category: QuestionCategory.trivia,
  ),
  BigQuestionSet(
    id: 9,
    title: r'数学 - 高1',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 27,
            questionStatement: r'x^2+ax+b=0の2解が2,-1であるとき、a,bは?',
            choices: [r'a=-1,b=-2', r'a=-1,b=2', r'a=1,b=-2', r'a=1,b=2'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 29,
            questionStatement:
                r'AB=5,\angle{C}=30\degreeである\triangle{ABC}の外接円の半径は?',
            choices: [
              r'\frac{5}2',
              r'5',
              r'\frac{5}{2\sqrt{3}}',
              r'\frac{5}{\sqrt{3}}'
            ],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 32,
            questionStatement: r'5人を各部屋に1人はいるように2部屋に分ける方法は何通りか。',
            choices: [r'10', r'22', r'30', r'32'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 31,
            questionStatement: r'x^2=25はx=5であるための必要条件か、十分条件か',
            choices: [r'必要条件', r'十分条件', r'必要十分条件', r'どちらでもない'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 28,
            questionStatement: r'y=x^2-2x+1をy軸に関して対称移動した図形の方程式は?',
            choices: [
              r'y=-x^2+2x+1',
              r'y=-x^2+2x-1',
              r'y=x^2+2x+1',
              r'y=x^2+2x-1'
            ],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 34,
            questionStatement: r'AB^2<BC^2+CA^2であるとき、\triangle{ABC}の形状は?',
            choices: [r'鋭角三角形', r'直角三角形 ', r'鈍角三角形', r'分からない'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 35,
            questionStatement: r'x^2-6x+9<0の解は? ',
            choices: [r'x=3', r'x\neq3', r'解なし', r'全ての実数'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 30,
            questionStatement: r'周の長さが12で面積が6である三角形の内接円の半径は?',
            choices: [r'\frac{1}2', r'1', r'\frac{3.3}2', r'4.2'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 33,
            questionStatement: r'A,Bの少なくとも一方が男子であるときAが男子である確率は?',
            choices: [r'\frac{1}2', r'\frac{1}3', r'\frac{1}4', r'\frac{2}3'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 10,
    title: r'数学 - 高2',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 26,
            questionStatement: r'ax^2+bx+c=0の解を選べ',
            choices: [
              r'x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}',
              r'x=\frac{-b\pm\sqrt{b^2+4ac}}{2a}',
              r'x=\frac{-c\pm\sqrt{b-4ac}}{2b}',
              r'x=\frac{c\pm\sqrt{b-4ac}}{2b}'
            ],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 37,
            questionStatement: r'x^2+y^2=1と(x-3)^2+(y-4)^2=aが外接するようなaは?',
            choices: [r'4', r'5', r'16', r'25'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 39,
            questionStatement: r'1radは度数法で何度か。',
            choices: [
              r'(\frac{180}\pi)\degree',
              r'(\frac{360}\pi)\degree',
              r'(\frac{\pi}{180})\degree',
              r'(\frac{\pi}{360})\degree'
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 42,
            questionStatement: r'y=a^xとy=\log_a x は何に関して対称か',
            choices: [r'原点', r'x軸', r'y軸', r'y=x'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 40,
            questionStatement: r'偶関数は?',
            choices: [
              r'y=\sin{x}',
              r'y=\cos{x}',
              r'y=\tan{x}',
              r'y=\frac{1}{\tan{x}}'
            ],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 36,
            questionStatement: r'(x+y)^7を展開した時x^5y^2の項の係数は?',
            choices: [r'1', r'7', r'21', r'42'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 44,
            questionStatement: r'\sum_{k=1}^43^{k-1}は?',
            choices: [r'13', r'27', r'40', r'121'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 45,
            questionStatement: r'y=\sqrt{\frac{2}{3}}xと直交する直線の傾きは?',
            choices: [
              r'\frac{\sqrt{6}}2',
              r'-\frac{\sqrt{6}}2',
              r'\frac{\sqrt{6}}3',
              r'-\frac{\sqrt{6}}3'
            ],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 33,
            questionStatement: r'A,Bの少なくとも一方が男子であるときAが男子である確率は?',
            choices: [r'\frac{1}2', r'\frac{1}3', r'\frac{1}4', r'\frac{2}3'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 11,
    title: r'数学 - 高3',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 50,
            questionStatement: r'x^2-y^2=3^2上の点(5,4)における接線の方程式は?',
            choices: [r'5x-4y=3', r'5x-4y=9', r'-5x+4y=3', r'-5x+4y=9'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 53,
            questionStatement: r'\lim_{x\to\infty}\frac{\sin{x}}xを求めよ。',
            choices: [r'0', r'1', r'-\infty', r'\infty'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 55,
            questionStatement: r'\int_0^4{\sqrt{16-x^2}}\mathrm{d}xを求めよ。',
            choices: [r'\pi', r'4\pi', r'8\pi', r'16\pi'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 54,
            questionStatement: r'\int{\frac{1}{\cos^{2}x}} \mathrm{d}xを求めよ。',
            choices: [
              r'\frac{1}{\tan{x}}',
              r'-\frac{1}{\tan{x}}',
              r'\tan{x}',
              r'-\tan{x}'
            ],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 49,
            questionStatement:
                r'\alpha\neq\beta,2|z-\alpha|=|z-\beta|を満たすzの表す図形は?',
            choices: [
              r'\alpha,\betaを通る直線',
              r'\alpha,\betaの垂直二等分線',
              r'\alpha,\betaを含む円',
              r'\alpha,\betaを含まない円'
            ],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 56,
            questionStatement: r'y=(f	\circ f^{-1})(x)を求めよ。',
            choices: [r'x=0', r'y=0', r'y=x', r'y=-x'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 51,
            questionStatement: r'x^{2}+\sqrt{3}x+y^2=1が表す図形はどれか',
            choices: [r'放物線', r'円', r'楕円', r'双曲線'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 52,
            questionStatement: r'\sum_{n=1}^{\infty}\frac{1}{3^n} は?',
            choices: [r'\frac{1}{2}', r'\frac{2}{3}', r'1', r'\infty'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 48,
            questionStatement: r'複素数zが純虚数であるための必要十分条件を選べ。',
            choices: [
              r'z=\bar{z}',
              r'z=-\bar{z}',
              r'z\bar{z}=|z|^2',
              r'この中にはない'
            ],
            correctAnswerIndex: 4,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 12,
    title: r'物理 - 高1',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 67,
            questionStatement: r'波の速さvと振動数f,波長\lambdaの関係は?',
            choices: [
              r'v = f\lambda',
              r'\lambda = fv',
              r'v = \frac{f}{\lambda}',
              r'\lambda = \frac{f}{v}'
            ],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 69,
            questionStatement: r'床に静止している物体が受ける重力の反作用として正しいものは?',
            choices: [r'垂直抗力', r'摩擦力', r'物体が床を押す力', r'それ以外'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 62,
            questionStatement: r'初速0、加速度aの等加速度運動でx進んだ時の速さは?',
            choices: [r'ax', r'2ax', r'\sqrt{ax}', r'\sqrt{2ax}'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 63,
            questionStatement: r'北極海の氷と南極大陸の氷、溶けると海水面が上昇するのは?',
            choices: [r'北極海の氷', r'南極大陸の氷', r'どちらも上昇する', r'どちらも上昇しない'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 66,
            questionStatement: r'水中に比べて、真空中での音の伝わる速さは?',
            choices: [r'伝わらない', r'速い', r'遅い', r'同じ'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 65,
            questionStatement: r'単振り子にて、重力はどんな仕事をするか。',
            choices: [r'常に正の仕事', r'常に負の仕事', r'仕事をしない', r'符号が変化する仕事'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 57,
            questionStatement: r'月の重力加速度として最も適切なものを答えよ',
            choices: [r'1.6', r'9.8', r'29', r'59'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 64,
            questionStatement: r'単振り子にて、糸の張力はどんな仕事をするか。',
            choices: [r'常に正の仕事', r'常に負の仕事', r'仕事をしない', r'符号が変化する仕事'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 68,
            questionStatement: r'水面を伝わる波はどのような波か?',
            choices: [r'横波 ', r'縦波', r'定常波', r'どちらでもない'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 13,
    title: r'物理 - 高2',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 71,
            questionStatement: r'大きさFで作用線間の距離がaの偶力のモーメントは?',
            choices: [r'\frac{Fa}{2}', r'Fa', r'2Fa', r'回転軸によって変化する'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 63,
            questionStatement: r'北極海の氷と南極大陸の氷、溶けると海水面が上昇するのは?',
            choices: [r'北極海の氷', r'南極大陸の氷', r'どちらも上昇する', r'どちらも上昇しない'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 76,
            questionStatement: r'外から加えた熱量が全て内部エネルギーに変わるような変化は?',
            choices: [r'定積変化', r'定圧変化', r'等温変化', r'断熱変化'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 72,
            questionStatement: r'ある剛体の重心に働く力のモーメントの総和が0の時、剛体は',
            choices: [r'回転しない', r'平行移動しない', r'静止する', r'回転も移動もする'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 74,
            questionStatement: r'円錐振り子にて、重力はどのような仕事をするか。',
            choices: [r'常に正の仕事', r'常に負の仕事', r'仕事をしない', r'符号が変化する仕事'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 77,
            questionStatement: r'凸面鏡が作る像の種類は?',
            choices: [r'正立虚像', r'倒立虚像', r'正立実像', r'倒立実像'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 73,
            questionStatement: r'反発係数が0の床に小球を斜めに衝突させると小球はどうなるか',
            choices: [r'その場でとどまる', r'床を転がる', r'跳ね返って進む', r'跳ね返って戻る'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 75,
            questionStatement: r'水平バネ振り子について、バネにつけた物体が最も速くなる時は?',
            choices: [r'伸びきったとき', r'縮み切ったとき', r'自然長の時', r'それ以外'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 57,
            questionStatement: r'月の重力加速度として最も適切なものを答えよ',
            choices: [r'1.6', r'9.8', r'29', r'59'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 14,
    title: r'物理 - 高3',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 72,
            questionStatement: r'ある剛体の任意の点に働く力のモーメントの総和が0の時、剛体は',
            choices: [r'回転しない', r'平行移動しない', r'静止する', r'回転も移動もする'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 76,
            questionStatement: r'外から加えた熱量が全て内部エネルギーに変わるような変化は?',
            choices: [r'定積変化', r'低圧変化', r'等温変化', r'断熱変化'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 78,
            questionStatement: r'電池の仕事Wとコンデンサーが蓄える静電エネルギーUの関係は?',
            choices: [r'U=\frac{W}{3}', r'U=\frac{W}{2}', r'U=W', r'U=2W'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 73,
            questionStatement: r'反発係数が0の床に小球を斜めに衝突させると小球はどうなるか',
            choices: [r'その場でとどまる', r'床を転がる', r'跳ね返って進む', r'跳ね返って戻る'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 75,
            questionStatement: r'水平バネ振り子について、バネにつけた物体が最も速くなる時は?',
            choices: [r'伸びきったとき', r'縮み切ったとき', r'自然長の時', r'それ以外'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 79,
            questionStatement: r'一様な磁場中で等速円運動を行う電子の回転周期は?',
            choices: [r'速さ', r'磁束密度', r'質量', r'電子の電気量'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 74,
            questionStatement: r'円錐振り子にて、重力はどのような仕事をするか。',
            choices: [r'常に正の仕事', r'常に負の仕事', r'仕事をしない', r'符号が変化する仕事'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 57,
            questionStatement: r'月の重力加速度として最も適切なものを答えよ',
            choices: [r'1.6', r'9.8', r'29', r'59'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 80,
            questionStatement: r'交流電源にコイルを接続すると、電圧と比べて電流の位相は?',
            choices: [
              r'同位相',
              r'\frac{\pi}{2}遅れる',
              r'\frac{\pi}{2}進む',
              r'\pi進む'
            ],
            correctAnswerIndex: 2,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 15,
    title: r'化学 - 高1',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 81,
            questionStatement: r'砂が混じったヨウ素を加熱して純粋なヨウ素の結晶を得る操作は?',
            choices: [r'分溜', r'再結晶', r'昇華', r'抽出'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 84,
            questionStatement: r'HCl,CO_2,H_2O,CH_4のうち極性分子の個数は?',
            choices: [r'1', r'2', r'3', r'4'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 86,
            questionStatement: r'NaClを0.25molを溶かして100mlとした水溶液のモル濃度は?',
            choices: [r'0.10mol/L', r'1.0mol/L', r'2.0mol/L', r'2.5mol/L'],
            correctAnswerIndex: 4,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 82,
            questionStatement: r'ナトリウムの炎色反応は?',
            choices: [r'赤色', r'黄色', r'橙赤色', r'黄緑色'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 85,
            questionStatement: r'電気伝導性を持つのは?',
            choices: [r'ダイヤモンド', r'グラファイト', r'フラーレン', r'カーボンナノチューブ'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 88,
            questionStatement: r'電離度0.025の0.04mol/Lの酢酸水溶液のpHは?',
            choices: [r'1', r'2', r'3', r'4'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 83,
            questionStatement: r'ネオンの価電子の数は?',
            choices: [r'0', r'2', r'4', r'8'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 87,
            questionStatement: r'塩酸,炭酸,硝酸,硫酸のうち、弱酸の個数は?',
            choices: [r'1', r'2', r'3', r'4'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 89,
            questionStatement: r'次の実験器具のうち、前処理として共洗いが必要な器具を選べ。',
            choices: [r'メスフラスコ', r'三角フラスコ', r'ビュレット', r'コニカルビーカー'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 16,
    title: r'化学 - 高2',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 81,
            questionStatement: r'砂が混じったヨウ素を加熱して純粋なヨウ素の結晶を得る操作は?',
            choices: [r'分溜', r'再結晶', r'昇華', r'抽出'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 91,
            questionStatement: r'27℃,ある圧力で60Lの気体は、127℃,2倍の圧力で何Lか。',
            choices: [r'30L', r'40L', r'60L', r'80L'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 95,
            questionStatement: r'陰極Ag,陽極C,NaCl水溶液を用いて電気分解すると陽極で発生するのは?',
            choices: [r'H_2', r'Cl_2', r'Ag', r'何も発生しない'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 90,
            questionStatement: r'次の粒子間に働く力のうち一般に3番目に力が強いのは?',
            choices: [r'水素結合', r'金属結合', r'共有結合', r'ファンデルワールス力'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 96,
            questionStatement: r'N_2O_4\iff2NO_2で平衡であるとき、加圧させるとどうなる?',
            choices: [r'N_2O_4が増える', r'NO_2が増える', r'変わらない', r'どちらも増える'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 92,
            questionStatement: r'等濃度の食塩水、酢酸水溶液、スクロース水溶液で沸点が最も高いのは?',
            choices: [r'食塩水', r'酢酸水溶液', r'スクロース水溶液', r'全て等しい'],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 93,
            questionStatement: r'ゾルを選べ。',
            choices: [r'塩酸', r'豆腐', r'寒天', r'生卵'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 94,
            questionStatement: r'鉛蓄電池の負極板は?',
            choices: [r'Pb', r'PbSO_4', r'PbO_2', r'PbS'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 89,
            questionStatement: r'次の実験器具のうち、前処理として共洗いが必要な器具を選べ。',
            choices: [r'メスフラスコ', r'三角フラスコ', r'ビュレット', r'コニカルビーカー'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
  BigQuestionSet(
    id: 17,
    title: r'化学 - 高3',
    questions: [
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 93,
            questionStatement: r'ゾルを選べ。',
            choices: [r'塩酸', r'豆腐', r'寒天', r'生卵'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 59,
            questionStatement: r'AgBrの色は何色でしょうか。',
            choices: [r'赤褐色', r'白色', r'淡黄色', r'黒紫色'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 99,
            questionStatement: r'ヨードホルム反応で検出出来ない有機化合物を選べ。',
            choices: [r'エタノール', r'アセトン', r'酢酸', r'2-プロパノール'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 94,
            questionStatement: r'鉛蓄電池の負極板は?',
            choices: [r'Pb', r'PbSO_4', r'PbO_2', r'PbS'],
            correctAnswerIndex: 3,
          ),
          SmallQuestionItem(
            id: 97,
            questionStatement: r'次のハロゲン化水素のうち最も沸点が低いものを選べ。',
            choices: [r'HF', r'HCl', r'HBr', r'HI'],
            correctAnswerIndex: 2,
          ),
          SmallQuestionItem(
            id: 100,
            questionStatement: r'FeCl_3水溶液に加えて呈色するものを選べ。',
            choices: [r'ピクリン酸', r'o-クレゾール', r'ベンジルアルコール', r'エタノール'],
            correctAnswerIndex: 2,
          ),
        ],
      ),
      BigQuestionItem(
        id: 0,
        category: QuestionCategory.forHs,
        questions: [
          SmallQuestionItem(
            id: 96,
            questionStatement: r'N_2O_4\iff2NO_2で平衡であるとき、加圧させるとどうなる?',
            choices: [r'N_2O_4が増える', r'NO_2が増える', r'変わらない', r'どちらも増える'],
            correctAnswerIndex: 1,
          ),
          SmallQuestionItem(
            id: 98,
            questionStatement: r'オストワルト法で使われる触媒は?',
            choices: [r'MnO_2', r'V_2O_5', r'Fe_3O_4', r'Pt'],
            correctAnswerIndex: 4,
          ),
          SmallQuestionItem(
            id: 101,
            questionStatement: r'C_{4}H_{10}O（不飽和度0）の分子式を持つエーテルの個数は?',
            choices: [r'1', r'2', r'3', r'4'],
            correctAnswerIndex: 3,
          ),
        ],
      ),
    ],
    category: QuestionCategory.forHs,
  ),
];

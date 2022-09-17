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
  (ref) => <BigQuestionSet>[
  // 問題のほとんどは消去してあります。
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
  ],
);

final questions = <BigQuestionSet>[
];

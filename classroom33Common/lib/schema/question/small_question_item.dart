/// ## 1つの小問データ
class SmallQuestionItem {
  SmallQuestionItem({
    required this.id,
    required this.questionStatement,
    required this.choices,
    required this.correctAnswerIndex,
  });
  factory SmallQuestionItem.fromJson(Map<String, dynamic> j) {
    return SmallQuestionItem(
      id: int.parse(j['id'].toString()),
      questionStatement: j['statement'].toString(),
      choices: List<String>.generate(
        (j['choices'] as List).length,
        (index) => (j['choices'] as List)[index].toString(),
      ),
      correctAnswerIndex: j['correct_answer_index'] as int,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'statement': questionStatement,
        'choices': choices,
        'correct_answer_index': correctAnswerIndex,
      };

  /// 小問ID
  final int id;

  /// 問題文
  final String questionStatement;

  /// 選択肢(4つ)
  final List<String> choices;

  /// 正解の選択肢のインデックス
  /// インデックスであることに注意(0~3)
  final int correctAnswerIndex;
}

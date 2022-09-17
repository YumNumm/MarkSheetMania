import '../question/small_question_item.dart';

class SmallQuestionResultItem extends SmallQuestionItem {
  SmallQuestionResultItem({
    required super.id,
    required super.questionStatement,
    required super.choices,
    required super.correctAnswerIndex,
    required this.point,
    required this.correctAnswerCount,
    required this.incorrectAnswerCount,
  });

  factory SmallQuestionResultItem.fromJson(Map<String, dynamic> j) =>
      SmallQuestionResultItem(
        id: int.parse(j['id'].toString()),
        questionStatement: j['questionStatement'].toString(),
        choices: List<String>.generate(
          (j['choices'] as List).length,
          (index) => (j['choices'] as List)[index].toString(),
        ),
        correctAnswerIndex: int.parse(j['correctAnswerIndex'].toString()),
        point: int.parse(j['point'].toString()),
        correctAnswerCount: int.parse(j['correctAnswerCount'].toString()),
        incorrectAnswerCount: int.parse(j['incorrectAnswerCount'].toString()),
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'statement': questionStatement,
        'choices': choices,
        'correct_answer_index': correctAnswerIndex,
        'point': point,
        'correct_answer_count': correctAnswerCount,
        'incorrect_answer_Count': incorrectAnswerCount,
      };

  /// この小問に対する得点
  final int point;

  /// 正解数
  final int correctAnswerCount;

  /// 誤答数
  final int incorrectAnswerCount;
}

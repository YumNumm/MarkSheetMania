class UserModel {
  UserModel({
    required this.bigQuestionGroupId,
    required this.numberOfPeople,
    required this.id,
    required this.createdAt,
    required this.totalPoint,
    required this.result,
    required this.rideId,
  });
  factory UserModel.fromJson(Map<String, dynamic> j) => UserModel(
        bigQuestionGroupId: int.parse(j['big_question_group_id'].toString()),
        numberOfPeople: int.parse(j['number_of_people'].toString()),
        id: int.parse(j['id'].toString()),
        createdAt: DateTime.parse(j['created_at'].toString()),
        totalPoint: int.tryParse(j['total_point'].toString()),
        result: QuestionsResult.fromJson(j['result'] as Map<String, dynamic>),
        rideId: int.parse(j['ride_id'].toString()),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'created_at': createdAt.toIso8601String(),
        'total_point': totalPoint,
        'number_of_people': numberOfPeople.toString(),
        'ride_id': rideId,
      };

  /// 大問グループID
  final int bigQuestionGroupId;

  /// 参加人数
  final int numberOfPeople;

  /// ユーザID
  final int id;

  /// 登録日時
  final DateTime createdAt;

  final int rideId;

  /// 合計点(確定するまではnull
  /// 大問3で計算する
  final int? totalPoint;

  /// 結果
  final QuestionsResult result;
}

class QuestionsResult {
  QuestionsResult({
    required this.items,
  });

  factory QuestionsResult.fromJson(Map<String, dynamic> j) => QuestionsResult(
        items: j['items'] == null
            ? []
            : List<QuestionResult>.generate(
                (j['items'] as List).length,
                (index) => QuestionResult.fromJson(
                  (j['items'] as List)[index] as Map<String, dynamic>,
                ),
              ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'items': items.map((e) => e.toJson()).toList(),
      };

  /// 0~8個の配列
  final List<QuestionResult> items;
}

class QuestionResult {
  QuestionResult({
    required this.correctCount,
    required this.wrongCount,
  });

  factory QuestionResult.fromJson(Map<String, dynamic> j) => QuestionResult(
        correctCount: int.parse(j['correct_count'].toString()),
        wrongCount: int.parse(j['wrong_count'].toString()),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'correct_count': correctCount,
        'wrong_count': wrongCount,
      };

  int get toPoint => correctCount * 8 + wrongCount * 1;

  /// 正答数
  final int correctCount;

  /// 誤答数
  final int wrongCount;
}

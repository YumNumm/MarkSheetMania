class StateItem {
  StateItem({
    required this.position,
    required this.bigQuestionState,
    required this.bigQuestionGroupId,
    required this.userId,
  });

  factory StateItem.fromJson(Map<String, dynamic> j) => StateItem(
        position: DevicePosition.values.firstWhere(
          (element) => element.name == j['position'].toString(),
        ),
        bigQuestionState: BigQuestionState.values.firstWhere(
          (element) => element.name == j['big_question_state'].toString(),
        ),
        bigQuestionGroupId: int.tryParse(j['big_question_group_id'].toString()),
        userId: int.tryParse(j['user_id'].toString()),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'position': position.name,
        'big_question_state': bigQuestionState.name,
        'big_question_group_id': bigQuestionGroupId,
        'user_id': userId,
      };

  /// 当該デバイスの位置
  final DevicePosition position;

  /// デバイスの状態
  final BigQuestionState bigQuestionState;

  /// 問題番号
  final int? bigQuestionGroupId;

  /// ユーザID
  final int? userId;
}

enum BigQuestionState {
  /// 移動中(Controllerによる登録処理待ち)
  waitingForController,

  /// 一斉開始待ち(Adminによる開始処理待ち)
  waitingForAdmin,

  /// 実行開始
  running,
}

enum DevicePosition {
  projector1,
  projector2,
  projector3;
}

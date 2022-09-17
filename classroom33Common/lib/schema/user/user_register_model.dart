class UserRegisterModel {
  UserRegisterModel({
    required this.numberOfPeople,
    required this.bigQuestionGroupId,
    required this.rideId,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        'big_question_group_id': bigQuestionGroupId,
        'ride_id': rideId,
        'number_of_people': numberOfPeople,
        'results': null,
        'total_point': null,

      };

  final int bigQuestionGroupId;
  final int numberOfPeople;
  final int rideId;
}

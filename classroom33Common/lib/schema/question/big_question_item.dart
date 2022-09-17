import 'question_category.dart';
import 'small_question_item.dart';

/// ## 1つの大問データ
/// `question`テーブルで利用(?)
class BigQuestionItem {
  BigQuestionItem({
    required this.id,
    required this.category,
    required this.questions,
  });

  factory BigQuestionItem.fromJson(Map<String, dynamic> j) => BigQuestionItem(
        id: int.parse(j['id'].toString()),
        category: QuestionCategory.values
            .firstWhere((e) => e.name == j['category'].toString()),
        questions: List<SmallQuestionItem>.generate(
          (j['questions'] as List).length,
          (index) => SmallQuestionItem.fromJson(
            (j['questions'] as List)[index] as Map<String, dynamic>,
          ),
        ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'category': category.name,
        'questions': questions.map((e) => e.toJson()).toList(),
      };

  /// 大問ID
  final int id;

  /// 大問カテゴリ
  final QuestionCategory category;

  /// 小問リスト
  final List<SmallQuestionItem> questions;
}

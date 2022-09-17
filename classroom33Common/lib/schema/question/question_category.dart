


enum QuestionCategory {
  forJhs(
    '中学向け学問',
    'assets/category_logo/image30.png',
  ),
  forHs(
    '高校向け学問',
    'assets/category_logo/image31.png',
  ),
  trivia(
    '雑学',
    'assets/category_logo/image32.png',
  ),
  topicsOfTheDay('時事問題', 'assets/category_logo/image33.png');

  const QuestionCategory(this.title, this.imagePath);
  final String title;
  final String imagePath;
}

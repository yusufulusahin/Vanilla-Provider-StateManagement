class OnBoardModel {
  final String title;
  final String title2;
  final String imageName;

  OnBoardModel(
      {required this.title, required this.title2, required this.imageName});

  String get imageWithPath => 'assets/images/$imageName.jpeg';
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel(
        title: 'Live Could Be Dream',
        title2: 'With Jeep...',
        imageName: 'images3'),
    OnBoardModel(
        title: 'Live Could Be Dream',
        title2: 'With Jeep...',
        imageName: 'images2'),
    OnBoardModel(
      title: 'Live Could Be Dream',
      title2: 'With Jeep...',
      imageName: 'images',
    )
  ];
}

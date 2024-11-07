class ContentModel {
  String title;
  String subTitle;
  String startDate;
  String endDate;
  String address;
  List<String> descPoints;
  List<String>? tags;

  ContentModel(
      {required this.title,
      required this.subTitle,
      required this.startDate,
      required this.endDate,
      required this.address,
      required this.descPoints,
      this.tags});
}

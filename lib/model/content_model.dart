class ContentModel {
  String title;
  String subTitle;
  String startDate;
  String endDate;
  String address;
  List<String> descPoints;
  List<String> tags;

  ContentModel(
      {this.title,
      this.subTitle,
      this.startDate,
      this.endDate,
      this.address,
      this.descPoints,
      this.tags});
}

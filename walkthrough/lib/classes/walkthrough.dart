class Walkthrough {
  final String pageColor;
  final String title;
  final String titleFont;
  final String titleColor;
  final String description;
  final String descriptionFont;
  final String descriptionColor;
  final double titleSize;
  final double descriptionSize;
  final imageIcon;

  Walkthrough(
      {this.titleFont = "Lato",
      this.descriptionFont = "Lato",
      this.pageColor = "#195599",
      this.title = "",
      this.titleColor = "#ffffff",
      this.titleSize = 25.0,
      this.descriptionSize = 16.0,
      this.description = "",
      this.descriptionColor = "#ffffff",
      this.imageIcon});
}

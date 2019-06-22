
class Page{
  final String bgColor;
  final String indicatorColor;
  final String indicatorSelectorColor;
  final String skipButtonText;
  final String skipButtonFont;
  final String skipButtonColor;
  final double skipButtonSize;
  final String nextButtonText;
  final String nextButtonFont;
  final String nextButtonColor;
  final double nextButtonSize;
  final String lastButtonFont;
  final String lastButtonColor;
  final double lastButtonSize;
  final String lastNextButton;

  Page({
    this.bgColor="#ffffff",
    this.indicatorColor="#ffffff",
    this.indicatorSelectorColor="#195599",
    this.skipButtonText = "SKIP",
    this.skipButtonColor="#195599",
    this.skipButtonFont="Lato",
    this.skipButtonSize=20.0,
    this.nextButtonColor="#195599",
    this.nextButtonFont="Lato",
    this.nextButtonSize=20.0,
    this.nextButtonText = "NEXT",
    this.lastNextButton = "FINISH",
    this.lastButtonColor="#1f8e2f",
    this.lastButtonFont="Lato",
    this.lastButtonSize=20.0,
  });
}

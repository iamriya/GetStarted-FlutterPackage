library get_started;

import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'classes/walkthrough.dart';
import 'classes/page.dart';

class GetStarted extends StatefulWidget {
  final GestureTapCallback onSkipPress;
  final GestureTapCallback onFinishPress;
  List<Walkthrough> pageList;
  IndicatorShape indicatorShape;
  Page pg = new Page();

  GetStarted({@required List<Walkthrough> pageList, Page pageStyle, IndicatorShape indicatorShape,
      this.onFinishPress, this.onSkipPress}) {
    this.pageList = pageList;
    this.pg = pageStyle == null ? pg : pageStyle;
    this.indicatorShape = indicatorShape == null
        ? IndicatorShape.circle(size: 11.0)
        : indicatorShape;
  }

  @override
  _GetStartedState createState() => _GetStartedState(this.pageList, this.pg,
      this.indicatorShape, this.onFinishPress, this.onSkipPress);
}

class _GetStartedState extends State<GetStarted> {
  PageController pgController = new PageController();
  Page pg;
  GestureTapCallback onSkipPress;
  GestureTapCallback onFinishPress;
  List<Walkthrough> pageList;
  IndicatorShape indicatorShape;
  bool lastPage = false;

  _GetStartedState(this.pageList, this.pg, this.indicatorShape,
      this.onFinishPress, this.onSkipPress);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: hexToColor(pg.bgColor),
        body: PageIndicatorContainer(
          pageView: PageView(
            controller: pgController,
            children: _createChildren(),
            onPageChanged: (int index) {
              setState(() {
                lastPage = index == pageList.length - 1 ? true : false;
              });
            },
          ), //PageView
          length: pageList.length,
          indicatorColor: hexToColor(pg.indicatorColor),
          indicatorSelectorColor: hexToColor(pg.indicatorSelectorColor),
          shape: indicatorShape,
        ), //PageIndicatorContainer

        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                      title: Text(
                        pg.skipButtonText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: hexToColor(pg.skipButtonColor),
                            fontFamily: pg.skipButtonFont,
                            fontSize: pg.skipButtonSize),
                      ),
                      onTap: () {
                        onSkipPress();
                      }),
                ),
                Expanded(
                    child: lastPage
                        ? ListTile(
                            title: Text(
                              pg.lastNextButton,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: hexToColor(pg.lastButtonColor),
                                  fontFamily: pg.lastButtonFont,
                                  fontSize: pg.lastButtonSize),
                            ),
                            onTap: () {
                              onFinishPress();
                            },
                          )
                        : ListTile(
                            title: Text(
                              pg.nextButtonText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: hexToColor(pg.nextButtonColor),
                                  fontFamily: pg.nextButtonFont,
                                  fontSize: pg.nextButtonSize),
                            ),
                            onTap: () {
                              setState(() {
                                pgController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Cubic(0.5, 0.5, 0.5, 0.5));
                              });
                            },
                          ))
              ],
            )) //Padding,

        );
  } //build()

  List<Widget> _createChildren() {
    return new List<Widget>.generate(pageList.length, (int index) {
      return getView(
          pageList[index].pageColor,
          pageList[index].title,
          pageList[index].titleColor,
          pageList[index].titleFont,
          pageList[index].titleSize,
          pageList[index].description,
          pageList[index].descriptionColor,
          pageList[index].descriptionFont,
          pageList[index].descriptionSize,
          pageList[index].imageIcon);
    });
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Card getView(
      String pageColor,
      String title,
      String titleColor,
      String titleFont,
      double titleSize,
      String description,
      String descriptionColor,
      String descriptionFont,
      double descriptionSize,
      Widget icon) {
    return Card(
      color: hexToColor(pageColor),
      elevation: 12.0,
      margin: EdgeInsets.all(30.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: SizedBox(
                  child: Text(
                    "$title",
                    style: TextStyle(
                        fontSize: titleSize,
                        color: hexToColor(titleColor),
                        fontFamily: titleFont),
                  ),
                  height: 70.0,
                ),
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Text(
                          "$description",
                          style: TextStyle(
                              fontSize: descriptionSize,
                              color: hexToColor(descriptionColor),
                              fontFamily: descriptionFont),
                          textAlign: TextAlign.justify,
                        ),
                        //height: 200.0,
                      ))),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(height: 100.0, child: icon),
              )
            ],
          )),
    ); //Card
  }
}

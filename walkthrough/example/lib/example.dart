import 'package:flutter/material.dart';
import 'package:get_started/classes/walkthrough.dart';
import 'package:get_started/classes/page.dart';
import 'package:get_started/get_started.dart';
import 'package:page_indicator/page_indicator.dart';

void main() {
  runApp(new MyApp1());
}

class MyApp1 extends StatefulWidget {
  //All the properties defined for 'page' have some default values. Hence, you may skip some size, etc. if you wish to!
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  Page pageObj = new Page(
      bgColor: "#ffffff",
      indicatorColor: "#ffffff",
      indicatorSelectorColor: "#195599",
      nextButtonText: "NEXT",
      nextButtonColor: "#195599",
      nextButtonFont: "Lato",
      nextButtonSize: 20.0,
      skipButtonText: "SKIP",
      skipButtonFont: "Lato",
      skipButtonColor: "#195599",
      skipButtonSize: 20.0,
      lastNextButton:
          "FINISH", //You may also write "GOT IT" or whatever you wish :)
      lastButtonColor: "#1f8e2f",
      lastButtonFont: "Lato",
      lastButtonSize: 20.0);

  List<Walkthrough> pageList = [
    Walkthrough(
        pageColor: "#48C9B0",
        title: "Welcome!",
        titleFont:
            "Lato", //Don't forget to include yours fonts in pubspec.yaml file.
        titleColor: "#ffffff", //Pass the colours as strings of their hex codes.
        titleSize: 25.0,
        description:
            "This is a Scrollable Text Widget. Hence, don't worry if your description goes long. :) \n\nA Page has three sections for Title, Description and an Icon respectively that can be customized for the text, font, color and size.\n\nAll the properties defined for 'walkthrough' have some default values. Hence, you may skip some size, etc. if you wish to!",
        descriptionFont: "Lato",
        descriptionColor: "#ffffff",
        descriptionSize: 16.0,
        imageIcon: Icon(
          Icons.computer,
          color: Colors.white,
          size: 100.0,
        )),
    Walkthrough(
        pageColor: "#EC7063",
        title: "Add a photo!",
        description: "Building your memory lane with your photographs. :)",
        imageIcon: Icon(
          Icons.add_a_photo,
          color: Colors.white,
          size: 100.0,
        )),
    Walkthrough(
        pageColor: "#F4D03F",
        title: "Documents",
        description: "Store your files safe and sound here.",
        imageIcon: Icon(
          Icons.description,
          color: Colors.white,
          size: 100.0,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Getting Started",
            style: TextStyle(fontFamily: "Lato"),
          ),
          backgroundColor: Color(0xff195599),
        ), //appBar

        //Required Field
        //body: GetStarted(pageList : pageList),

        //Required Field with Optional parameters
        body: GetStarted(
            pageList: pageList,
            pageStyle: pageObj,
            indicatorShape: IndicatorShape.circle(size: 12.0),
            onFinishPress: _finishPress,
            onSkipPress: _skipPress),
      ),
    );
  }

  void _skipPress() {
    //define your skipButton functionality here.
  }

  void _finishPress() {
    //define your lastNextButton functionality here.
  }
}

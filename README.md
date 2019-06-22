# Flutter Getting Started Layout

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/25283ed8fd2b4f65b86dd1124632bf2b)](https://app.codacy.com/app/iamriya/GetStarted-FlutterPackage?utm_source=github.com&utm_medium=referral&utm_content=iamriya/GetStarted-FlutterPackage&utm_campaign=Badge_Grade_Dashboard)

A Custom Getting Started Layout with custom Fonts and Colors.

## Preview

![The example app running in Android](https://github.com/MobMaxime/GetStarted-FlutterPackage/blob/master/walkthrough/gif/GettingStarted.gif)

## Installing

1.  Add dependency to `pubspec.yaml`

    *Get the latest version in the 'Installing' tab on pub.dartlang.org*
    
```dart
dependencies:
    get_started: 0.0.1
```

2.  Import the packages

```dart
import 'package:get_started/classes/walkthrough.dart';
import 'package:get_started/classes/page.dart';
import 'package:get_started/get_started.dart';
import 'package:page_indicator/page_indicator.dart';
```

3.  Adding GetStarted layout

#With required parameters#

```dart
   //In the body of your MaterialApp,
   
    body: GetStarted(pageList, pageObj, IndicatorShape.circle(size: 12.0),
               onFinishPress: _finishPress, onSkipPress: _skipPress),
               
   //Defining below functionalities is for the user.
   
     void _skipPress() {
       //define your skipButton functionality here.
     }
     
     //By default, nextButton functionality is defined, to move to Next Page.
   
     void _finishPress() {
       //define your lastNextButton functionality here.
     }            
  ```         

#With optional parameters#

```dart
   //All the properties defined for 'page' have some default values. Hence, you may skip some size, etc. if you wish to! But defining a pageObj of page class is a must, so as to pass it as a parameter in GetStarted().
        
          page pageObj = new page(
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
              
   //A Page has three sections for Title, Description and an Icon respectively that can be customized for the text, font, color and size.
      
    final List<walkthrough> pageList = [
        walkthrough(
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
            ))
        ];    
 ```   

## How to use
Check out the **example** app in the [example](example) directory or the 'Example' tab on pub.dartlang.org for a more complete example.

```dart
//Example how to use

          @override
            Widget build(BuildContext context) {
              return new MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  //Required Field
                  body: GetStarted(pageList : pageList),
                  
                  //Required Field with Optional
                  body: GetStarted(pageList : pageList, pageStyle: pageObj, indicatorShape : IndicatorShape.circle(size: 12.0),
                  onFinishPress: _finishPress, onSkipPress: _skipPress),
                ),
              );
            }
            
          void _skipPress() {
                //define your skipButton functionality here.
          }
            
          void _finishPress() {
                //define your lastNextButton functionality here.
          }
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

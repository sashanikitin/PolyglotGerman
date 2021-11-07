import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../Model/sentence.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FirstPageState createState() => _FirstPageState(FirstSentence());
}

class _FirstPageState extends State<FirstPage> {
  int _counter = 0;
  int _counterRight = 0;
  String _string = "";
  bool _visibleFloatButton = true;
  late FirstSentence _sentence;
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller =
      TextEditingController(text: 'Hello world');

  _FirstPageState(FirstSentence sentence) {
    _sentence = sentence;
    tts.setLanguage('de');
    tts.setSpeechRate(0.4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: bodyBuild(_sentence),
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(
                      left: 7.0, right: 7.0, top: 7, bottom: 7),
                  width: 160.0, //60 for Android
                  height: 160.0,
                  child: new Visibility(
                      visible: _visibleFloatButton,
                      child: FloatingActionButton(
                          heroTag: "btn1",
                          backgroundColor: Colors.yellow,
                          splashColor: Colors.red,
                          onPressed: () => _clear(),
                          tooltip: 'Push',
                          child: AutoSizeText(
                            //sentence.result,
                            "Cancel",
                            style: TextStyle(fontSize: 50),
                          )))),
              Container(
                  margin: const EdgeInsets.only(
                      left: 7.0, right: 7.0, top: 7, bottom: 7),
                  width: 160.0, //60 for Android
                  height: 160.0,
                  child: new Visibility(
                      visible: _visibleFloatButton,
                      child: FloatingActionButton(
                        heroTag: "btn2",
                        backgroundColor: Colors.red,
                        splashColor: Colors.yellow,
                        onPressed: () => _showToast(context),
                        tooltip: 'Push',
                        child: AutoSizeText(
                          //sentence.result,
                          "Enter",
                          style: TextStyle(fontSize: 50),
                        ),
                      ))),
              // This trailing comma makes auto-formatting nicer for build methods.
            ]));
  }

  Widget bodyBuild(FirstSentence sentence) {
    List<Widget> rows = [];
    List<Widget> buttons = [];
    List<Widget> buttons2 = [];
    rows.add(Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.blueAccent)),
        child: Center(
            child: AutoSizeText(
          sentence.task,
          style: TextStyle(fontSize: 50),
        )),
      ),
    ));

    rows.add(
      Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.blueAccent)),
          child: Center(
              child: AutoSizeText(
            //sentence.result,
            _string,
            style: TextStyle(fontSize: 50),
          )),
        ),
      ),
    );
    for (int i = 0; i < 3; i++) {
      buttons.add(
        Expanded(
          flex: 1,
          child: Container(
            margin:
                const EdgeInsets.only(left: 7.0, right: 7.0, top: 7, bottom: 7),
            child: ElevatedButton(
              child: AutoSizeText(
                sentence.words[0][i],
                //style: TextStyle(fontSize: 30),
                style: TextStyle(fontSize: 60),
              ),
              onPressed: () => _onClick(sentence.words[0][i]),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                side: BorderSide(width: 3, color: Colors.brown),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ),
      );
    }

    rows.add(Expanded(
        flex: 3,
        child: Container(color: Colors.yellow, child: Row(children: buttons))));

    for (int i = 0; i < 3; i++) {
      buttons2.add(
        Expanded(
          flex: 1,
          child: Container(
            margin:
                const EdgeInsets.only(left: 7.0, right: 7.0, top: 7, bottom: 7),
            child: ElevatedButton(
              child: AutoSizeText(
                sentence.words[1][i],
                //style: TextStyle(fontSize: 30),
                style: TextStyle(fontSize: 60),
              ),
              onPressed: () => _onClick(sentence.words[1][i]),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                side: BorderSide(width: 3, color: Colors.brown),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ),
      );
    }

    rows.add(Expanded(
        flex: 3,
        child:
            Container(color: Colors.yellow, child: Row(children: buttons2))));
    rows.add(Expanded(flex: 3, child: Container()));
    return Column(children: rows);
  }

  void _onClick(String string) {
    if (_string == "") {
      _string += string;
    } else {
      _string += " " + string;
    }
    tts.speak(_string);
    setState(() {});
  }

  void _showToast(BuildContext context) {
    _counter++;
    setState(() {
      _visibleFloatButton = false;
    });
    int duration;
    String string;
    Color color;
    if (_string == _sentence.result) {
      _counterRight++;
      string = "Gut gemacht!";
      color = Colors.yellow;
      duration = 2;
    } else {
      string = "Schlecht! " + _sentence.result;
      color = Colors.red;
      duration = 4;
    }

    Future.delayed(Duration(seconds: 1), () {
      tts.speak(string);
    });

    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Container(
            height: 50.0,
            child: AutoSizeText(
              string,
              //style: TextStyle(fontSize: 30),
              style: TextStyle(fontSize: 60),
            )),
        backgroundColor: color,
        duration: Duration(seconds: duration),
        action: SnackBarAction(
            label: '$_counterRight/$_counter ',
            onPressed: scaffold.hideCurrentSnackBar),
      ),
    );

    Future.delayed(Duration(seconds: duration), () {
      if (_counter >= 3) {
        Navigator.pop(context);
        return;
      }
      _sentence = FirstSentence();
      _string = "";
      setState(() {
        _visibleFloatButton = true;
      });
    });
  }

  void _clear() {
    _string = "";
    setState(() {
      _visibleFloatButton = true;
    });
  }
}

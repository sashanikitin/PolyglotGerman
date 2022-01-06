import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'first_page.dart';

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Learning German';

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 6,
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FirstPage(title: 'Learning basic')),
                      );
                    },
                    child: AutoSizeText(
                      "Learning Basic",
                      style: TextStyle(fontSize: 40),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        // fixedSize: const Size(300, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ))),
          /////////////////////////////////////////////////////////////////////////////////////////////////
          Expanded(
              flex: 1,
              child:SizedBox()
          ),
          /////////////////////////////////////////////////////////////////////////////////////////////////
          Expanded(
              flex: 6,
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FirstPage(title: 'Learning words')),
                      );
                    },
                    child: AutoSizeText(
                      "Learning words",
                      style: TextStyle(fontSize: 40),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        // fixedSize: const Size(300, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ))),
          ////////////////////////////////////////////////////////////////////////////////////////////////
      Expanded(
        flex: 1,
        child:SizedBox()
      ),
          /////////////////////////////////////////////////////////////////////////////////////////////////
          Expanded(
              flex: 6,
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FirstPage(title: 'Settings')),
                      );
                    },
                    child: AutoSizeText(
                      "Settings",
                      style: TextStyle(fontSize: 40),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        // fixedSize: const Size(300, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ))),
          ////////////////////////////////////////////////////////////////////////////////////////////////
        ],
      ),
    );
  }
}

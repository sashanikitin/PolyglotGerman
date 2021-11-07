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
      body:ListView(
          children: <Widget>[
        Container(
        height: 100.0,
        child:
            ListTile(
              leading: Icon(Icons.map),
              title:  ElevatedButton(
                child: Text('First Lesson'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FirstPage(title: 'First Lesson')),
                  );
                },
              ),
            )),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      );

  }
}


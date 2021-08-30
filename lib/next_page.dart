import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  NextPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("次の画面"),
      ),
      body: Container(
        color: Colors.yellow,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title),
              Center(
                child: RaisedButton(
                  child: Text('戻る'),
                  onPressed: () {
                    Navigator.pop(context, "return value");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

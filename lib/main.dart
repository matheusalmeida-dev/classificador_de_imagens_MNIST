import 'package:flutter/material.dart';
import './pages/upload_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List tabs = [
    UploadImage(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.deepPurple,
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.supervisor_account,
                  color: Colors.white,
                  size: 28,
                ),
                Text("Matheus Almeida - Denis Barbosa - Carlos Bruno",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
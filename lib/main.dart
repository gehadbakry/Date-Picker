import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static DateTime selecteddate = DateTime.now();

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    ).then((value) {
        setState(() {
          selecteddate = value;
        });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Date Picker",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: RaisedButton(
              child: Text(
                "Pick you Date!",
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blueGrey.shade700)),
              onPressed: datePicker,
            ),
          ),
          Center(
            child: Text(
              "${DateFormat('yyyy-MM-dd ').format( selecteddate)}",
              style: TextStyle(fontSize: 40, color: Colors.blue),
            ),
          )
        ],
      )),
    );
  }
}

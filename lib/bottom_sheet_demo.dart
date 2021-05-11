
import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => new _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersistantBottomSheetCallBack;

  @override
  void initState() {
    super.initState();
    _showPersistantBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersistantBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return new Container(
        height: 200.0,
        color:Colors.teal[100],
        child: Center(
          child: Text("Drag Downwards Or Back To Dismiss Sheet",
            style: TextStyle(fontSize: 18,color: Colors.black),
            textAlign: TextAlign.center,),
        ),
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showPersistantBottomSheetCallBack = _showBottomSheet;
        });
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.cyan[200] ,
        title:  Text("Flutter Persistent BottomSheet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child:  RaisedButton(
              color: Colors.teal[100],
              onPressed: _showPersistantBottomSheetCallBack,
              child: Text("Show Persistent BottomSheet",
                style: TextStyle(color: Colors.black),
              ),
            )),
      ),
    );
  }
}
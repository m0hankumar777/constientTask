import 'package:flutter/material.dart';
import 'package:task1/view/screens/crudOperation.dart';
import 'package:task1/view/screens/hookScreen.dart';
import 'package:task1/view/screens/retrofit_login.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Task",
        ),
      ),
      body: Center(
        child: Container(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                elevation: 8,
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CrudOperation()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "CRUD using hive",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
              RaisedButton(
                elevation: 8,
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RetrofitLogin()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text("Retrofit Post api"),
              ),
              RaisedButton(
                elevation: 8,
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HookExample()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text("flutter Hook"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

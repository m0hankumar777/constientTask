import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class CrudOperation extends StatefulWidget {
  const CrudOperation({Key? key}) : super(key: key);

  @override
  _CrudOperationState createState() => _CrudOperationState();
}

class _CrudOperationState extends State<CrudOperation> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final updateNameController = TextEditingController();
  final updateIdController = TextEditingController();
  List _data = [];
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonBar(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CRUD"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: isLoad
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (_data.length != 0)
                      ? ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_data[index]["id"]),
                                  Container(
                                      width: 150,
                                      child: Text(_data[index]["name"])),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isLoad = true;
                                        });
                                        deleteData(index);
                                      },
                                      icon: Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                                    child: Container(
                                                  height: 350,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                                hintText: "id"),
                                                        controller:
                                                            updateIdController,
                                                      ),
                                                      TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                                hintText:
                                                                    "Name"),
                                                        controller:
                                                            updateNameController,
                                                      ),
                                                      RaisedButton(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        color: Colors.green,
                                                        onPressed: () {
                                                          setState(() {
                                                            isLoad = true;
                                                          });
                                                          var data = {
                                                            "id":
                                                                updateIdController
                                                                    .text,
                                                            "name":
                                                                updateNameController
                                                                    .text
                                                          };
                                                          update(index, data);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("update"),
                                                      )
                                                    ],
                                                  ),
                                                )));
                                      },
                                      icon: Icon(Icons.edit_outlined))
                                ],
                              ),
                            );
                          })
                      : Center(
                          child: Text("No data Found"),
                        )),
          Container(
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "id"),
                  controller: idController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Name"),
                  controller: nameController,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ButtonBar buttonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          elevation: 8,
          color: Colors.green,
          onPressed: () {
            var data = {"id": idController.text, "name": nameController.text};
            create(data);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "create",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        RaisedButton(
          elevation: 8,
          color: Colors.green,
          onPressed: () {
            setState(() {
              isLoad = true;
            });
            read();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "Read",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
      ],
    );
  }

  void create(Map<String, String> data) {
    var box = Hive.box('crud');
    box.add(data);
    showtost("Successfully added");
  }

  void read() {
    var box = Hive.box('crud');
    List hiveData = box.values.toList();
    print(hiveData);
    setState(() {
      _data = hiveData;
      Timer(Duration(seconds: 1), () {
        setState(() {
          isLoad = false;
        });
      });
    });
  }

  void deleteData(int index) {
    var box = Hive.box('crud');
    box.deleteAt(index);
    List hiveData = box.values.toList();
    print(hiveData);
    setState(() {
      _data = hiveData;
      Timer(Duration(seconds: 1), () {
        setState(() {
          isLoad = false;
        });
      });
    });
  }

  void update(int index, Map<String, String> data) {
    var box = Hive.box('crud');
    box.putAt(index, data);
    List hiveData = box.values.toList();
    print(hiveData);
    setState(() {
      _data = hiveData;
      Timer(Duration(seconds: 1), () {
        setState(() {
          isLoad = false;
        });
      });
    });
  }

  showtost(String msg) => Fluttertoast.showToast(msg: msg, fontSize: 18);
}

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tv24africa/screens/home_drawer.dart';
import 'package:tv24africa/screens/submit_success_screen.dart';

class CitizensReport extends StatefulWidget {
  @override
  _CitizensReportState createState() => _CitizensReportState();
}

class _CitizensReportState extends State<CitizensReport> {
  File imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Choose a dirrectory"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      child: Text("camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  final _formKey = GlobalKey<FormState>();
  var _currentItemSelected = 'Trendz';
  var _categories = [
    'This is Africa',
    'The Investigation',
    'Tv 24 Africa News',
    'Day Break Africa',
    'Tv24 Africa Interview',
    'Africa this week',
    'The Chane Makers',
    'The heart of a woman',
    'cooperate business',
    'Sport Track',
    'Trendz'
  ];
  String name, email, postTitle, excerpt, tags, postDescription;

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("no selected image");
    } else {
      return Image.file(imageFile, width: 400, height: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Submit Your Pitch',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ), // fontFamily: ,
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val) {
                      return val.isEmpty ? "field cannot be empty" : null;
                    },
                    decoration: InputDecoration(
                        hintText: "name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20),
                          borderSide: new BorderSide(),
                        )),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (val) {
                      return val.isEmpty ? "field cannot be empty" : null;
                    },
                    decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20),
                          borderSide: new BorderSide(),
                        )),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    validator: (val) {
                      return val.isEmpty ? "field cannot be empty" : null;
                    },
                    decoration: InputDecoration(
                        hintText: "Post Title",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20),
                          borderSide: new BorderSide(),
                        )),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (val) {
                      return val.isEmpty ? "field cannot be empty" : null;
                    },
                    decoration: InputDecoration(
                        hintText: "Post Description",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20),
                          borderSide: new BorderSide(),
                        )),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    validator: (val) {
                      return val.isEmpty ? "field cannot be empty" : null;
                    },
                    decoration: InputDecoration(
                        hintText: "Excerpt",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20),
                          borderSide: new BorderSide(),
                        )),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    textAlign: TextAlign.start,
                    validator: (val) {
                      return val.isEmpty ? "field cannot be empty" : null;
                    },
                    decoration: InputDecoration(
                      hintText: "Tags",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    onChanged: (val) {
                      name = val;
                    },
                  ),
                  SizedBox(height: 30),
                  DropdownButton<String>(
                    dropdownColor: Colors.grey,
                    items: _categories.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: new Text(
                          dropDownStringItem,
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        this._currentItemSelected = newValueSelected;
                      });
                    },
                    value: _currentItemSelected,
                  ),
                  SizedBox(height: 5),
                  Container(
                    child: Column(
                      children: <Widget>[
                        _decideImageView(),
                        ButtonTheme(
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.grey,
                            onPressed: () {
                              _showChoiceDialog(context);
                            },
                            child: Text(
                              "select a photo",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: ButtonTheme(
                                height: 60,
                                child: FlatButton.icon(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.grey,
                                  label: Center(
                                      child: Text("Send your post",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))),
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SuccesLog()));
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ClipRRect(
                              child: Container(
                                child: ButtonTheme(
                                  height: 60,
                                  child: FlatButton.icon(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    color: Colors.grey,
                                    label: Center(
                                        child: Text(
                                      "save as draft",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                                    icon: Icon(
                                      Icons.drafts,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tv24africa/models/program_model.dart';
import 'package:tv24africa/screens/home_drawer.dart';

class Programs extends StatefulWidget {
  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF262626),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Programs',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: MainDrawer(),

        body: ListView.builder(
            itemCount: programsmodel.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                },
                 child: programs(
                  programsmodel[index].imagesrc,
                 programsmodel[index].info,
                ),
              );
            }),
            );
  }

  Widget programs(String imageUrl, String containerText) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Material(
          color: Colors.white,
          elevation: 15.0,
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.black,
          child: Column(
            children: <Widget>[
              Container(
                child: Image(
                  height: 100,
                  fit: BoxFit.fill,
                  image: AssetImage(imageUrl),
                ),
              ),
              Container(
              
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Text(
                    containerText,
                    style: TextStyle(fontSize: 16,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

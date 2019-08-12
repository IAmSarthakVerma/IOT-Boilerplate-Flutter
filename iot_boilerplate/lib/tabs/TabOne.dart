import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:iot_boilerplate/widgets/badge.dart';
import 'package:iot_boilerplate/util/const.dart';



class TabOne extends StatefulWidget {
  @override
  _TabOneState createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  final TextEditingController _searchControl = new TextEditingController();

  List furnitures = [
    {
      "name": "Living Room",
      "img": "assets/1.jpeg",
    },
    {
      "name": "Dining Room",
      "img": "assets/4.jpeg",
    },
    {
      "name": "Bed Room",
      "img": "assets/3.jpeg",
    },


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.getIconData("refresh-ccw"),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "Howdy! \nSarthak Verma",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Card(
              elevation: 6.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Search",
                    prefixIcon: Icon(
                      Feather.getIconData("search"),
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  maxLines: 1,
                  controller: _searchControl,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),


          Container(
            height: 275,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: furnitures.length,
              itemBuilder: (BuildContext context, int index) {
                Map furniture = furnitures[index];

                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 275,
                      width: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            furniture['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                      Container(
//                        decoration: BoxDecoration(
//                          boxShadow: <BoxShadow>[
//                            BoxShadow(offset: Offset(0.0, 0.0), blurRadius: 1.0, spreadRadius: 1.0, color: Constants.darkAccent),
//                            BoxShadow(offset: Offset(0.0, 0.0), blurRadius: 1.0, spreadRadius: 1.0, color: Constants.darkAccent),
//                            BoxShadow(offset: Offset(0.0, 0.0), blurRadius: 1.0, spreadRadius: 1.0, color: Constants.darkAccent),
//                          ],
//                          borderRadius: BorderRadius.circular(15)
//                        ),
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "${furniture["img"]}",
                              height: 240,
                              width: 280,
                              fit: BoxFit.cover,
                            ),

                          ),

                      ),

                        ],
                      ),
                    ),
                  ),
                );
              },

            ),
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Recent Devices",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),

              FlatButton(
                child: Text(
                  "View More",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onPressed: (){},
              ),
            ],
          ),

          Container(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: furnitures.length,
              itemBuilder: (BuildContext context, int index) {
                Map furniture = furnitures[index];

                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "${furniture["img"]}",
                          height: 140,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelflutterui/widget/destination_carousel.dart';
import 'package:travelflutterui/widget/hotel_carousal.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<IconData> icon = [
    Icons.airplanemode_active,
    Icons.card_travel,
    Icons.pie_chart_outlined,
    Icons.location_disabled,
    Icons.add_shopping_cart,
  ];

  Widget _buildItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE)),
        child: Icon(
          icon[index],
          size: 30.0,
          color: selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 15.0, right: 30.0, bottom: 8.0),
                    child: Text(
                      "What you would like \nto find ? ",
                      style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: icon
                        .asMap()
                        .entries
                        .map(
                          (MapEntry map) => _buildItem(map.key),
                    )
                        .toList(),
                  ),
                  DestinationCarousel(),
                  HotelCarousel(),
                ],
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        index: 1,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 700),
        backgroundColor: Colors.white.withOpacity(0.0001),
        buttonBackgroundColor: Colors.red,
        color: Colors.yellowAccent,
        items: <Widget>[
          Icon(Icons.hotel , ),
          Icon(Icons.local_pizza),
          Icon(Icons.camera )
        ],
      ),
    );
  }
}

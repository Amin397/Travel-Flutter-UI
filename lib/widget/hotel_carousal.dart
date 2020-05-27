import 'package:flutter/material.dart';
import 'package:travelflutterui/model/destination_model.dart';
import 'package:travelflutterui/model/hotel_model.dart';

class HotelCarousel extends StatefulWidget {
  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 5.0, right: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Exclusive Hotels",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => {print("See All")},
                  child: Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 270.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildDestination(index);
              },
            ),
          )
        ],
      ),
    );
  }

  _buildDestination(int index) {
    Hotel hotel = hotels[index];
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Container(
        width: 250.0,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 2.0,
              child: Container(
                width: 240.0,
                height: 120.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hotel.name,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        hotel.address,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '\$ ${hotel.price} / night',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage(hotels[index].imageUrl),
                      height: 180.0,
                      width: 220.0,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 70.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.black,
                              Colors.black54,
                              Colors.black54,
                              Colors.black54,
                              Colors.black45,
                              Colors.transparent,
                            ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

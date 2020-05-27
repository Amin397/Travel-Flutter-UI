import 'package:flutter/material.dart';
import 'package:travelflutterui/model/destination_model.dart';
import 'package:travelflutterui/screen/destination_screen.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0 , bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Top Destinations",
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
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildDestination(index);
            },
          ),
        )
      ],
    );
  }

  _buildDestination(int index) {
    Destination destination = destinations[index];
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationScreen(destination: destinations[index],)));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Container(
          width: 215.0,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                bottom: 2.0,
                child: Container(
                  width: 200.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${destination.activities.length} activities',
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2),
                        ),
                        Text(
                          destination.description,
                          style: TextStyle(color: Colors.grey),
                        ),
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
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Stack(
                        children: <Widget>[
                          Hero(
                            tag: destination.imageUrl,
                            child: Image(
                              image: AssetImage(destination.imageUrl),
                              height: 180.0,
                              width: 180.0,
                              fit: BoxFit.cover,
                            ),
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
                    Positioned(
                      bottom: 10.0,
                      left: 10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            destinations[index].city,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.my_location,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                destinations[index].country,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

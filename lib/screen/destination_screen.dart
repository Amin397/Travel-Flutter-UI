import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelflutterui/model/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({Key key, this.destination}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _imageAppBar(),
              _shadowImage(),
              _appBar(),
              _nameAndCountry(),
              _locationIcon(),
            ],
          ),
          Container(
            height: 352.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildActivities(index);
                },
              ))
        ],
      ),
    );
  }

   Widget _buildActivities(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
      child: Container(
        height: 190.0,
        width: 100.0,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Positioned(
              right: 16.0,
              child: Container(
                width: 300.0,
                height: 180.0,
                child: Material(
                  elevation:10.0,
                  borderRadius: BorderRadius.circular(12.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 55.0 , top: 6.0 , right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 140.0,
                                child: Text(
                                  '${activities[index].name}',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    '\$ ${activities[index].price}',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ("Per Pax"),
                                    style: TextStyle(color: Colors.black45),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0,),
                          Text(
                            activities[index].type,
                            style: TextStyle(color: Colors.black45),
                          ),
                          SizedBox(height: 12.0,),
                          _buildRatingStars(activities[index].rating),
                          SizedBox(height: 12.0,),
                          _buildStartTimes(activities[index].startTimes),
                        ],
                      ),
                    ),
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
                    )
                  ]),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(activities[index].imageUrl),
                      height: 160.0,
                      width: 130.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Text _buildRatingStars(int rating){
    String stars = '';
    for(int i = 0 ; i < rating ; i++){
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
  Widget _buildStartTimes(List<String> startTimes){
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 9.0),
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).accentColor,
          ),
          child: Center(
            child: Text(startTimes[0] , style: TextStyle(fontSize: 16.0)),
          ),
        ),
        SizedBox(width: 20.0,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 9.0),
          height: 30.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).accentColor,
          ),
          child: Center(
            child: Text(startTimes[1] , style: TextStyle(fontSize: 16.0),),
          ),
        ),
      ],
    );
  }
  Widget _locationIcon() {
    return Positioned(
      right: 24.0,
      bottom: 24.0,
      child: Icon(
        Icons.card_travel,
        color: Colors.white.withOpacity(0.5),
        size: 30.0,
      ),
    );
  }
  Widget _nameAndCountry() {
    return Positioned(
      left: 16.0,
      bottom: 16.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.destination.city.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 10.0,
                fontSize: 28.0,
                fontWeight: FontWeight.w600),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 20.0,
                color: Colors.white.withOpacity(0.6),
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                widget.destination.country,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 20.0),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget _imageAppBar() {
    return Hero(
      tag: widget.destination.imageUrl,
      child: Container(
        height: 320.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular((35.0))),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 5.0))
            ],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.destination.imageUrl))),
      ),
    );
  }
  Widget _shadowImage() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 70.0,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular((35.0))),
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.black54,
              Colors.black45,
              Colors.transparent,
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
      ),
    );
  }
  Widget _appBar() {
    return Positioned(
      top: 40.0,
      left: 16.0,
      right: 16.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 26.0,
                color: Colors.black,
              )),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                size: 28.0,
                color: Colors.black,
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.menu,
                size: 28.0,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}

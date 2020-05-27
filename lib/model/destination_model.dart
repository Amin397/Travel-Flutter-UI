import 'activity_model.dart';

class Destination {
  String imageUrl, city, country, description;
  List<Activity> activities;

  Destination(this.imageUrl, this.city, this.country, this.description,
      this.activities);
}

List<Activity> activities = [
  Activity('assets/images/stmarksbasilica.jpg', 'St. Mark\'s Basilica',
      'Sightseeing Tour', ["9:00 am", "11:00 am"], 5, 30),
  Activity(
    'assets/images/gondola.jpg',
    'Walking Tour and Gonadola Ride',
    'Sightseeing Tour',
    ['11:00 pm', '1:00 pm'],
    4,
    210,
  ),
  Activity(
    'assets/images/murano.jpg',
    'Murano and Burano Tour',
    'Sightseeing Tour',
    ['12:30 pm', '2:00 pm'],
    3,
    125,
  ),
];

List<Destination> destinations = [
  Destination(
    'assets/images/venice.jpg',
    'Venice',
    'Italy',
    'Visit Venice for an amazing and unforgettable adventure.',
    activities,
  ),
  Destination(
    'assets/images/paris.jpg',
    'Paris',
    'France',
    'Visit Paris for an amazing and unforgettable adventure.',
    activities,
  ),
  Destination(
    'assets/images/newdelhi.jpg',
    'New Delhi',
    'India',
    'Visit New Delhi for an amazing and unforgettable adventure.',
    activities,
  ),
  Destination(
    'assets/images/saopaulo.jpg',
    'Sao Paulo',
    'Brazil',
    'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities,
  ),
  Destination(
    'assets/images/newyork.jpg',
    'New York City',
    'United States',
    'Visit New York for an amazing and unforgettable adventure.',
    activities,
  ),
];

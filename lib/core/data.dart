import 'package:flutter/material.dart';

class Data {
  List<Map<String, dynamic>> courses = [
    {
      "author": "Victor Excel",
      "color": const Color.fromARGB(255, 170, 182, 247),
      "title": "UI/UX Design Course",
      "score": 5.0,
      "duration": "8h,33min",
      "popularity": "Most Popular",
      "value": 100,
      "modules": {
        "aula01": {
          "title": "Introducing",
          "time": "15 mins",
        },
        "aula02": {
          "title": "Typography",
          "time": "25 mins",
        },
        "aula03": {
          "title": "Coloring",
          "time": "35 mins",
        }
      }
    },
    {
      "author": "João Artes",
      "color": const Color.fromARGB(255, 187, 255, 229),
      "title": "Ilustration Course",
      "score": 4.8,
      "duration": "7h,33min",
      "popularity": "Popular",
      "value": 150,
      "modules": {
        "aula01": {
          "title": "Introducing",
          "time": "15 mins",
        },
        "aula02": {
          "title": "Concepts",
          "time": "30 mins",
        },
        "aula03": {
          "title": "Start illustration",
          "time": "20 mins",
        }
      }
    },
    {
      "author": "Marcelo UX",
      "color": const Color.fromARGB(255, 236, 161, 154),
      "title": "Graphic Design Course",
      "score": 4.7,
      "duration": "6h,33min",
      "popularity": "Popular",
      "value": 120,
      "modules": {
        "aula01": {
          "title": "Introducion",
          "time": "15 mins",
        },
        "aula02": {
          "title": "Photoshop",
          "time": "30 mins",
        },
        "aula03": {
          "title": "Start Edit Images",
          "time": "20 mins",
        }
      }
    },
  ];

  List data() {
    return courses;
  }
}

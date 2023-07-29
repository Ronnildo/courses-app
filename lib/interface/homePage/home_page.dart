import 'package:cursos_app/interface/detailCourse/detail_page.dart';
import 'package:cursos_app/interface/homePage/widgets/card_course.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> carrossel = [
    "Desing",
    "Development",
    "Marketing",
    "Data Analisys"
  ];

  List<Map<String, dynamic>> courses = [
    {
      "color": const Color.fromARGB(255, 170, 182, 247),
      "title": "UI/UX Design Course",
      "score": 5.0,
      "duration": "8h,33min",
      "popularity": "Most Popular"
    },
    {
      "color": const Color.fromARGB(255, 187, 255, 229),
      "title": "Ilustration Course",
      "score": 4.8,
      "duration": "7h,33min",
      "popularity": "Popular"
    },
    {
      "color": const Color.fromARGB(255, 236, 161, 154),
      "title": "Graphic Design Course",
      "score": 4.7,
      "duration": "6h,33min",
      "popularity": "Popular"
    },
  ];

  void detailPage(String title, double score, String duration) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30,
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.0, left: 8),
            child: Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello Zea!",
                style: TextStyle(
                  color: Color(0xFF372A77),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: const Text(
                  "Let's found your favorite course",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 36,
                      color: Colors.grey,
                    ),
                    label: const Text(
                      "Search for course",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    focusColor: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Caterory",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Container(
                padding: null,
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: carrossel.map((itens) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        left: 0,
                        right: 20,
                        top: 30,
                        bottom: 30,
                      ),
                      width: 100,
                      height: 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF372A77),
                      ),
                      child: AutoSizeText(
                        itens,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: null,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CardCourse(
                      onTap: () => detailPage(
                        courses[index]["title"],
                        courses[index]["score"],
                        courses[index]["duration"],
                      ),
                      color: courses[index]["color"],
                      title: courses[index]["title"],
                      popularity: courses[index]["popularity"],
                      score: courses[index]["score"],
                      duration: courses[index]["duration"],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: courses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

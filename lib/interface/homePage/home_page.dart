import 'package:cursos_app/interface/detailCourse/detail_page.dart';
import 'package:cursos_app/interface/homePage/widgets/card_course.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../core/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Data data = Data();
  List<String> carrossel = [
    "Desing",
    "Development",
    "Marketing",
    "DataAnalisys"
  ];

  void detailPage(String title, String author, double score, String duration,
      int value, Map<String, Map<String, dynamic>> modules) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          title: title,
          author: author,
          score: score,
          duration: duration,
          value: value,
          modules: modules,
        ),
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
                width: MediaQuery.of(context).size.width / 1.4,
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
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
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
                        data.data()[index]["title"],
                        data.data()[index]["author"],
                        data.data()[index]["score"],
                        data.data()[index]["duration"],
                        data.data()[index]["value"],
                        data.data()[index]["modules"],
                      ),
                      color: data.data()[index]["color"],
                      title: data.data()[index]["title"],
                      popularity: data.data()[index]["popularity"],
                      score: data.data()[index]["score"],
                      duration: data.data()[index]["duration"],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: data.data().length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        mouseCursor: MouseCursor.uncontrolled,
        selectedIconTheme: const IconThemeData(
          color: Color(0xFF372A77),
          size: 30,
        ),
        iconSize: 30,
        fixedColor: Colors.black,
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        unselectedFontSize: 0,
        selectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.auto_stories,
            ),
            label: "Courses",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Car",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

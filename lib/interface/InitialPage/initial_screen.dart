import 'package:cursos_app/interface/homePage/home_screen.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF717BCE),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 30.0,
          left: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: const AssetImage("assets/images/entry.jpg"),
                fit: BoxFit.fitHeight,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade800,
                    offset: const Offset(1, 3),
                    blurRadius: 3,
                    spreadRadius: 0.2,
                  ),
                ],
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 30,
                    color: Colors.blue,
                    height: 4,
                  ),
                  const Text(
                    "Ready for Your\n   Dream Job?",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "find course that interests you,\n then make it happen with us.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF372A77),
                      fixedSize: const Size(230, 40),
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      elevation: 16,
                    ),
                    child: const Text("Get Started"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

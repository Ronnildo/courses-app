import 'package:flutter/material.dart';

class CardCourse extends StatelessWidget {
  final void Function() onTap;
  final Color color;
  final String title, popularity, duration;
  final double score;
  const CardCourse({
    Key? key,
    required this.onTap,
    required this.title,
    required this.popularity,
    required this.score,
    required this.duration,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 130,
        decoration: BoxDecoration(
            image: const DecorationImage(
              alignment: Alignment.centerRight,
              image: AssetImage("assets/images/course.png"),
            ),
            borderRadius: BorderRadius.circular(10),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.blueGrey,
                blurRadius: 4,
                offset: Offset(0, 5),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFF372A77),
                  ),
                  Text(
                    "$score",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.schedule,
                    color: Colors.black54,
                  ),
                  Text(
                    duration,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Container(
                padding: null,
                width: 110,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF372A77),
                ),
                child: Text(
                  popularity,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

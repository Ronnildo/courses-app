import 'package:cursos_app/interface/detailCourse/widgets/card_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String author;
  final double score;
  final String duration;
  final int value;
  final Map<String, Map<String, dynamic>> modules;
  const DetailPage({
    Key? key,
    required this.title,
    required this.author,
    required this.score,
    required this.duration,
    required this.value,
    required this.modules,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List modulos(Map<String, dynamic> data) {
    var test = Modules.fromJson(data);
    List content = [test.aula01, test.aula02, test.aula03];
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF717BCE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF717BCE),
        title: const Text(
          "Detail Course",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(FontAwesomeIcons.arrowLeft),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              FontAwesomeIcons.cartShopping,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 280,
            width: 500,
            child: Image(
              image: AssetImage("assets/images/course.png"),
            ),
          ),
          Expanded(
            child: Container(
              height: 500,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFF372A77),
                            ),
                            child: Text(
                              "\$ ${widget.value}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                "by ${widget.author}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              "${widget.score}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.schedule,
                              color: Colors.grey,
                            ),
                            Text(
                              widget.duration,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 0.8,
                        color: Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: widget.modules.length,
                          itemBuilder: (context, index) {
                            return CardContent(
                              data: widget.modules,
                              index: index + 1,
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(0, 2),
                                      blurRadius: 1,
                                    )
                                  ]),
                              child: const Icon(
                                FontAwesomeIcons.cartShopping,
                                color: Color(0xFF372A77),
                                size: 20,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF372A77),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(0, 2),
                                      blurRadius: 1,
                                    )
                                  ]),
                              child: const Text(
                                "Buy Course",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Modules {
  Aula? aula01;
  Aula? aula02;
  Aula? aula03;

  Modules({this.aula01, this.aula02, this.aula03});

  Modules.fromJson(Map<String, dynamic> json) {
    aula01 = json['aula01'] != null ? new Aula.fromJson(json['aula01']) : null;
    aula02 = json['aula02'] != null ? new Aula.fromJson(json['aula02']) : null;
    aula03 = json['aula03'] != null ? new Aula.fromJson(json['aula03']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aula01 != null) {
      data['aula01'] = this.aula01!.toJson();
    }
    if (this.aula02 != null) {
      data['aula02'] = this.aula02!.toJson();
    }
    if (this.aula03 != null) {
      data['aula03'] = this.aula03!.toJson();
    }
    return data;
  }
}

class Aula {
  String? title;
  String? time;

  Aula({this.title, this.time});

  Aula.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['time'] = this.time;
    return data;
  }
}

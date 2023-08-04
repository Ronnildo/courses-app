import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardContent extends StatefulWidget {
  final Map<String, dynamic> data;
  final int index;
  const CardContent({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  State<CardContent> createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFECEFF7),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    widget.index >= 10
                        ? Text(
                            "${widget.index}. ${widget.data["aula${widget.index}"]['title']}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Text(
                            "0${widget.index}. ${widget.data["aula0${widget.index}"]['title']}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    widget.index >= 10
                        ? Text("${widget.data["aula${widget.index}"]['time']}")
                        : Text(
                            "${widget.data["aula0${widget.index}"]['time']}",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFF8495C0),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

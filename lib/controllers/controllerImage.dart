

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class imagecont extends StatefulWidget {

  final AssetImage image;
  final String texto;
  final String texto2;

  const imagecont({Key? key,
  
  required this.image,
  required this.texto,
  required this.texto2,

 }) : super(key: key);

  @override
  State<imagecont> createState() => _imagecontState();
}

class _imagecontState extends State<imagecont> {
  @override
  Widget build(BuildContext context) {
    return 
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: CircleAvatar(
            backgroundImage: widget.image,
            radius: 30,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 0, 25),
              child: Text(widget.texto,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
              ),
            ),
            Text(widget.texto2,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10
            ),
            )         
          ],
        )
      ],
    );
  }
}
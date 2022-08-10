// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ignore: camel_case_types
class item_tile extends StatefulWidget {
  String? id;

  item_tile({
    this.id,
  });

  @override
  State<item_tile> createState() => item_tilestate();
}

class item_tilestate extends State<item_tile> {
  // late final Urundetay? datam;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed("/item_details", arguments: {"id": widget.id});
        },
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(7),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.1, color: Colors.purple),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  "",
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ), // default text style
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }
}

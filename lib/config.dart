import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class getc extends GetxController {
  final active = false.obs;

  a() {
    var c = Get.put(getc());

    test() {
      active(!active.value);
    }
  }
}

class Config extends ChangeNotifier {
  static int selectedIndex = 0;

  displayDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(""),
          content: SizedBox(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
/*   
                                      */

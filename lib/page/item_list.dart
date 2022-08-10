import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:project_link1/models/itemmodel.dart';
import 'package:project_link1/modules/item_tile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class item_list extends StatefulWidget {
  @override
  State<item_list> createState() => item_liststate();
}

// ignore: camel_case_types
class item_liststate extends State<item_list> {
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  //final c = Get.put(getc());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 2;
    return FutureBuilder<QuerySnapshot>(
        // <2> Pass `Future<QuerySnapshot>` to future
        future: FirebaseFirestore.instance.collection('items').get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // <3> Retrieve `List<DocumentSnapshot>` from snapshot
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView(
                children: documents
                    .map((doc) => Card(
                          child: ListTile(
                            title: Text(doc['name']),
                          ),
                        ))
                    .toList());
          } else if (snapshot.hasError) {
            return Text('Its Error!');
          }
          return CircularProgressIndicator();
        });
  }
}

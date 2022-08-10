import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

// ignore: camel_case_types
class p_details extends StatefulWidget {
  String calories,
      category,
      fat,
      minute,
      name,
      p1fiber,
      p2sugars,
      picture_id,
      protein,
      ptcarbs,
      safat,
      servings,
      title,
      who;
  p_details(
      {Key? key,
      required this.calories,
      required this.fat,
      required this.category,
      required this.minute,
      required this.name,
      required this.p1fiber,
      required this.p2sugars,
      required this.picture_id,
      required this.protein,
      required this.ptcarbs,
      required this.safat,
      required this.servings,
      required this.title,
      required this.who})
      : super(key: key);

  @override
  State<p_details> createState() => p_detailsstate();
}

// ignore: camel_case_types
class p_detailsstate extends State<p_details> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        // appbar with image
        key: _scaffoldKey,
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: CustomScrollView(
                  // show pictures from firebase storage
                  slivers: [
                    SliverAppBar(
                      actions: [
                        IconButton(
                            icon: Icon(FontAwesome5.edit), onPressed: () {}),
                        IconButton(
                            icon: Icon(FontAwesome5.edit), onPressed: () {})
                      ],
                      expandedHeight: 250.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Image.network(
                          "https://firebasestorage.googleapis.com/v0/b/femispace1-4c30c.appspot.com/o/${widget.picture_id}.png?alt=media&token=6832c199-3727-4971-a247-89071f222224",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(children: [
                        Text(
                          "${widget.category} * ",
                          style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(widget.who)
                      ]),
                    ),
                    SliverToBoxAdapter(
                      child: Text(
                        "${widget.name}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Text(
                        "${widget.title}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("${widget.minute} mins"),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: Text("${widget.servings} Servings")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}

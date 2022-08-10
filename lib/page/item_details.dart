import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:project_link1/models/itemmodel.dart';

// ignore: camel_case_types
class p_details extends StatefulWidget {
  const p_details({Key? key}) : super(key: key);

  @override
  State<p_details> createState() => p_detailsstate();
}

// ignore: camel_case_types
class p_detailsstate extends State<p_details> {
  late final Future<List<item_model>> items;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int pageview = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: pageview, viewportFraction: 0.6);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 80) / 2.2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder<List<item_model>>(
          future: items,
          builder: (context, snaphost) {
            if (snaphost.hasData) {
              if (snaphost != "") {
                var datam = snaphost.data![0];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          "",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(""),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Padding(
                            child: Wrap(
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(FontAwesome.home, size: 14),
                                  label:
                                      Text("", style: TextStyle(fontSize: 14)),
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesome.adjust,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  label: Text(
                                    "",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesome.adjust,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  label: Text(
                                    "",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesome.star,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  label: Text(
                                    "",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(6),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: true == true ? (Container()) : null),
                      SliverToBoxAdapter(
                          child: SizedBox(
                        height: 10,
                      )),
                    ],
                  ),
                );
              } else {}
            } else {}
            return const Center(
              child: SizedBox(
                height: 32,
                width: 32,
                child: CircularProgressIndicator(),
              ),
            );
          }),
    );
  }
}

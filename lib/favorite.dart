import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataClass {
  String id;
  String img;
  String link;
  bool favorite = false;
  String name;
  DataClass(this.id, this.img, this.link, this.name);
}

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<DataClass> data = [
    DataClass(
        '1', 'images/facebook.png', 'https://www.facebook.com/', "Facebook"),
    DataClass('2', 'images/youtube.png', 'https://www.youtube.com/', "Youtube"),
    DataClass('3', 'images/github.png', 'https://github.com/', "Github"),
    DataClass('4', 'images/netflix.png', 'https://www.netflix.com/', "Netflix"),
    DataClass(
        '5', 'images/so.png', 'https://stackoverflow.com/', "Stackoverflow"),
    DataClass(
        '6', 'images/webtoon.png', 'https://www.webtoons.com/', "Webtoons"),
  ];

  @override
  Widget build(BuildContext context) {
    List<DataClass> dataresult = [];
    Future<List<DataClass>> getPreferences() async {
      Future.delayed(const Duration(seconds: 3));
      final SharedPreferences sp = await SharedPreferences.getInstance();
      dataresult = data
          .where((element) => sp.getStringList('data')!.contains(element.id))
          .toList();
      return dataresult;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Center(
          child: Text(
            "Situs Favorite",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder(
        future: getPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Container(
              margin: const EdgeInsets.all(20.0),
              child: Center(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("Hello, User!",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: AutofillHints.addressCity,
                            fontWeight: FontWeight.bold)),
                    const Text("Selamat datang di halaman favorite",
                        style: TextStyle(
                            fontSize: 11.0,
                            fontFamily: AutofillHints.addressCity)),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text("Daftar situs favorite",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: AutofillHints.addressCity,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 500.0,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView(
                              children: [
                                if (true)
                                  for (var i = 0;
                                      i < snapshot.data!.length;
                                      i++)
                                    Card(
                                      color: Colors.grey[100],
                                      child: SizedBox(
                                        height: 90.0,
                                        child: Row(
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                  snapshot.data![i].img),
                                              width: 80.0,
                                              height: 60.0,
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data![i].name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: AutofillHints
                                                          .addressCity,
                                                      fontSize: 20.0),
                                                ),
                                                Text(snapshot.data![i].link),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                const SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

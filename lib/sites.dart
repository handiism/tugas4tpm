import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DataClass {
  String id;
  String img;
  String link;
  bool favorite = false;
  String name;
  DataClass(this.id, this.img, this.link, this.name);
}

class Sites extends StatefulWidget {
  const Sites({super.key});

  @override
  State<Sites> createState() => _SitesState();
}

class _SitesState extends State<Sites> {
  List<String> favorite = [];
  List<DataClass> datafillter = [];

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
//set preference
  void setPreferences() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setStringList('data', favorite);
  }

  @override
  Widget build(BuildContext context) {
    List<DataClass> dataresult = [];
    Future<List<DataClass>> getPreferences() async {
      Future.delayed(const Duration(seconds: 3));
      final SharedPreferences sp = await SharedPreferences.getInstance();
      if (sp.containsKey('data')) {
        dataresult = data
            .where((element) => sp.getStringList('data')!.contains(element.id))
            .toList();
      }
      return dataresult;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Situs Rekomendasi",
        ),
      ),
      body: FutureBuilder(
        future: getPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var datafinal = [];
            favorite = [];
            for (var element in snapshot.data!) {
              datafinal.add(element.id);
              favorite.add(element.id);
            }
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
                    const Text("Selamat datang di halaman situs",
                        style: TextStyle(
                            fontSize: 11.0,
                            fontFamily: AutofillHints.addressCity)),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text("Daftar situs rekomendasi",
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
                                for (var i = 0; i < data.length; i++)
                                  Card(
                                    color: Colors.grey[100],
                                    child: SizedBox(
                                      height: 90.0,
                                      child: Row(
                                        children: [
                                          Image(
                                            image: AssetImage(data[i].img),
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
                                                data[i].name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: AutofillHints
                                                        .addressCity,
                                                    fontSize: 20.0),
                                              ),
                                              Text(data[i].link),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              IconButton(
                                                color: Colors.pink,
                                                onPressed: () {
                                                  setState(() {
                                                    if (favorite
                                                        .contains(data[i].id)) {
                                                      data[i].favorite = false;
                                                    } else {
                                                      data[i].favorite =
                                                          !data[i].favorite;
                                                    }
                                                    if (data[i].favorite ==
                                                        false) {
                                                      favorite.removeWhere(
                                                          (element) =>
                                                              element ==
                                                              data[i].id);
                                                    }
                                                    datafillter = data
                                                        .where((element) =>
                                                            element.favorite ==
                                                            true)
                                                        .toList();

                                                    for (var element
                                                        in datafillter) {
                                                      favorite.add(element.id);
                                                    }
                                                    setPreferences();
                                                  });
                                                },
                                                icon: Icon(favorite
                                                        .contains(data[i].id)
                                                    ? Icons.favorite
                                                    : Icons.favorite_border),
                                              )
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

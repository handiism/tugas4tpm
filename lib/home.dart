import 'package:flutter/material.dart';
import 'package:tpm1/favorite.dart';
import 'package:tpm1/group.dart';
import 'package:tpm1/sites.dart';
import 'package:tpm1/stopwatch.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Daftar Menu",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Kelompok(),
                    ));
              },
              child: const Text('Data Kelompok'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StopWatch(),
                    ));
              },
              child: const Text('Stopwatch'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sites(),
                  ),
                );
              },
              child: const Text('Situs Rekomendasi'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Favorite(),
                    ));
              },
              child: const Text('Favorit'),
            ),
          ],
        ),
      ),
    );
  }
}

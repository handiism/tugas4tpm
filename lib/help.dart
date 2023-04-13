import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Bantuan",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                centerText('1. Login terlebih dahulu'),
                centerText(
                    '2. Pilihan salah satu menu: Data Kelompok, Stopwatch, Situs Rekomendasi, maupun Laman Favorit. Pilih sesuai kebutuhan'),
                centerText(
                    '3. Jika ingin logout, pergi ke halaman utama lalu klik tombol keluar '),
              ],
            ),
          ),
        ),
      ),
    );
  }

  centerText(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

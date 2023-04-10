import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('1.Login terlebih dahulu'),
                Text(
                    '2.pilihan menu Daftar Anggota, Aplikasi Stopwatch, Daftar situs pilih sesuai kebutuhan'),
                Text('3.Jika ingin logout bisa masuk ke bantuan dan logout '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Kelompok extends StatefulWidget {
  const Kelompok({Key? key}) : super(key: key);

  @override
  State<Kelompok> createState() => _KelompokState();
}

class _KelompokState extends State<Kelompok> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DATA KELOMPOK"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Card(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                          'Muhamad Handi Rachmawan',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("123200125")
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                          'Mochammad Farhan Fansuri',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("123200127")
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Column(
                      children: const [
                        Text(
                          'Melanio Daris Ramadhan',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("123200136")
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

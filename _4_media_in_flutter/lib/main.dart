import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Practical 4 - Abhie Images'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://camo.githubusercontent.com/a157a0f9f008a33a89bd21ffd1eb0c53d4e0c3506c7417a2877b815f6723d1d6/68747470733a2f2f692e696d6775722e636f6d2f74556a633732642e6a7067',
                ),
                const SizedBox(height: 20),
                const Image(
                  image: AssetImage('assets/img.jpeg'),
                  width: 400,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  'Abhiraj Chaudhuri Image Practical 4',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Working with Images'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://avatars.githubusercontent.com/u/117913120?v=4',
                width: 400,
                height: 200,
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
    );
  }
}

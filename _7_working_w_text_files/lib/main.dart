import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _fileContents = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Method to load data from the text file
  Future<void> loadData() async {
    try {
      // Load the file contents as a string
      String fileText = await rootBundle.loadString('assets/about-nuv.txt');
      // Update the state with the file contents
      setState(() {
        _fileContents = fileText;
      });
    } catch (e) {
      // Print error message if file loading fails
      print("Error loading file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reading Data from File...'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            _fileContents,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

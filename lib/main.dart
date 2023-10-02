import 'package:flutter/material.dart';
import 'package:kuis_mobile/plant_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Diseases',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PlantList(),
    );
  }
}

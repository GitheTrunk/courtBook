import 'package:flutter/material.dart';

class CourtBook extends StatelessWidget {
  const CourtBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CourtBookApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar, body: Container());
  }
}

get _appBar => AppBar(
  backgroundColor: Colors.grey,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage('assets/images/pf.jpg'),
      ),
    ],
  ),
  centerTitle: true,
);

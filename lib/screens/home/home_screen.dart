import 'package:courtbook/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:courtbook/widgets/search_section.dart';
import 'package:courtbook/widgets/filter_chip_widget.dart';

class CourtBook extends StatelessWidget {
  const CourtBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CourtBookApp',
      theme: appTheme,
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
    return Scaffold(appBar: _appBar, body: _body);
  }
}

get _appBar => AppBar(
  backgroundColor: Colors.grey,
  title: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      spacing: 0.0,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/pf.jpg'),
        ),
        const SizedBox(width: 10),
        Text(
          'Sengleang',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.values[6],
            fontSize: 20,
          ),
        ),
      ],
    ),
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {
        debugPrint('Notification button pressed');
      },
    ),
  ],
  centerTitle: true,
);

get _body => Column(
  children: [
    Column(
      children: [
        const SizedBox(height: 20),
        SearchSection(),
        const SizedBox(height: 20),
        FilterChipWidget(),
        const SizedBox(height: 20),
      ],
    ),
  ],
);

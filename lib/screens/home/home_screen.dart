import 'package:courtbook/core/theme.dart';
import 'package:courtbook/models/club_model.dart';
import 'package:courtbook/widgets/court_card.dart';
import 'package:flutter/material.dart';
import 'package:courtbook/widgets/search_section.dart';

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
  final List<Club> clubs = [
    Club(
      name: 'ACE Football Club',
      imagePath: 'assets/icons/football.png',
      location: 'Location A',
    ),
    Club(
      name: 'ACE Basketball Club',
      imagePath: 'assets/icons/basketball.png',
      location: 'Location B',
    ),
    Club(
      name: 'ACE Tennis Club',
      imagePath: 'assets/icons/tennis.png',
      location: 'Location C',
    ),
    Club(
      name: 'ACE Badminton Club',
      imagePath: 'assets/icons/badminton.png',
      location: 'Location D',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppBar(context), body: getBody(context));
  }

  AppBar getAppBar(BuildContext context) => AppBar(
    backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/pf.jpg'),
          ),
          const SizedBox(width: 10),
          Text(
            'Mann Vanda',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
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
      Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              debugPrint('Notification button pressed');
            },
          ),
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    ],
    centerTitle: true,
  );

  Widget getBody(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 20),
        const SearchSection(),
        const SizedBox(height: 20),
        ClubCard(clubs: clubs),
      ],
    ),
  );
}

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
    Club(
      name: 'Ace Volleyball Club',
      imagePath: 'assets/icons/volleyball.png',
      location: 'Location E',
    ),
    Club(
      name: 'Ace Swimming Club',
      imagePath: 'assets/icons/swimming.png',
      location: 'Location F',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
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
                    'Trunkkk',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.secondary,
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
          ),
          // SliverToBoxAdapter for SearchSection (pinned)
          SliverPersistentHeader(
            pinned: true, // Pins the SearchSection below the AppBar
            delegate: _SearchSectionDelegate(),
          ),
          // SliverList for ClubCard
          SliverPadding(
            padding: const EdgeInsets.only(top: 150.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ClubCard(club: clubs[index]);
              }, childCount: clubs.length),
            ),
          ),
        ],
      ),
    );
  }
}

// Delegate for SearchSection in SliverPersistentHeader
class _SearchSectionDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ClipRRect(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(
                context,
              ).scaffoldBackgroundColor.withAlpha((0.9 * 255).toInt()),
              Theme.of(
                context,
              ).scaffoldBackgroundColor.withAlpha((0.5 * 255).toInt()),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: const SearchSection(),
      ),
    );
  }

  @override
  double get maxExtent => 180.0; // Adjust based on SearchSection height

  @override
  double get minExtent => 180.0; // Same as maxExtent to prevent shrinking

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

import 'package:courtbook/core/theme.dart';
import 'package:courtbook/models/club_model.dart';
import 'package:courtbook/widgets/court_card.dart';
import 'package:courtbook/widgets/filter_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CourtBook extends StatelessWidget {
  const CourtBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  final List<String> _filters = [
    'All',
    'Football',
    'Basketball',
    'Tennis',
    'Badminton',
    'Volleyball',
    'Swimming',
  ];

  String _searchQuery = '';
  Set<String> _selectedFilters = {'All'};

  late ScrollController _scrollController;
  bool _showCards = true;
  double _lastOffset = 0.0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);

    _showCards = true;
    debugPrint('Initial _showCards: $_showCards');
    debugPrint('Initial filtered clubs: ${clubs.length}');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    try {
      final direction = _scrollController.position.userScrollDirection;
      debugPrint(
        'Scroll Direction: $direction, Offset: ${_scrollController.offset}',
      );
      if (direction == ScrollDirection.reverse) {
        if (!_showCards) {
          setState(() {
            _showCards = true;
            debugPrint('Showing cards');
          });
        }
      } else if (direction == ScrollDirection.forward) {
        if (_showCards) {
          setState(() {
            _showCards = false;
            debugPrint('Hiding cards');
          });
        }
      }
    } catch (e) {
      double currentOffset = _scrollController.offset;
      debugPrint('Fallback Offset: $currentOffset, Last Offset: $_lastOffset');
      if (currentOffset > _lastOffset && !_showCards) {
        setState(() {
          _showCards = true;
          debugPrint('Showing cards (offset)');
        });
      } else if (currentOffset < _lastOffset && _showCards) {
        setState(() {
          _showCards = false;
          debugPrint('Hiding cards (offset)');
        });
      }
      _lastOffset = currentOffset;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint('Navigated to index: $index');
    });
  }

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
    debugPrint('Keyboard dismissed');
  }

  List<Club> _getFilteredClubs() {
    debugPrint(
      'Filtering clubs with query: $_searchQuery, filters: $_selectedFilters',
    );
    if (_selectedFilters.contains('All')) {
      final filtered =
          clubs.where((club) {
            return club.name.toLowerCase().contains(_searchQuery.toLowerCase());
          }).toList();
      debugPrint('Filtered clubs (All): ${filtered.length}');
      return filtered;
    }
    final filtered =
        clubs.where((club) {
          final sport = club.name.split(' ')[1].toLowerCase();
          final matchesFilter = _selectedFilters.any(
            (filter) => filter.toLowerCase() == sport,
          );
          final matchesQuery = club.name.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
          return matchesFilter && matchesQuery;
        }).toList();
    debugPrint('Filtered clubs (specific): ${filtered.length}');
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final filteredClubs = _getFilteredClubs();
    debugPrint(
      'Building with filteredClubs: ${filteredClubs.length}, _showCards: $_showCards',
    );
    return GestureDetector(
      onTap: _dismissKeyboard,
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            buildAppBar(context),

            SliverPadding(
              padding: const EdgeInsets.only(top: 10.0),
              sliver:
                  filteredClubs.isNotEmpty
                      ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          debugPrint('Rendering ClubCard at index $index');
                          return ClubCard(club: filteredClubs[index]);
                        }, childCount: filteredClubs.length),
                      )
                      : SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'No clubs found.',
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.color,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) => SliverAppBar(
    floating: true,
    snap: true,
    expandedHeight: 240.0,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondary.withAlpha(200),
              Theme.of(context).secondaryHeaderColor.withAlpha(100),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userProfile(context),
                const SizedBox(height: 20),
                buildSearchSection,
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget userProfile(BuildContext context) => Row(
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
      const Spacer(),
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
  );

  Widget get buildSearchSection => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: 'Search clubs...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Theme.of(
            context,
          ).scaffoldBackgroundColor.withAlpha((0.9 * 255).toInt()),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value.toLowerCase();
            debugPrint('Search query: $_searchQuery');
          });
        },
      ),
      const SizedBox(height: 10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._filters.map(
              (text) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChipWidget(
                  text: text,
                  selected: _selectedFilters.contains(text),
                  onSelected: (selected) {
                    setState(() {
                      if (text == 'All' && selected) {
                        _selectedFilters = {'All'};
                      } else if (text != 'All') {
                        if (selected) {
                          _selectedFilters.add(text);
                          if (_selectedFilters.contains('All')) {
                            _selectedFilters.remove('All');
                          }
                        } else {
                          _selectedFilters.remove(text);
                          if (_selectedFilters.isEmpty) {
                            _selectedFilters.add('All');
                          }
                        }
                      }
                      debugPrint(
                        'Filter selected: $text, $selected, Filters: $_selectedFilters',
                      );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

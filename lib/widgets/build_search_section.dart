import 'package:flutter/material.dart';
import 'package:courtbook/widgets/filter_chip_widget.dart';

class BuildSearchSection extends StatefulWidget {
  const BuildSearchSection({super.key});

  @override
  State<BuildSearchSection> createState() => _BuildSearchSectionState();
}

class _BuildSearchSectionState extends State<BuildSearchSection> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
    ;
  }
}

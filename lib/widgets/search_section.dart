import 'package:courtbook/widgets/filter_chip_widget.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  SearchSection({super.key});

  final List<String> filterOptions = [
    'Nearby',
    'Top Rated',
    'Recommended',
    'Popular',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.black),
                      SizedBox(width: 10),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.bookmark, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  filterOptions.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: FilterChipWidget(
                      text: filterOptions[index],
                      selected: index == 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

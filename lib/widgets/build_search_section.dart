import 'package:courtbook/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:courtbook/widgets/filter_chip_widget.dart';

class BuildSearchSection extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _filters = const [
    'All',
    'Football',
    'Basketball',
    'Tennis',
    'Badminton',
    'Volleyball',
    'Swimming',
  ];

  BuildSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    // Sync TextEditingController with HomeController's searchQuery
    _searchController.text = homeController.searchQuery.value;
    _searchController.addListener(() {
      homeController.searchQuery.value = _searchController.text.toLowerCase();
      debugPrint('Search query: ${homeController.searchQuery.value}');
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _searchController,
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
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                ..._filters.map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChipWidget(
                      text: text,
                      selected: homeController.selectedFilters.contains(text),
                      onSelected: (selected) {
                        if (text == 'All' && selected) {
                          homeController.selectedFilters
                            ..clear()
                            ..add('All');
                        } else if (text != 'All') {
                          if (selected) {
                            homeController.selectedFilters.add(text);
                            if (homeController.selectedFilters.contains(
                              'All',
                            )) {
                              homeController.selectedFilters.remove('All');
                            }
                          } else {
                            homeController.selectedFilters.remove(text);
                            if (homeController.selectedFilters.isEmpty) {
                              homeController.selectedFilters.add('All');
                            }
                          }
                        }
                        debugPrint(
                          'Filter selected: $text, $selected, Filters: ${homeController.selectedFilters}',
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

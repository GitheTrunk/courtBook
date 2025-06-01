import 'package:courtbook/models/club_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchQuery = ''.obs;
  var selectedFilters = <String>{'All'}.obs;
  var clubs = <Club>[].obs;
  var showCards = true.obs; // Reactive scroll visibility
  late ScrollController scrollController;
  double lastOffset = 0.0;

  @override
  void onInit() {
    super.onInit();
    clubs.value = [
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
    scrollController = ScrollController();
    scrollController.addListener(_handleScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _handleScroll() {
    try {
      final direction = scrollController.position.userScrollDirection;
      if (direction == ScrollDirection.reverse) {
        if (!showCards.value) showCards.value = true;
      } else if (direction == ScrollDirection.forward) {
        if (showCards.value) showCards.value = false;
      }
    } catch (e) {
      double currentOffset = scrollController.offset;
      if (currentOffset > lastOffset && !showCards.value) {
        showCards.value = true;
      } else if (currentOffset < lastOffset && showCards.value) {
        showCards.value = false;
      }
      lastOffset = currentOffset;
    }
  }

  // void _handleScroll() {
  //   try {
  //     final direction = scrollController.position.userScrollDirection;
  //     final offset = scrollController.offset;

  //     if (direction == ScrollDirection.reverse && offset > 50) {
  //       // Scrolling down
  //       showCards.value = true;
  //     } else if (direction == ScrollDirection.forward &&
  //         offset < scrollController.position.maxScrollExtent - 50) {
  //       // Scrolling up
  //       showCards.value = false;
  //     }
  //   } catch (e) {
  //     // fallback logic
  //     double currentOffset = scrollController.offset;
  //     if ((currentOffset - lastOffset).abs() > 30) {
  //       showCards.value = currentOffset > lastOffset;
  //     }
  //     lastOffset = currentOffset;
  //   }
  // }

  List<Club> getFilteredClubs() {
    if (selectedFilters.contains('All')) {
      return clubs
          .where(
            (club) => club.name.toLowerCase().contains(
              searchQuery.value.toLowerCase(),
            ),
          )
          .toList();
    }
    return clubs.where((club) {
      final sport = club.name.split(' ')[1].toLowerCase();
      final matchesFilter = selectedFilters.any(
        (filter) => filter.toLowerCase() == sport,
      );
      final matchesQuery = club.name.toLowerCase().contains(
        searchQuery.value.toLowerCase(),
      );
      return matchesFilter && matchesQuery;
    }).toList();
  }
}

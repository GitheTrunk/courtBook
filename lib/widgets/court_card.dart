import 'package:flutter/material.dart';
import 'package:courtbook/models/club_model.dart';
import 'package:courtbook/screens/booking/booking_screen.dart';

class ClubCard extends StatelessWidget {
  final Club club;

  const ClubCard({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_buildClubCard(context, club)],
      ),
    );
  }

  Widget _buildClubCard(BuildContext context, Club club) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookingScreen()),
        );
      },
      child: Card(
        color: Theme.of(context).cardTheme.color,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Container(
            constraints: const BoxConstraints(minHeight: 100),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    club.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint(
                        'Image load error for ${club.imagePath}: $error',
                      );
                      return const Icon(
                        Icons.error,
                        size: 80,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                const SizedBox(height: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        club.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        club.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Open 8 AM - 10 PM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ],
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookingScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

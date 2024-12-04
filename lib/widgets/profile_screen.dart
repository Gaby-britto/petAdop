import 'package:flutter/material.dart';
import 'package:pet_adopt/widgets/info_card.dart';

class PetProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image and name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 150, 
                  backgroundImage: AssetImage('assets/images/gato_persa.png'),
                ),
                SizedBox(height: 16),
                Text(
                  "Bello", 
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '1.6 km away',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16),
                // Information row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard('3 Months', 'Age', Colors.orange[100]!),
                    InfoCard('Female', 'Gender', Colors.pink[100]!),
                    InfoCard('2kg', 'Weight', Colors.red[100]!),
                  ],
                ),
                SizedBox(height: 24),
                // About section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Bello is a neat, clean female kitten. She is really fluffy and playful. '
                        'She likes to play with balls and enjoys swimming. She is caring...',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

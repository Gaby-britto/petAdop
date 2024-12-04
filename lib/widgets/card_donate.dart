import 'package:flutter/material.dart';
import 'package:pet_adopt/view/register_pet.dart';

class card_donate extends StatelessWidget {
  const card_donate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFFb19cd9),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Streets Pets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Needs Protection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPetPage(),
                              ),
                            );
                    },
                    child: Text('Donate Now'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Image.asset(
              'assets/images/cat.png',
              height: 450,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pet_adopt/view/user.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/menu.png',
            height: 25,
          ),
        ),
        SizedBox(width: 20),
        Text(
          'Welcome',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(width: 110),
        GestureDetector(
             onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserPage(),
                ),
              );
            },
          child: Image.asset(
            'assets/images/user.png',
            height: 120,
          ),
        ),
      ],
      
    );
  }
}
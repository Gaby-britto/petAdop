// import 'package:flutter/material.dart';
// import 'package:pet_adopt/view/information.dart';
// import 'package:pet_adopt/widgets/card_animals.dart';

// class FavoritesPage extends StatelessWidget {
//   const FavoritesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> animals = [
//       {
//         'name': 'Bello',
//         'age': '9 Months old |',
//         'km': '1 km away',
//         'imagePath': 'assets/images/gato_persa.png',
//       },
//       {
//         'name': 'Lara',
//         'age': '3 Months old |',
//         'km': '2 km away',
//         'imagePath': 'assets/images/card_furao.png',
//       },
//       {
//         'name': 'Max',
//         'age': '5 Months old |',
//         'km': '50 m away',
//         'imagePath': 'assets/images/card_dog.png',
//       },
//       {
//         'name': 'Kitty',
//         'age': '8 Months old |',
//         'km': '3 km away',
//         'imagePath': 'assets/images/card_cat.png',
//       },
//        {
//         'name': 'Bello',
//         'age': '9 Months old |',
//         'km': '1 km away',
//         'imagePath': 'assets/images/gato_persa.png',
//       },
//       {
//         'name': 'Lara',
//         'age': '3 Months old |',
//         'km': '2 km away',
//         'imagePath': 'assets/images/card_furao.png',
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Favorites pets"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: animals.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => InformationPage(),
//                         ),
//                       );
//                     },
//                     child: CardAnimals(
//                       name: animals[index]['name']!,
//                       age: animals[index]['age']!,
//                       color: animals[index]['km']!,
//                       imagePath: animals[index]['imagePath']!,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

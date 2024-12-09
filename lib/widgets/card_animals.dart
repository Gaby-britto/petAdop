import 'package:flutter/material.dart';
import 'package:pet_adopt/view/informationPage.dart';

class DogCard extends StatelessWidget {
  final String dogName;
  final String dogAge;
  final String imageUrl;
  final String? color;
  const DogCard({
    required this.dogName,
    required this.dogAge,
    required this.imageUrl,
    this.color,
  });

  void navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DogDetailPage(
          dogName: dogName,
          dogAge: dogAge,
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String displayColor = color ?? 'Color not available';

    return GestureDetector(
      onTap: () => navigateToDetails(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: imageUrl.startsWith('http')
                  ? Image.network(
                      imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _fallbackImage();
                      },
                    )
                  : Image.asset(
                      imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _fallbackImage();
                      },
                    ),
            ),
            SizedBox(height: 8),
            Text(
              dogName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              dogAge,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              displayColor,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Widget para fallback de imagem caso não consiga carregar
  Widget _fallbackImage() {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      color: Colors.grey[300],
      child: Icon(Icons.broken_image, size: 40, color: Colors.grey[600]),
    );
  }
}

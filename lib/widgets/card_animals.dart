import 'package:flutter/material.dart';
import 'package:pet_adopt/view/informationPage.dart';

class DogCard extends StatelessWidget {
  final String dogName;
  final String dogAge;
  final String imageUrl;
  final String? color;  // Adicionando cor, conforme discutido anteriormente
  
  const DogCard({
    required this.dogName,
    required this.dogAge,
    required this.imageUrl,
    this.color, // Tornando color opcional
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
    final String displayColor = color ?? 'Color not available'; // Exibe cor padrão se não fornecida

    return GestureDetector(
      onTap: () => navigateToDetails(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white, // Definindo a cor do fundo
          boxShadow: [ // Sombras para dar destaque
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5.0,
              offset: Offset(0, 2), // Sombra suave
            ),
          ],
        ),
        padding: EdgeInsets.all(10), // Garantindo algum espaçamento interno
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Centralizando os itens
          children: [
            // Carregando imagem com fallback
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: imageUrl.startsWith('http') 
                  ? Image.network(
                      imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _fallbackImage(); // Caso falhe ao carregar a imagem
                      },
                    )
                  : Image.asset(
                      imageUrl,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _fallbackImage(); // Caso falhe ao carregar a imagem
                      },
                    ),
            ),
            SizedBox(height: 8),
            // Exibindo o nome do cachorro
            Text(
              dogName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Cor do texto
              ),
              textAlign: TextAlign.center, // Alinhamento central
            ),
            SizedBox(height: 4),
            // Exibindo a idade do cachorro
            Text(
              dogAge,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700], // Cor mais suave
              ),
              textAlign: TextAlign.center, // Centralizando
            ),
            SizedBox(height: 4),
            // Exibindo a cor do cachorro (opcional)
            Text(
              displayColor,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500], // Cor mais clara para a cor do cachorro
              ),
              textAlign: TextAlign.center, // Centralizando
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

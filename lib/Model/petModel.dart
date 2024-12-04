class PetModel {
  final String name;
  final int age;
  final double weight;
  final String color;
  final List<String> images;

  PetModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.color,
    required this.images,
  });

  /// Converte um JSON em uma instância de [PetModel].
  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      name: json['name'] ?? 'Unknown',
      age: json['age'] is int ? json['age'] : 0,  // Garantir que a idade seja um número inteiro
      weight: (json['weight'] ?? 0).toDouble(),
      color: json['color'] ?? 'Unknown',
      images: json['images'] is List ? List<String>.from(json['images'] ?? []) : [], // Verificar se é uma lista válida
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'images': images,
    };
  }

  /// Retorna a URL da imagem principal (primeira imagem na lista).
  String get imageUrl {
    return images.isNotEmpty ? images[0] : 'URL_Padrão_da_Imagem'; // Retorna a primeira imagem ou uma URL padrão
  }

  /// Retorna uma descrição fixa ou personalizada para o pet.
  String get description {
    return "Este é um pet adorável que está à espera de um lar.";
  }

  /// Retorna o gênero do pet, fixo ou baseado na lógica da aplicação.
  String get gender {
    return "Masculino"; // Exemplo fixo; ajuste conforme necessário
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pet_adopt/view/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';  // Importar SharedPreferences

class RegisterPetPage extends StatefulWidget {
  const RegisterPetPage({super.key});

  @override
  State<RegisterPetPage> createState() => _RegisterPetPageState();
}

class _RegisterPetPageState extends State<RegisterPetPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController imagesController = TextEditingController();

  // Função para criar o pet
  Future<void> _createPet() async {
    final String url = "https://pet-adopt-dq32j.ondigitalocean.app/pet/create";

    // Recuperar o token armazenado
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('user_token');

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Token não encontrado. Faça login novamente.")),
      );
      return;
    }

    // Dados do corpo da requisição
    final Map<String, dynamic> body = {
      "name": nameController.text,
      "color": colorController.text,
      "weight": int.tryParse(weightController.text) ?? 0,
      "age": int.tryParse(ageController.text) ?? 0,
      "images": imagesController.text.split(","),
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token", // Enviar o token na autorização
        },
        body: json.encode(body),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Pet criado com sucesso!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao criar pet: ${response.body}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro: $e")),
      );
    }
  }

  // Função que cria um TextField personalizado
  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFb19cd9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: Color(0xFFb19cd9),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 30,
                    child: Image.asset(
                      'assets/images/register_pet.png',
                      height: 300,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(90),
                  topRight: Radius.circular(90),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 11),
                  Center(
                    child: Text(
                      "Register a Pet",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  buildTextField("Nome:", nameController),
                  SizedBox(height: 15),
                  buildTextField("Cor:", colorController),
                  SizedBox(height: 15),
                  buildTextField("Peso (kg):", weightController),
                  SizedBox(height: 15),
                  buildTextField("Idade (meses):", ageController),
                  SizedBox(height: 15),
                  buildTextField(
                      "Imagens (URLs separadas por vírgula):", imagesController),
                  SizedBox(height: 20),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFb19cd9),
                          ),
                          onPressed: _createPet, // Chama a função para criar o pet
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

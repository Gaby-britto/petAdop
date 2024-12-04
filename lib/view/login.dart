import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_adopt/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = "";
  String? _authToken;
  
  // Definindo a chave para o formulário
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Por favor, preencha todos os campos.";
      });
      return;
    }

    final Uri url = Uri.parse("https://pet-adopt-dq32j.ondigitalocean.app/user/login");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['token'] != null) {
          // Armazenar o token nas SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_token', responseData['token']);

          setState(() {
            _authToken = responseData['token'];
            _errorMessage = "";
          });

          print('Token armazenado: $_authToken');

          // Navegar para a próxima tela
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else {
          setState(() {
            _errorMessage = "Login falhou. Tente novamente.";
          });
        }
      } else {
        setState(() {
          _errorMessage = "Erro ao fazer login. Código: ${response.statusCode}";
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = "Ocorreu um erro. Verifique sua conexão.";
      });
      print('Erro: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFb19cd9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: const Color(0xFFb19cd9),
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 30,
                    child: Image.asset(
                      'assets/images/image_login.png',
                      height: 500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              decoration: const BoxDecoration(
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
                  const Center(
                    child: Text(
                      "Access",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Formulário de Login
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Campo de E-mail
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, insira um email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Digite seu email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Campo de Senha
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor, insira sua senha";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Digite sua senha",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black, width: 1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  // Botão de login
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFb19cd9),
                          ),
                          onPressed: _login,  // Chama a função de login
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Mensagem de erro
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 14),
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

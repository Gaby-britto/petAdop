// import 'package:flutter/material.dart';
// import 'package:pet_adopt/controller/auth_controller.dart';
// import 'package:pet_adopt/view/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();


//   // Função para realizar o login
//   Future<void> _login() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       final email = _emailController.text;
//       final password = _passwordController.text;

//       final token = await AuthController.loginUser(email, password);
      
//       if (token != null) {
//         // Armazenar o token com SharedPreferences
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setString('token', token); // Armazenando o token

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Login bem-sucedido!")),
//         );

//         // Redirecionar para a tela inicial ou de pets
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const Home()),  // Pode ser outra página conforme sua lógica
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Falha ao realizar login!")),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: const Color(0xFFb19cd9),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Container(
//                     color: const Color(0xFFb19cd9),
//                     height: double.infinity,
//                     width: double.infinity,
//                   ),
//                   Positioned(
//                     top: 30,
//                     child: Image.asset(
//                       'assets/images/image_login.png',
//                       height: 500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(90),
//                   topRight: Radius.circular(90),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 11),
//                   const Center(
//                     child: Text(
//                       "Access",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Formulário de Login
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         // Campo de E-mail
//                         TextFormField(
//                           controller: _emailController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Por favor, insira um email";
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             hintText: "Digite seu email",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: const BorderSide(color: Colors.black, width: 1),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Campo de Senha
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Por favor, insira sua senha";
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             hintText: "Digite sua senha",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: const BorderSide(color: Colors.black, width: 1),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                       ],
//                     ),
//                   ),
//                   // Botão de login
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10.0),
//                       child: Container(
//                         width: 200,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFb19cd9),
//                           ),
//                           onPressed: _login,  // Chama a função de login
//                           child: const Text(
//                             "Login",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

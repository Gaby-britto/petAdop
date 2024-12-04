// import 'package:flutter/material.dart';
// import 'package:pet_adopt/Controller/userController.dart';
// import 'package:pet_adopt/Model/usermodel.dart';
// import 'package:pet_adopt/view/login.dart';
// import 'package:pet_adopt/widgets/card_form.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final userController = UserController();
//   final formKey = GlobalKey<FormState>();
//   final user = UserModel();

//   // Controladores dos campos do formulário
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
 

//   // Função para registrar o usuário
//   Future<void> _registerUser() async {
//     if (formKey.currentState!.validate()) {
//       formKey.currentState!.save();

//       // Atribuir os valores ao modelo de usuário
//       user.name = nameController.text;
//       user.email = emailController.text;
//       user.phone = phoneController.text;
//       user.password = passwordController.text;

//       // Chamar o método de registro
//       final message = await userController.registerUser(user);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message)),
//       );

//       // Se o registro for bem-sucedido, redirecionar para a tela de login
//       if (message == 'Usuário cadastrado com sucesso!') {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginPage()),
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
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Imagem do topo
//               Stack(
//                 alignment: Alignment.topCenter,
//                 children: [
//                   Container(
//                     color: const Color(0xFFb19cd9),
//                     height: 350,
//                     width: double.infinity,
//                   ),
//                   Positioned(
//                     top: 30,
//                     child: Image.asset(
//                       'assets/images/image_home.png',
//                       height: 300,
//                     ),
//                   ),
//                 ],
//               ),

//               // Formulário
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(90),
//                     topRight: Radius.circular(90),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           'Bring Us ',
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const Text(
//                           'Home',
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFb19cd9),
//                           ),
//                         ),
//                         const Spacer(),
//                         Image.asset('assets/images/losango.png'),
//                       ],
//                     ),
//                     const SizedBox(height: 9),
//                     Text(
//                       'There are thousands of pets waiting for you to get them home. We rescue pets from different countries and give...',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                     const SizedBox(height: 15),

//                     // Título
//                     const Center(
//                       child: Text(
//                         "Register",
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFFb19cd9),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 15),

//                     // Formulário
//                     Form(
//                       key: formKey,
//                       child: Column(
//                         children: [
//                           // Chamando o CustomForm com os controladores
//                           CustomForm(
//                             nameController: nameController,
//                             emailController: emailController,
//                             phoneController: phoneController,
//                           ),
//                           const SizedBox(height: 15),
//                           TextFormField(
//                             controller: passwordController,
//                             obscureText: true,
//                             decoration: const InputDecoration(
//                               labelText: "Password",
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Informe uma senha';
//                               }
//                               if (value.length < 6) {
//                                 return 'A senha deve ter pelo menos 6 caracteres';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 15),
//                           // Campo de Confirmação de Senha
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     // Botão "Save"
//                     Center(
//                       child: SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFb19cd9),
//                           ),
//                           onPressed: _registerUser,
//                           child: const Text(
//                             "Save",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import "package:flutter/Material.dart";
// import "package:invoice/presentation/view/sign_in/register.dart";
// import "package:lottie/lottie.dart";
// import 'package:invoice/presentation/view/invoice_app.dart';
//
// class login extends StatefulWidget {
//   const login({super.key});
//
//   @override
//   State<login> createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//   bool _passwordVisible = false;
//
//
//   bool _validateEmail(String email) {
//     // Regular expression for validating email
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     return emailRegex.hasMatch(email);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final Map <String,String> logincredentials={'nandhini':'nandhini@123'};
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//     final TextEditingController _emailController=TextEditingController();
//     final TextEditingController _passwordController=TextEditingController();
//     // return Scaffold(
//     //     body: Container(
//     //    child: Lottie.asset('assets/animations/login_invoice.json')
//     //    ),
//     //  );
//     // return  Scaffold(
//     //   body: Center(
//     //     child: Padding(
//     //       padding: const EdgeInsets.all(20.0),
//     //       child: Form(
//     //         key: _formKey,
//     //         child: SingleChildScrollView(
//     //           child: Column(
//     //             mainAxisAlignment: MainAxisAlignment.center,
//     //             children: <Widget>[
//     //                 Lottie.asset('animations/login_invoice.json'),
//     //               const Text(
//     //                 'Login',
//     //                 style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//     //               ),
//     //               const SizedBox(height: 20.0),
//     //               TextFormField(
//     //                 decoration: const InputDecoration(
//     //                   labelText: 'Email',
//     //                   border: OutlineInputBorder(),
//     //                   prefixIcon: Icon(Icons.email),
//     //                 ),
//     //                 controller: _emailController,
//     //                 validator: (value) {
//     //                   if (value == null || value.isEmpty) {
//     //                     return 'Please enter your email';
//     //                   }
//     //                   // Add your email validation logic here
//     //                   return null;
//     //                 },
//     //               ),
//     //               SizedBox(height: 20.0),
//     //               TextFormField(
//     //                 decoration: InputDecoration(
//     //                   labelText: 'Password',
//     //                   border: OutlineInputBorder(),
//     //                   prefixIcon: Icon(Icons.lock),
//     //                 ),
//     //                 controller: _passwordController,
//     //                 obscureText: true,
//     //                validator: (value) {
//     //                   if (value == null || value.isEmpty) {
//     //                     return 'Please enter your password';
//     //                   }
//     //                   if (value.length < 6) {
//     //                     return 'Password must be at least 6 characters long';
//     //                   }
//     //                   return null;
//     //                 },
//     //
//     //               ),
//     //               SizedBox(height: 30.0),
//     //               ElevatedButton(
//     //                 onPressed: () {
//     //                   if (_formKey.currentState!.validate()) {
//     //                     String username = _emailController.text;
//     //                     String password = _passwordController.text;
//     //
//     //                     if (logincredentials.containsKey(username) && logincredentials[username] == password) {
//     //                       // Credentials are correct, navigate to the next page
//     //                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//     //                         builder: (context) => TestApp())
//     //                       );
//     //                     } else {
//     //                       // Show an error message if the credentials are incorrect
//     //                       ScaffoldMessenger.of(context).showSnackBar(
//     //                         SnackBar(content: Text('Invalid credentials')),
//     //                       );
//     //                     }
//     //                   }
//     //                 },
//     //                 child: Text('Login'),
//     //                 style: ElevatedButton.styleFrom(
//     //                   minimumSize: Size(double.infinity, 50), // Full width button
//     //                 ),
//     //               ),
//     //
//     //               // Add "Forgot password" or "Create account" links here if needed
//     //             ],
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // );
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             colors: [Colors.blue.shade900, Colors.white60],
//           ),
//         ),
//         child: ListView(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                   width: 200,
//                   height: 150,
//                   // Optionally, add a logo or Lottie animation here
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Email',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//
//             SizedBox(height: 20),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: !_passwordVisible,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.lock),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _passwordVisible ? Icons.visibility : Icons.visibility_off,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _passwordVisible = !_passwordVisible;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: Container(
//                 height: 50,
//                 width: 250,
//                 decoration: BoxDecoration(
//                     color: Colors.green, borderRadius: BorderRadius.circular(20)),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     shadowColor: Colors.transparent,
//                   ),
//                   onPressed: () {
//                                       if (_formKey.currentState!.validate()) {
//                                         String username = _emailController.text;
//                                         String password = _passwordController.text;
//
//                                         if (logincredentials.containsKey(username) && logincredentials[username] == password) {
//                                           // Credentials are correct, navigate to the next page
//                                           Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                             builder: (context) => TestApp())
//                                           );
//                                         } else {
//                                           // Show an error message if the credentials are incorrect
//                                           ScaffoldMessenger.of(context).showSnackBar(
//                                             SnackBar(content: Text('Invalid credentials')),
//                                           );
//                                         }
//                                       }
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.white, fontSize: 25),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10, bottom: 200),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => register_page(  )),
//                   );
//
//                 },
//                 child: Text(
//                   'Don\'t Have an Account? Register',
//                   style: TextStyle(color: Colors.black, fontSize: 15),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//
//
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/domain/models/user.dart';
import 'package:invoice/presentation/pages/sign_in/register.dart';
import 'package:invoice/presentation/providers/invoiceProvider.dart';
import 'package:invoice/presentation/providers/userProvider.dart';
import 'package:lottie/lottie.dart'; // Assuming you have Lottie animations
import 'package:invoice/presentation/pages/invoice_app.dart'; // Make sure this path is correct
import 'package:invoice/presentation/pages/sign_in/register.dart'; // Correct the import path for register_page

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState <Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> logincredentials = {'nandhini@gmail.com': 'nandhini@123'};
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue.shade900, Colors.white60],
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    // Optionally, add a logo or Lottie animation here
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!_validateEmail(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 3) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.green, borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () async {

                      if (_formKey.currentState!.validate()) {
                        final String email = _emailController.text;
                        final String password = _passwordController.text;


                        await ref
                            .read(authUserDetailsProvider.notifier)
                            .authUserDetails(email, password);
                        final authUser = ref.watch(
                            authUserDetailsProvider.notifier);

                        if (authUser.getAuthUserDetails() is User) {
                         await ref.read(invoiceDetailsProvider.notifier).getInvoice();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (
                                context) => const TestApp()),
                          );
                        } else {
                          print("error");

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid credentials')),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10, bottom: 200),
              //   child: TextButton(
              //     onPressed: (){},
              //
              //     child: Text(
              //       ' Register',
              //       style: TextStyle(color: Colors.black, fontSize: 15),
              //     ),
              //   ),
              //
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

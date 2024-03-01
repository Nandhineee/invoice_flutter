import "package:flutter/Material.dart";
import "package:lottie/lottie.dart";
import 'package:invoice/presentation/view/invoice_app.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {


  bool _validateEmail(String email) {
    // Regular expression for validating email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }


  @override
  Widget build(BuildContext context) {
    final Map <String,String> logincredentials={'nandhini':'nandhini@123'};
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _emailController=TextEditingController();
    final TextEditingController _passwordController=TextEditingController();
    // return Scaffold(
    //     body: Container(
    //    child: Lottie.asset('assets/animations/login_invoice.json')
    //    ),
    //  );
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Lottie.asset('animations/login_invoice.json'),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add your email validation logic here
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    controller: _passwordController,
                    obscureText: true,
                   validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String username = _emailController.text;
                        String password = _passwordController.text;

                        if (logincredentials.containsKey(username) && logincredentials[username] == password) {
                          // Credentials are correct, navigate to the next page
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => TestApp())
                          );
                        } else {
                          // Show an error message if the credentials are incorrect
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid credentials')),
                          );
                        }
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50), // Full width button
                    ),
                  ),

                  // Add "Forgot password" or "Create account" links here if needed
                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
}


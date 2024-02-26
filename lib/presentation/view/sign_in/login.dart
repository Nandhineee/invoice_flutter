import "package:flutter/Material.dart";
import "package:lottie/lottie.dart";
import 'package:invoice/presentation/view/invoice_app.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  bool _validateEmail(String email) {
    // Regular expression for validating email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String _email = '', _password = '';
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
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add your email validation logic here
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
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
                    onSaved: (value) => _password = value!,
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TestApp()),
                        );
                        // Perform login action
                        print('Email: $_email, Password: $_password');
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


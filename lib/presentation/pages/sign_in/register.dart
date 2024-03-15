import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/presentation/pages/invoice_app.dart';
import 'package:invoice/presentation/pages/sign_in/login.dart';
import 'package:invoice/presentation/providers/userProvider.dart';
import 'package:lottie/lottie.dart';

class register_page extends ConsumerStatefulWidget {
  const register_page({super.key});

  @override
  ConsumerState <register_page> createState() => _register_pageState();
}

class _register_pageState extends ConsumerState<register_page> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    // Initially password is obscure
    _passwordVisible = false;
  }


//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RegistrationPage(),
//     );
//   }
// }
//
// class RegistrationPage extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

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

        child: ListView(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,

                ),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
          TextFormField(
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
            ),

            SizedBox(height: 30),
            Column(
              children: <Widget>[
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
                      onPressed: () {}, // Add your onPressed code here!
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 200),
                  child: TextButton(
                    onPressed: () {

                        // ref
                        //     .read(userDataProvider.notifier)
                        //     .authUser(password, name, email);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestApp()),
                        );

                    },
                    child: Text(
                      'Already Have an Account? Sign in',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),

                  ),


                ),


              ],
            )

          ],
        ),
      ),
    );
  }
}

import 'package:firebase_app/Screens/registerScreen.dart';
import 'package:firebase_app/Services/facebook.dart';
import 'package:firebase_app/Services/google.dart';
import 'package:firebase_app/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleAuthService googleService = GoogleAuthService();
  final FacebookAuthService facebookService = FacebookAuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      login();
                    }
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () async {
                    // await googleService.signOut();
                    User? user = await googleService.signInWithGoogle();
                    if (user != null) {
                      print("Sign-In successful: ${user.toString()}");
                    } else {
                      print(user);
                      print("Sign In Failed");
                    }
                  },
                  child: const Text('Google'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      var user = await facebookService.signInWithFacebook();
                      if (user != null) {
                        print(user.toString());
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Facebook'),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New User?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Logged In Succesfully !!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const MyHomePage(
            title: "Home",
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: e.code,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

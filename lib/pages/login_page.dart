import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key, required this.showRegisterPage}) : super(key: key);
  final VoidCallback showRegisterPage;

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  //text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  Future<void> dispose() async {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.devices, size: 108.0),
              //SizedBox(height: 20.0),
              SizedBox(height: 15.0),
              Text(
                'HELLO AGAIN!',
                style: GoogleFonts.staatliches(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
                //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 15.0),
              const Text(
                'Welcome Back, You have been Missed!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-mail',
                      ),
                      controller: _emailController,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Center(
                      child: Text(
                        'Sign-In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a Member?  ',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      ' Register now?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Created by Love',
                style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                ),
              ),
              const Icon(Icons.favorite),
            ]),
          ),
        ),
      ),
    );
  }
}

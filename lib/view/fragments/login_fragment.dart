import 'package:flutter/material.dart';
import '../../enums/palette.dart';
import '../../managers/account_manager.dart';
import '../main_page.dart';

class LoginFragment extends StatefulWidget {
  final void Function(int) setIndex;
  LoginFragment({required this.setIndex});

  @override
  State<LoginFragment> createState() => _LoginFragmentState();
}



class _LoginFragmentState extends State<LoginFragment> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;
    AccountManager().login(email, password);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 250, 30, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Email:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Password:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    const Text(
                      '',
                      style: TextStyle(color: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _login();
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );},
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                    Divider(),

                    SizedBox(height: 16),
                    const Text(
                      'Non sei ancora registrato?',
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Registrati',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}

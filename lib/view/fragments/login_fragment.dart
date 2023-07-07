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
  String errorText = '';

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    await AccountManager().login(email, password);
  }

  void updateText(String newText) {
    setState(() {
      errorText = newText;
    });
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
                    keyboardType: TextInputType.emailAddress,
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    errorText,
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      try {
                        await _login();
                        Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => const MainPage(),
                            ),
                        );
                      } catch (e) {
                        updateText(e.toString());
                        print(e.toString());
                      }
                    },
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
                  GestureDetector(
                    onTap: () {
                      widget.setIndex(2);
                    },
                    child: Text(
                      'Registrati',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),
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

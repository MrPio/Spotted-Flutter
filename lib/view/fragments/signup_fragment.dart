import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../enums/palette.dart';
import '../../managers/account_manager.dart';
import '../../model/user.dart';

class SignupFragment extends StatefulWidget {
  final void Function(int) setIndex;

  SignupFragment({required this.setIndex});

  @override
  State<SignupFragment> createState() => _SignupFragmentState();
}

class _SignupFragmentState extends State<SignupFragment> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _instaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    String name = _nameController.text;
    if(name=='')throw('Nome è obbligatorio');
    String surname = _surnameController.text;
    if(surname=='')throw('Cognome è obbligatorio');

    String? phone = _phoneController.text;
    if(phone=='') phone=null;
    String? insta = _instaController.text;
    if(insta=='') insta=null;

    String email = _emailController.text;
    String password = _passwordController.text;
    await AccountManager().signUp(email, password,User(name:name, surname: surname, cellNumber: phone, instagramNickname: insta));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 150, 10, 0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'lato_bold',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.start,
                    'Nome:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nome',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Cognome:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: _surnameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Cognome',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '*Genere:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  Wrap(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Radio(value: 0, groupValue: null, onChanged: null),
                            Text('Maschio'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(value: 1, groupValue: null, onChanged: null),
                            Text('Femmina'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(value: 2, groupValue: null, onChanged: null),
                            Text('Altro'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Text(
                    '*Instagram URL:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: _instaController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Instagram URL',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '*Telefono:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Numero di telefono',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                      // Imposta la lunghezza massima a 10 cifre
                    ],
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'E-mail:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
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
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Text(
                    '* Campi opzionali',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await _signUp();
                      Navigator.of(context).pushNamed("/main");
                    },
                    child: Text('Registrati'),
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
                    'Sei già registrato?',
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.setIndex(1);
                    },
                    child: Text(
                      'Effettua il login',
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

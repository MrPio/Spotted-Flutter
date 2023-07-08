import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotted_flutter/view/partials/rounded_button.dart';

import '../../enums/gender.dart';
import '../../enums/palette.dart';
import '../../managers/account_manager.dart';
import '../../model/user.dart';
import '../main_page.dart';

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
  Gender? selectedGender = null;
  String errorText = '';

  Future<void> _signUp() async {
    String name = _nameController.text;
    if (name == '') throw ('Nome è obbligatorio');
    String surname = _surnameController.text;
    if (surname == '') throw ('Cognome è obbligatorio');
    String? phone = _phoneController.text;
    if (phone == '') phone = null;
    String? insta = _instaController.text;
    if (insta == '') insta = null;
    String email = _emailController.text;
    if (!AccountManager().isEmailValid(email)) throw ('E-mail non adeguata');
    String password = _passwordController.text;
    if (password == '') throw ('Password è obbligatoria');
    await AccountManager().signUp(
        email,
        password,
        User(
            name: name,
            surname: surname,
            cellNumber: phone,
            gender: selectedGender,
            instagramNickname: insta));
  }

  void updateText(String newText) {
    setState(() {
      errorText = newText;
    });
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
                      contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
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
                      contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
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
                            Radio(
                              value: Gender.MALE,
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value!;
                                });
                              },
                            ),
                            Text('Maschio'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: Gender.FEMALE,
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value!;
                                });
                              },
                            ),
                            Text('Femmina'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio(
                              value: Gender.OTHER,
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value!;
                                });
                              },
                            ),
                            Text('Altro'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '*instagram nickname:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: _instaController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                      hintText: 'instagram nickname',
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
                      contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
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
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
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
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding: EdgeInsets.fromLTRB(16, 12, 12, 12),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Palette.darkBlack,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '* Campi opzionali',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    errorText,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 20),
                  RoundedButton('REGISTRATI', onTap: () async {
                    errorText = '';
                    try {
                      await _signUp();
                      Navigator.of(context).popAndPushNamed("/main");
                    } catch (e) {
                      updateText(e.toString());
                    }
                  }),
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

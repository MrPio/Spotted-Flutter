import 'package:flutter/material.dart';

enum Gender {
  male('Ragazzo', Icons.male),
  female('Ragazza', Icons.female),
  other('Altro', Icons.question_mark);

  final String title;
  final IconData icon;

  const Gender(this.title, this.icon);
}

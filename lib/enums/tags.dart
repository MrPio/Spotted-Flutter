import 'package:flutter/material.dart';

enum Tags {
  ALTO(Icons.height),
  BASSO(Icons.height),

  //Hair
  RICCI(Icons.cut),
  LISCI(Icons.cut),
  FELPA(Icons.style),
  CAMICIA(Icons.style),
  GIUBBOTTO(Icons.style),
  CARDIGAN(Icons.style),
  DA_VISTA(Icons.remove_red_eye),
  DA_SOLE(Icons.remove_red_eye);

  String get title =>
      this.name[0] + this.name.substring(1).toLowerCase().replaceAll('_', ' ');
  final IconData icon;

  const Tags(this.icon);
}

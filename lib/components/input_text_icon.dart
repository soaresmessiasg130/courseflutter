
// Input de Formulário com Icon

import 'package:flutter/material.dart';

class InputTextIcon extends StatelessWidget {

  final String label;
  final TextEditingController controller;
  final IconData icon;

  InputTextIcon({
    this.label, 
    this.controller, 
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
            fontSize: 18
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

}

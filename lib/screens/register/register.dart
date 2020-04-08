
//Página de Cadastro de um novo Local

import 'package:flutter/material.dart';
import 'package:knowbefore/components/input_text_icon.dart';
import 'package:knowbefore/models/place.dart';

const _titleRegister = 'Register an place';
const _labelPlace = 'Place';
const _labelDescription = 'Description';
const _buttonText = 'Save';

class RegisterPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPlaceState();
  }
}

class RegisterPlaceState extends State<RegisterPlace> {
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleRegister),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              InputTextIcon(
                label: _labelPlace, 
                controller: _placeController, 
                icon: Icons.location_on
              ),
              InputTextIcon(
                label: _labelDescription, 
                controller: _descriptionController, 
                icon: Icons.speaker_notes
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  child: Text(_buttonText),
                  onPressed: () => _createPlaceItem(context),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  void _createPlaceItem (BuildContext context) {

    final String _place = _placeController.text;
    final String _description = _descriptionController.text;

    if (!_place.isEmpty && _place != 'Cannot be empty')
      if (!_description.isEmpty && _description != 'Cannot be empty')
        Navigator.pop(context, Place(_place, _description));
      else _descriptionController.text = 'Cannot be empty!';
    else _placeController.text = 'Cannot be empty!';
  }
}

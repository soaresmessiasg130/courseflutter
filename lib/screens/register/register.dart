//Página de Cadastro de um novo Local

import 'package:flutter/material.dart';
import 'package:knowbefore/components/input_text_icon.dart';
import 'package:knowbefore/models/place.dart';

const _titleRegister = 'Register an place';
const _labelPlace = 'Place';
const _labelDescription = 'Description';
const _buttonText = 'Save';
const _cbe = 'Cannot be empty!';

class RegisterPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPlaceState();
}

class _RegisterPlaceState extends State<RegisterPlace> {
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
            children: <Widget>[
              InputTextIcon(
                label: _labelPlace,
                controller: _placeController,
                icon: Icons.location_on,
              ),
              InputTextIcon(
                label: _labelDescription,
                controller: _descriptionController,
                icon: Icons.speaker_notes,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  child: Text(_buttonText),
                  onPressed: () => _createPlaceItem(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _createPlaceItem(BuildContext context) {
    final String _place = _placeController.text;
    final String _description = _descriptionController.text;

    if (_place.isNotEmpty && _place != _cbe) {
      if (_description.isNotEmpty && _description != _cbe) {
        Navigator.pop(context, Place(_place, _description));
      } else {
        _descriptionController.text = _cbe;
      }
    } else {
      _placeController.text = _cbe;
    }
  }
}

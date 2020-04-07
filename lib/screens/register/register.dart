
//Página de Cadastro de um novo Local

import 'package:flutter/material.dart';
import 'package:knowbefore/components/input_text_icon.dart';
import 'package:knowbefore/models/place.dart';

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
        title: Text("Register a place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget> [
              InputTextIcon(
                label: 'Place', 
                controller: _placeController, 
                icon: Icons.location_on
              ),
              InputTextIcon(
                label: 'Description', 
                controller: _descriptionController, 
                icon: Icons.speaker_notes
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  child: Text("Save"),
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
    print('Clicou no botão--->>Valores:\n');
    final String _place = _placeController.text;
    _placeController.text = '';
    final String _description = _descriptionController.text;
    _descriptionController.text = '';
    if (_place != null && _place.isNotEmpty && _description != null && _description.isNotEmpty) {
      final _placeView = Place(_place, _description);
      debugPrint('$_placeView');
      Navigator.pop(context, _placeView);
    } else {
      _placeController.text = 'SET PLACE';
      _descriptionController.text = 'SET DESCRIPTION';
    }
  }
}

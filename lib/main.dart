import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  KnowBefore()
);

class KnowBefore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RegisterPlace(),
      )
    );
  }
}

class RegisterPlace extends StatelessWidget {
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
        child: Column(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _placeController,
                style: TextStyle(
                    fontSize: 18
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.location_on),
                  labelText: "Place name",
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _descriptionController,
                style: TextStyle(
                    fontSize: 18
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.speaker_notes),
                  labelText: "Description of the place"
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  print('Clicou no botão--->>Valores:\n');
                  final String _place = _placeController.text;
                  _placeController.text = '';
                  final String _description = _descriptionController.text;
                  _descriptionController.text = '';
                  if (_place != null && _place.isNotEmpty && _description != null && _description.isNotEmpty) {
                    final _placeView = Place(_place, _description);
                    debugPrint('$_placeView');
                  } else {
                    _placeController.text = 'SET PLACE';
                    _descriptionController.text = 'SET DESCRIPTION';
                  }
                },
              ),
            )
          ]
        ),
      ),
    );
  }
}

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Know Before")
      ),
      body: Column(
        children: <Widget>[
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
          ItemPlace(Place("Fortaleza", "Terra do Sol")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemPlace extends StatelessWidget {

  final Place _place;

  ItemPlace(this._place);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_place.placeTitle.toString()),
        subtitle: Text(_place.placeDescription.toString()),
      ),
    );
  }
}

class Place {
  final String placeTitle;
  final String placeDescription;
  Place(this.placeTitle, this.placeDescription);
  @override
  String toString () {
    return '{"place":["placeTitle":"$placeTitle","placeDescription":"$placeDescription"]}';
  }
}
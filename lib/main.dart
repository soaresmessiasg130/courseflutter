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
        body: ListPlaces(),
      )
    );
  }
}

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

class InputTextIcon extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  InputTextIcon({this.label, this.controller, this.icon});
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

class ListPlaces extends StatefulWidget {
  final List<Place> _places = List();
  @override
  State<StatefulWidget> createState() {
    return ListPlacesState();
  }
}

class ListPlacesState extends State<ListPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Know Before")
      ),
      body: ListView.builder(
        itemCount: widget._places.length,
        itemBuilder: (context, i) {
          final place = widget._places[i];
          return ItemPlace(place); 
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Place> future = Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return RegisterPlace();
            }
          ));
          future.then((item) {
            Future.delayed(
              Duration(seconds: 1),
              (){
                if (item != null) {
                  setState((){
                    debugPrint('Entrou no Future!!!');
                    debugPrint('$item');
                    widget._places.add(item);
                  });
                }
              }
            );
          });
        },
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
        leading: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('1'),
                Icon(Icons.monetization_on),
              ],
            ),
          ],
        ),
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
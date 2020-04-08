
// Lista de Lugares

import 'package:flutter/material.dart';
import 'package:knowbefore/components/list/item.dart';
import 'package:knowbefore/models/place.dart';
import 'package:knowbefore/screens/register/register.dart';

const _titleAppBar = "Know Before";

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
          title: Text(_titleAppBar)
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
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => RegisterPlace()
          )).then((item) =>_reloadList(item));
        },
      ),
    );
  }

  void _reloadList(Place place) {
    if (place != null) {
      setState((){
        widget._places.add(place);
      });
    }
  }

}

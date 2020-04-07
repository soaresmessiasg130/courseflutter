import 'package:flutter/material.dart';
import 'package:knowbefore/models/place.dart';

class ItemPlace extends StatelessWidget {
  final Place _place;
  ItemPlace(this._place);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.location_on),
        title: Text(_place.placeTitle.toString()),
        subtitle: Text(_place.placeDescription.toString()),
      ),
    );
  }
}
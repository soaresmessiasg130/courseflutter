
// Lista de Lugares

import 'package:flutter/material.dart';
import 'package:knowbefore/components/list/item.dart';
import 'package:knowbefore/models/place.dart';
import 'package:knowbefore/screens/register/register.dart';

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
              Duration(milliseconds: 650),
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

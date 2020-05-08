// Lista de Lugares

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:knowbefore/components/list/item.dart';
import 'package:knowbefore/models/place.dart';
import 'package:knowbefore/screens/dash/dashboar.dart';
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
      appBar: AppBar(title: Text(_titleAppBar)),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
//          Expanded(
////            child: Dashboard()
//          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4),
              decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: ListView.builder(
                itemCount: widget._places.length,
                itemBuilder: (context, i) {
                  final place = widget._places[i];
                  return ItemPlace(place);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPlace()))
              .then((item) => _reloadList(item));
        },
      ),
    );
  }

  void _reloadList(Place place) {
    if (place != null) {
      setState(() {
        widget._places.add(place);
      });
    }
  }
}

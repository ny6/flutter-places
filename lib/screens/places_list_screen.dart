import 'package:flutter/material.dart';
import '../utils/constants.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = kPlacesListScreenRouteName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(kAddPlaceScreenRouteName);
            },
          )
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

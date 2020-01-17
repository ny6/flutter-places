import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import '../providers/providers.dart';

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
      body: Consumer<Places>(
        child: Center(child: Text('Got no places yet, start adding some!')),
        builder: (ctx, places, ch) => places.items.length == 0
            ? ch
            : ListView.builder(
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[i].image),
                  ),
                  title: Text(places.items[i].title),
                  onTap: () {},
                ),
                itemCount: places.items.length,
              ),
      ),
    );
  }
}

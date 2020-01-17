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
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<Places>(
                child: Center(
                    child: Text('Got no places yet, start adding some!')),
                builder: (ctx, places, ch) => places.items.length == 0
                    ? ch
                    : ListView.builder(
                        itemBuilder: (_, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(places.items[i].image),
                          ),
                          title: Text(places.items[i].title),
                          subtitle: Text(places.items[i].location.address),
                          onTap: () => Navigator.of(context).pushNamed(
                            kPlaceDetailScreenRouteName,
                            arguments: places.items[i].id,
                          ),
                        ),
                        itemCount: places.items.length,
                      ),
              ),
      ),
    );
  }
}

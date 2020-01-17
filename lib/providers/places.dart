import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:places/utils/constants.dart';
import '../models/models.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  Future<void> addPlace(
      String title, File image, PlaceLocation location) async {
    final id = DateTime.now().toString();

    final address = await LocationHelper.getPlaceAddress(
        location.latitude, location.longitude);

    final updatedLocation = PlaceLocation(
      latitude: location.latitude,
      longitude: location.longitude,
      address: address,
    );

    final newPlace = Place(
      id: id,
      title: title,
      image: image,
      location: updatedLocation,
    );

    _items.add(newPlace);

    notifyListeners();

    DBHelper.insert(
      kPlacesTableName,
      {
        'id': id,
        'title': title,
        'image': image.path,
        'loc_lat': newPlace.location.latitude,
        'loc_lng': newPlace.location.longitude,
        'address': newPlace.location.address,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final data = await DBHelper.getData(kPlacesTableName);
    _items = data
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
          ),
        )
        .toList();

    notifyListeners();
  }
}

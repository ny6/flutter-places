import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:places/utils/constants.dart';
import '../models/models.dart';
import '../helpers/db_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace(String title, File image) {
    final id = DateTime.now().toString();

    final newPlace = Place(
      id: id,
      title: title,
      image: image,
      location: null,
    );

    _items.add(newPlace);

    notifyListeners();

    DBHelper.insert(
      kPlacesTableName,
      {'id': id, 'title': title, 'image': image.path},
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
            location: null,
          ),
        )
        .toList();

    notifyListeners();
  }
}

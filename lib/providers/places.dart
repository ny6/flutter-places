import 'package:flutter/foundation.dart';
import '../models/models.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];
}

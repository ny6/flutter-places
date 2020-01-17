const GOOGLE_API_KEY = 'AIzaSyBTos7QNT-yJOfXQEXUBYI5y2bL54V0DkU';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    final String latLng = '$latitude,$longitude';

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latLng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latLng&key=$GOOGLE_API_KEY';
  }
}

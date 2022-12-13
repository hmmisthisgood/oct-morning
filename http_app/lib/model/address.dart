// {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }

import 'geo.dart';

class Address {
  final String street, suite, city, zipcode;
  Geo geo;
  // Map<String, String> geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  Address convertJsonToAddress(Map json) {
    return Address(
        street: street,
        suite: suite,
        city: city,
        zipcode: zipcode,
        geo: Geo.convertJsonToGeo(json['geo']));
  }
}

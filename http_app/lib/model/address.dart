// {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }

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

  static Address convertJsonToAddress(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo:
            // json['geo']

            Geo.convertJsonToGeo(json['geo']));
  }

  Map toMap() {
    return {};
  }
}

// {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//   }

class Geo {
  final String lattitude, longitude;

  Geo({required this.lattitude, required this.longitude});

  static Geo convertJsonToGeo(Map json) {
    return Geo(
      lattitude: json['lat'],
      longitude: json['lng'],
    );
  }
}

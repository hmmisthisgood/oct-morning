// {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//   }

class Geo {
  final String lattitude, longitude;

  Geo({required this.lattitude, required this.longitude});
  static Geo convertJsonToGeo(Map json) {
    return Geo(lattitude: json['lat'], longitude: json['lng']);
  }
}

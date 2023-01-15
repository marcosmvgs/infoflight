class Airfield {
  final String icao;
  final String city;
  final String name;
  final String country;
  String? color;
  final String metar;

  Airfield({
    required this.icao,
    required this.city,
    required this.country,
    required this.name,
    required this.metar,
    this.color,
  });
}

class Airfield {
  final String icao;
  final String city;
  final String name;
  final String country;
  String? color;
  String? metar;
  String? taf;

  Airfield({
    required this.icao,
    required this.city,
    required this.country,
    required this.name,
    this.metar,
    this.taf,
    this.color,
  });
}

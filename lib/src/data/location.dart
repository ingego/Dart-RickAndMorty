class Location {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List residents;
  final String url;
  final String created;

  Location(
      {required this.id,
      required this.name,
      required this.type,
      required this.dimension,
      required this.residents,
      required this.url,
      required this.created});

  @override
  String toString() {
    return "id:$id  name:$name   type:$type  url:$url";
  }

  factory Location.fromMap(Map<String, dynamic> data) => Location(
      id: data["id"],
      name: data["name"],
      type: data["type"],
      dimension: data["dimension"],
      residents: data["residents"],
      url: data["url"],
      created: data["created"]);
}

class Episode {
  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List characters;
  final String url;
  final String created;

  Episode(
      {required this.id,
      required this.name,
      required this.airDate,
      required this.episode,
      required this.characters,
      required this.url,
      required this.created});

  @override
  String toString() {
    return "id:$id  name:$name   type:$airDate  url:$url";
  }

  factory Episode.fromMap(Map<String, dynamic> data) => Episode(
      id: data["id"],
      name: data["name"],
      airDate: data["air_date"],
      episode: data["episode"],
      characters: data["characters"],
      url: data["url"],
      created: data["created"]);
}

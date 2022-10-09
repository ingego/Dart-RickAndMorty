class Character {
  final int id;
  final String name;

  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final Map origin;
  final Map location;
  final List episode;
  final String url;
  final String created;
  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.image,
      required this.origin,
      required this.location,
      required this.episode,
      required this.url,
      required this.created});

  @override
  String toString() {
    return "id:$id   name:$name    status:$status   gender:$gender";
  }

  factory Character.fromMap(Map<String, dynamic> data) => Character(
      id: data["id"],
      name: data["name"],
      status: data["status"],
      species: data["species"],
      type: data["type"],
      gender: data["gender"],
      image: data["image"],
      origin: data["origin"],
      location: data["location"],
      episode: data["episode"],
      url: data["url"],
      created: data["created"]);
}

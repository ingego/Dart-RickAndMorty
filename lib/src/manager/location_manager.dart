import 'package:alt_rick_and_morty/src/data/location.dart';
import 'package:alt_rick_and_morty/src/rick_and_morty_api_base.dart';

class LocationManager extends ApiManager {
  Future<List<Location>> getMassiveLocations({int page = 1}) async {
    List<Location> locations = [];
    var char = await get<Map<String, dynamic>>(
      method: Methods.location,
      params: "?page=$page",
    );
    for (var value in (char?.data?["results"] ?? [])) {
      locations.add(Location.fromMap(value));
    }
    return locations;
  }

  Future<Location?> getLocation({required int id}) async {
    var char = await get<Map<String, dynamic>>(
      method: Methods.location,
      params: "/$id",
    );
    try {
      return Location.fromMap(char!.data!);
    } catch (e) {
      return null;
    }
  }

  Future<List<Location>?> getMultipleLocation({required List<int> id}) async {
    var idString = id
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");
    var char = await get(method: Methods.location, params: "/$idString");
    try {
      List<Location> chars = [];
      for (var value in char?.data) {
        chars.add(Location.fromMap(value));
      }
      return chars;
    } catch (e) {
      return null;
    }
  }

  Future<List<Location>> getFilteredLocations(
      {String? name, String? episode}) async {
    var params = "?";

    if (name != null) {
      params += "name=$name&";
    }
    if (episode != null) {
      params += "episode=$episode&";
    }

    List<Location> locations = [];
    var char = await get<Map<String, dynamic>>(
      method: Methods.location,
      params: params,
    );
    for (var value in (char?.data?["results"] ?? [])) {
      locations.add(Location.fromMap(value));
    }
    return locations;
  }
}

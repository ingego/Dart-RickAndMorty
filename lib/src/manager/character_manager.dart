import 'package:rick_and_morty_api/src/data/character.dart';
import 'package:rick_and_morty_api/src/rick_and_morty_api_base.dart';

class CharacterManager extends ApiManager {
  Future<List<Character>> getMassiveCharacters({int page = 1}) async {
    List<Character> characters = [];
    var char = await get<Map<String, dynamic>>(
      method: Methods.character,
      params: "?page=$page",
    );
    for (var value in (char?.data?["results"] ?? [])) {
      characters.add(Character.fromMap(value));
    }
    return characters;
  }

  Future<Character?> getCharacter({required int id}) async {
    var char = await get<Map<String, dynamic>>(
      method: Methods.character,
      params: "/$id",
    );
    try {
      return Character.fromMap(char!.data!);
    } catch (e) {
      return null;
    }
  }

  Future<List<Character>?> getMultipleCharacter({required List<int> id}) async {
    var idString = id
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");
    var char = await get(method: Methods.character, params: "/$idString");
    try {
      List<Character> chars = [];
      for (var value in char?.data) {
        chars.add(Character.fromMap(value));
      }
      return chars;
    } catch (e) {
      return null;
    }
  }

  Future<List<Character>> getFilteredCharacters(
      {String? name, String? status, String? gender}) async {
    var params = "?";

    if (name != null) {
      params += "name=$name&";
    }
    if (status != null) {
      params += "status=$status&";
    }

    if (gender != null) {
      params += "gender=$gender&";
    }

    List<Character> characters = [];
    var char = await get<Map<String, dynamic>>(
      method: Methods.character,
      params: params,
    );
    for (var value in (char?.data?["results"] ?? [])) {
      characters.add(Character.fromMap(value));
    }
    return characters;
  }
}

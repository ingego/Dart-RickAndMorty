import 'package:logger/logger.dart';
import 'package:rick_and_morty_api/src/manager/character_manager.dart';
import 'package:test/test.dart';

void main() {
  group("Characters", () {
    late CharacterManager charApi;
    setUp(() {
      charApi = CharacterManager();
    });

    test("get empty characters", () async {
      var characters = await charApi.getMassiveCharacters(page: 100);
      expect(characters.isEmpty, true);
    });
    test("get List characters", () async {
      var characters = await charApi.getMassiveCharacters(page: 1);
      expect(characters.isNotEmpty, true);
    });
    test("get single character", () async {
      var char = await charApi.getCharacter(id: 1);
      expect(true, char != null);
    });
    test("get single character(null)", () async {
      var char = await charApi.getCharacter(id: 1000);

      Logger().d([1, 3, 5].toString());
      expect(true, char == null);
    });

    test("get Multiple characters", () async {
      var char = await charApi.getMultipleCharacter(id: [1, 5]);
      Logger().d(char);
    });
    test("get filtered characters (without filters)", () async {
      var char = await charApi.getFilteredCharacters();
      Logger().d(char);
    });
    test("get filtered characters (with  name)", () async {
      var char = await charApi.getFilteredCharacters(name: "rick");
      Logger().d(char);
    });
    test("get filtered characters (with  name, status)", () async {
      var char =
          await charApi.getFilteredCharacters(name: "rick", status: "Alive");
      Logger().d(char);
    });
    test("get filtered characters (with  name, gender)", () async {
      var char =
          await charApi.getFilteredCharacters(name: "rick", gender: "Male");
      Logger().d(char);
    });
    test("get filtered characters (with  name, gender (error))", () async {
      var char =
          await charApi.getFilteredCharacters(name: "rick", gender: "sdes");
      Logger().d(char);
    });
  });
}

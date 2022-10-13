import 'package:logger/logger.dart';
import 'package:alt_rick_and_morty/src/manager/character_manager.dart';
import 'package:alt_rick_and_morty/src/manager/location_manager.dart';
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
  group("Location", () {
    late LocationManager locApi;
    setUp(() {
      locApi = LocationManager();
    });

    test("get location(error)", () async {
      var loc = await locApi.getLocation(id: 999696);
      Logger().d(loc);
    });
    test("get location", () async {
      var loc = await locApi.getLocation(id: 1);
      Logger().d(loc);
    });
    test("get locations (page)", () async {
      var loc = await locApi.getMassiveLocations();
      Logger().d(loc);
    });

    test("get locations (error)", () async {
      var loc = await locApi.getMassiveLocations(page: 79797979);
      Logger().d(loc);
    });
    test("get multiple locations ", () async {
      var loc = await locApi.getMultipleLocation(id: [1, 5, 9]);
      Logger().d(loc);
    });

    test("get filtered location", () async {
      var loc = await locApi.getFilteredLocations(episode: "1");
      Logger().d(loc);
    });
  });
}

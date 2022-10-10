import 'package:rick_and_morty_api/src/data/episode.dart';
import 'package:rick_and_morty_api/src/rick_and_morty_api_base.dart';

class EpisodeManager extends ApiManager {
  Future<List<Episode>> getMassiveEpisodes({int page = 1}) async {
    List<Episode> episodes = [];
    var char = await get<Map<String, dynamic>>(
      method: Methods.episode,
      params: "?page=$page",
    );
    for (var value in (char?.data?["results"] ?? [])) {
      episodes.add(Episode.fromMap(value));
    }
    return episodes;
  }

  Future<Episode?> getEpisode({required int id}) async {
    var char = await get<Map<String, dynamic>>(
      method: Methods.episode,
      params: "/$id",
    );
    try {
      return Episode.fromMap(char!.data!);
    } catch (e) {
      return null;
    }
  }

  Future<List<Episode>?> getMultipleEpisode({required List<int> id}) async {
    var idString = id
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");
    var char = await get(method: Methods.episode, params: "/$idString");
    try {
      List<Episode> chars = [];
      for (var value in char?.data) {
        chars.add(Episode.fromMap(value));
      }
      return chars;
    } catch (e) {
      return null;
    }
  }

  Future<List<Episode>> getFilteredEpisodes(
      {String? name, String? episode}) async {
    var params = "?";

    if (name != null) {
      params += "name=$name&";
    }
    if (episode != null) {
      params += "gender=$episode&";
    }

    List<Episode> episodes = [];
    var char = await get<Map<String, dynamic>>(
      method: Methods.episode,
      params: params,
    );
    for (var value in (char?.data?["results"] ?? [])) {
      episodes.add(Episode.fromMap(value));
    }
    return episodes;
  }
}


import 'dart:convert';
import 'dart:developer';
import 'model/music_model.dart';
import '../Pages/homepage.dart';

import 'api_header.dart';
import 'package:http/http.dart' as http;

void main() async {
  ApiManger api = ApiManger();
  await api.gethome();
}

class ApiManger {
  Future getRecommended() async {
    try {
      var responce = await http.get(
        Uri.parse(rapidApiRecommended),
        headers: {
          'x-rapidapi-host': rapidapihost,
          'x-rapidapi-key': rapidapikey,
        },
      );
      if (responce.statusCode == 200) {
        try {
          Map<String, dynamic> data = json.decode(responce.body);
          if (data.containsKey('results')) {
            for (var element in data['results']) {
              musicRepo.recommended.add(MusicModel(
                  musicId: element['videoId'],
                  musicTitle: element['title'],
                  musicAuthor: element['author'],
                  musicThumbnail: element['thumbnail']));
            }
          } else {
            log('Results key not found in response.');
          }
        } catch (e) {
          log('Failed to parse JSON: $e');
        }
      } else {
        log('Failed to load data. Status code: ${responce.statusCode}');
      }
    } catch (a) {
      log('Request failed: $a');
    }
  }
//------------------{Get Home}-------------------

  Future gethome() async {
    try {
      var responce = await http.get(
        Uri.parse(rapidapihome),
        headers: {
          'x-rapidapi-host': rapidapihost,
          'x-rapidapi-key': rapidapikey,
        },
      );
      if (responce.statusCode == 200) {
        try {
          Map<String, dynamic> data = json.decode(responce.body);
          if (data.containsKey('results')) {
            for (var element in data['results']["new_release_albums"]) {
              musicRepo.home.add(MusicModel(
                  musicId: element['playlistId'],
                  musicTitle: element['title'],
                  musicAuthor: element['subtitle'],
                  musicThumbnail: element['thumbnail']));
            }
          } else {
            log('Results key not found in response.');
          }
        } catch (e) {
          log('Failed to parse JSON: $e');
        }
      } else {
        log('Failed to load data. Status code: ${responce.statusCode}');
      }
    } catch (a) {
      log('Request failed: $a');
    }
  }

  //------------------{Get PLaylist}-------------------
  Future getPlaylist() async {
    try {
      var responce = await http.get(
        Uri.parse(rapidapihome),
        headers: {
          'x-rapidapi-host': rapidapihost,
          'x-rapidapi-key': rapidapikey,
        },
      );
      if (responce.statusCode == 200) {
        log(responce.statusCode.toString());
        try {
          Map<String, dynamic> data = json.decode(responce.body);
          if (data.containsKey('results')) {
            for (var element in data['results']["charts"]["top_music_videos"]
                ["list"]) {
              musicRepo.playlist.add(MusicModel(
                  musicId: element['videoId'],
                  musicTitle: element['title'],
                  musicAuthor: element['subtitle'],
                  musicThumbnail: element['thumbnail']));
            }
            log("==============================");
            log(data['results']["new_release_albums"]);
            log("==============================");
          } else {
            log('Results key not found in response.');
          }
        } catch (e) {
          log('Failed to parse JSON: $e');
        }
      } else {
        log('Failed to load data. Status code: ${responce.statusCode}');
      }
    } catch (a) {
      log('Request failed: $a');
    }
  }
// ---------------------{Get Artists}------------------------

  Future getArtists() async {
    try {
      var responce = await http.get(
        Uri.parse(rapidapihome),
        headers: {
          'x-rapidapi-host': rapidapihost,
          'x-rapidapi-key': rapidapikey,
        },
      );
      if (responce.statusCode == 200) {
        log(responce.statusCode.toString());
        try {
          Map<String, dynamic> data = json.decode(responce.body);
          if (data.containsKey('results')) {
            for (var element in data['results']["charts"]["top_artists"]
                ["list"]) {
              musicRepo.artists.add(MusicModel(
                  musicId: element['channelId'],
                  musicTitle: element['title'],
                  musicAuthor: element['subscriberText'],
                  musicThumbnail: element['thumbnail']));
            }
            log("==============================");
            log(data['results']["new_release_albums"]);
            log("==============================");
          } else {
            log('Results key not found in response.');
          }
        } catch (e) {
          log('Failed to parse JSON: $e');
        }
      } else {
        log('Failed to load data. Status code: ${responce.statusCode}');
      }
    } catch (a) {
      log('Request failed: $a');
    }
  }

  // ------------------{Get today's_biggest_hits}---------------------------------
  Future getTodaysBigestHits() async {
    try {
      var responce = await http.get(
        Uri.parse(rapidapihome),
        headers: {
          'x-rapidapi-host': rapidapihost,
          'x-rapidapi-key': rapidapikey,
        },
      );
      if (responce.statusCode == 200) {
        try {
          Map<String, dynamic> data = json.decode(responce.body);
          if (data.containsKey('results')) {
            for (var element in data['results']["today's_biggest_hits"]) {
              musicRepo.todaysBiggestHits.add(MusicModel(
                  musicId: element['browseId'],
                  musicTitle: element['title'],
                  musicAuthor: element['subtitle'],
                  musicThumbnail: element['thumbnail']));
            }
          } else {
            log('Results key not found in response.');
          }
        } catch (e) {
          log('Failed to parse JSON: $e');
        }
      } else {
        log('Failed to load data. Status code: ${responce.statusCode}');
      }
    } catch (a) {
      log('Request failed: $a');
    }
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:music_app/api/model/music_model.dart';
import 'package:music_app/constants/api_constants.dart';
import 'package:music_app/homepage.dart';

import 'api_header.dart';
import 'package:music_app/lists.dart';
import 'package:http/http.dart' as http;

void main() async {
  ApiManger api = ApiManger();
  await api.gethome();
}

class ApiManger {
  Future getRecommended() async {
    try {
      var responce = await http.get(
        Uri.parse('$rapidApiRecommended'),
        headers: {
          'x-rapidapi-host': '$rapidapihost',
          'x-rapidapi-key': '$rapidapikey',
        },
      );
      if (responce.statusCode == 200) {
        print(responce.statusCode);
        try {
          Map<String, dynamic> data = json.decode(responce.body);
          if (data.containsKey('results')) {
            for (var element in data['results']) {
              musicRepo.home.add(MusicModel(
                  musicId: element['videoId'],
                  musicTitle: element['title'],
                  musicAuthor: element['author'],
                  musicThumbnail: element['thumbnail']));
            }
            print("==============================");
            print(musicRepo.home);
            print("==============================");
          } else {
            print('Results key not found in response.');
          }
        } catch (e) {
          print('Failed to parse JSON: $e');
        }
      } else {
        print('Failed to load data. Status code: ${responce.statusCode}');
      }
    } catch (a) {
      print('Request failed: $a');
    }
  }
//------------------{Get Home}-------------------

  Future gethome() async {
    try {
      var responce = await http.get(
        Uri.parse('$rapidapihome'),
        headers: {
          'x-rapidapi-host': '$rapidapihost',
          'x-rapidapi-key': '$rapidapikey',
        },
      );
      if (responce.statusCode == 200) {
        try {
          Map<List, dynamic> data = json.decode(responce.body);
          print(data);
        } catch (e) {
          print('Failed to parse JSON: $e');
        }
      } else {
        print('Failed to load data. Status code: ${responce.statusCode}');
      }
    } catch (a) {
      print('Request failed: $a');
    }
  }
}




// class Api {
//   late Dio dio;
//   MusicRepo musicRepo = getIt.get<MusicRepo>();
//   MusicModel? musicmodel ;

//   Api() {
//     BaseOptions options = BaseOptions(
//       headers: {
//         'x-rapidapi-host': "$rapidapihost",
//         'x-rapidapi-key': "$rapidapikey",
//       },
//       baseUrl: "$recomendedbaseurl",
//       receiveDataWhenStatusError: true,
//       followRedirects: false,
//     );
//     dio = Dio(options);
//   }

//   Future<void> getrecomended() async {
//     try {
//       Response res = await dio.get('/recommend', queryParameters: {"id": "US"});
//       if (res.statusCode == 200) {
//         try {
//           // print(res.data['results']);
//           Map<String, dynamic> data = json.decode(res.toString());

//           if (data.containsKey('res`ults')) {
//             // musicRepo.recommended = data['results'];
//             for (var element in data['results']) {
//               musicRepo.recommended.add(MusicModel(
//                   musicId: element['videoId'],
//                   musicTitle: element['title'],
//                   musicAuthor: element['author'],
//                   musicThumbnail: element['thumbnail']));
//             }
//             print("==============================");
//             print(musicRepo.recommended);

//             print("==============================");
//           } else {
//             print('Results key not found in response.');
//           }
//         } catch (e) {
//           print('Failed to parse JSON: $e');
//         }
//       } else {
//         print('Failed to load data. Status code: ${res.statusCode}');
//       }
//     } catch (e) {
//       print('Request failed: $e');
//     }
//   }

//   Future<void> getartists() async {
//     try {
//       Response res = await dio.get('/recommend', queryParameters: {"id": "US"});
//       if (res.statusCode == 200) {
//         try {
//           // print(res.data['results']);
//           Map<String, dynamic> data = json.decode(res.toString());

//           if (data.containsKey('results')) {
//             // musicRepo.recommended = data['results'];
//             for (var element in data['results']) {
//               musicRepo.recommended.add(MusicModel(
//                   musicId: element['videoId'],
//                   musicTitle: element['title'],
//                   musicAuthor: element['author'],
//                   musicThumbnail: element['thumbnail']));
//             }
//             print("==============================");
//             print(musicRepo.recommended);

//             print("==============================");
//           } else {
//             print('Results key not found in response.');
//           }
//         } catch (e) {
//           print('Failed to parse JSON: $e');
//         }
//       } else {
//         print('Failed to load data. Status code: ${res.statusCode}');
//       }
//     } catch (e) {
//       print('Request failed: $e');
//     }
//   }
// }



// class ApiManger {
//   late Dio dio;
//   MusicRepo musicRepo = getIt.get<MusicRepo>();
//   ApiManger() {
//     BaseOptions options = BaseOptions(
//       headers: {
//         'x-rapidapi-host': "$rapidapihost",
//         'x-rapidapi-key': "$recommendrapidapikey",
//       },
//       baseUrl: "$recomendedbaseurl",
//       receiveDataWhenStatusError: true,
//       followRedirects: false,
//     );
//     dio = Dio(options);
//   }
//   Future<Map<String, dynamic>> GetEndPoints(String endpoint,
//       {Map<String, dynamic>? queryParameters}) async {
//     Response res = await dio.get(endpoint, queryParameters: queryParameters);
//       print(res.statusCode);
//     if (res.statusCode == 200) {
//       print(res.data.runtimeType);
//       if (res.data.runtimeType == String) {
//         return json.decode(res.data);
//       }
//     }
//     return res.data;
//   }
// }
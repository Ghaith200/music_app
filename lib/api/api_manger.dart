import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:music_app/constants/api_constants.dart';
import 'package:music_app/locator.dart';
import 'api_header.dart';
import 'package:music_app/lists.dart';

void main() async {
  setup();
  ApiManger api = ApiManger();
  await ApiManger().GetEndPoints(ApiConstantsRequest.home, queryParameters: {"id": "US"});
}

class ApiManger {
  late Dio dio;
  MusicRepo musicRepo = getIt.get<MusicRepo>();
  ApiManger() {
    BaseOptions options = BaseOptions(
      headers: {
        'x-rapidapi-host': "$rapidapihost",
        'x-rapidapi-key': "$recommendrapidapikey",
      },
      baseUrl: "$recomendedbaseurl",
      receiveDataWhenStatusError: true,
      followRedirects: false,
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> GetEndPoints(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    Response res = await dio.get(endpoint, queryParameters: queryParameters);
      print(res.statusCode);
    if (res.statusCode == 200) {
      print(res.data.runtimeType);
      if (res.data.runtimeType == String) {
        return json.decode(res.data);
      }
    }
    return res.data;
  }
}
// class Api {
//   late Dio dio;
//   MusicRepo musicRepo = getIt.get<MusicRepo>();

//   Api() {
//     BaseOptions options = BaseOptions(
//       headers: {
//         'x-rapidapi-host': "$recommendrapidapihost",
//         'x-rapidapi-key': "$recommendrapidapikey",
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

//               musicRepo.recommended.add(MusicModel(musicId: element['videoId'], musicTitle: element['title'], musicAuthor: element['author'], musicThumbnail: element['thumbnail']));
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

//               musicRepo.recommended.add(MusicModel(musicId: element['videoId'], musicTitle: element['title'], musicAuthor: element['author'], musicThumbnail: element['thumbnail']));
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



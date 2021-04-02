import 'dart:convert';
import 'package:FlutterRestAPI/apiurl/apiurl.dart';
import 'package:FlutterRestAPI/model/matches.dart';
import 'package:http/http.dart' as http;

class MatchService {
  // getMatches() async {
  //   try {
  //     var key = "c4497e0d102ffa57f370d5894fe96e87";
  //     final response = await http.get(
  //         Uri.parse('http://cricapi.com/api/matches?apikey=${key.toString()}'));
  //     if (response.statusCode == 200) {
  //       return MatchList.fromJson(jsonDecode(response.body));
  //     }
  //   } catch (e) {
  //     return 'error';
  //   }
  // }
  // ignore: camel_case_types

  Future<MatchModel> fetchMatch() async {
    var client = http.Client();
    var matchModel;
    try {
      var response = await client.get(Uri.parse(ApiUrl.matchapi.toString()));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(jsonMap);
        matchModel = MatchModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return matchModel;
    }

    return matchModel;
  }
}

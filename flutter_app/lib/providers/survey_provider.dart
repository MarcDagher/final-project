import 'package:bound_harmony/configurations/request.configuration.dart';
import 'package:bound_harmony/models/questions_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurveysProvider extends ChangeNotifier {
  List<Question?> questions = [];

  getSurvey(int survey_id) async {
    final baseUrl = Requests.baseUrl;
    final dio = Dio();

    try {
      final preferences = await SharedPreferences.getInstance();
      final token = preferences.get('token');
      final response = await dio.get("$baseUrl/get_survey",
          data: {"survey_id": survey_id},
          options: Options(headers: {"authorization": "Bearer $token"}));

      // print("In getSurvey survey: ${response.data["survey"][0]["question"]}");
      // print("In getSurvey survey");
      for (int i = 0; i < response.data["survey"].length; i++) {
        List listOfOptions = [];
        // print(
        //     "Question $i: ${response.data["survey"][i]["question"]["question"]}");

        for (int j = 0; j < response.data["survey"][i]["options"].length; j++) {
          listOfOptions.add(response.data["survey"][i]["options"][j]["option"]);
          // print(
          //     "Option $j: ${response.data["survey"][i]["options"][j]["option"]}");
        }
        questions.add(Question(
            id: response.data["survey"][i]["question"]["question_id"],
            options: listOfOptions,
            question: response.data["survey"][i]["question"]["question"]));
      }
      print("Questions: $questions");
    } on DioException catch (error) {
      print("In getSurvey error: $error");
    }
  }
}

import 'dart:convert';
import 'package:covid_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:covid_tracker/Model/world_states_model.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    try {
      // Await the HTTP request to ensure it completes before proceeding
      final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

      // Check the response status code
      if (response.statusCode == 200) {
        // Parse the JSON response
        var data = jsonDecode(response.body);

        // Return a WorldStatesModel from the parsed JSON data
        return WorldStatesModel.fromJson(data);
      } else {
        // Handle non-200 status codes by throwing an exception
        throw Exception('Failed to load world states');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      throw Exception('Error fetching data: $e');
    }
  }
  Future<List<dynamic>> countriesListApi() async {
    var data;
    try {
      // Await the HTTP request to ensure it completes before proceeding
      final response = await http.get(Uri.parse(AppUrl.countriesList));

      // Check the response status code
      if (response.statusCode == 200) {
        // Parse the JSON response
        data = jsonDecode(response.body);

        // Return a WorldStatesModel from the parsed JSON data
        return data;
      } else {
        // Handle non-200 status codes by throwing an exception
        throw Exception('Failed to load world states');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      throw Exception('Error fetching data: $e');
    }
  }
}

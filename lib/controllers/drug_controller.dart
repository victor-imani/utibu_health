import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:utibu_health/models/drug_model.dart'; // Import your Drug model
import 'package:utibu_health/utils/strings.dart'; 

class DrugController extends ChangeNotifier {
 var drugs = RxList<Drug>();

  // API endpoint for fetching drugs
  
  Future<void> fetchDrugs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/drugs'));

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        drugs.clear(); // Clear existing drugs before adding new ones

        // Convert the response data to Drug objects and add to the list
        responseData.forEach((item) {
          drugs.add(Drug.fromJson(item));
        });

        notifyListeners(); // Notify listeners that data has been updated
      } else {
        throw Exception('Failed to load drugs');
      }
    } catch (e) {
      print('Error fetching drugs: $e');
    }
  }
  
}

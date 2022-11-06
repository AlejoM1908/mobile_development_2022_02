import 'dart:convert';

import 'package:api_consumption/models/hotel.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String _url = 'https://www.datos.gov.co/resource/w735-yw39.json';

  Future<List<Hotel>> getHotels() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List<dynamic> hotels = jsonDecode(response.body);
      return hotels.map((hotel) => Hotel.fromJson(hotel)).toList();
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:food_app/src/data/models/api_model.dart';

class FoodService {
  static Future<List<FoodModel>> getData() async {
      Response res = await Dio().get('http://10.0.2.2:3000/users/');
      return res.data;
    }
  }
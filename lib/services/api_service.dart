import 'package:dio/dio.dart';

class APIService {
  final dio = Dio();
  void toggle(String state) async {
    final response = await dio.put('https://kindoftesting.site/light?state=$state');
  }
}
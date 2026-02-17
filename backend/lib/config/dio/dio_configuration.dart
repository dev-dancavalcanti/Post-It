import 'package:dio/dio.dart';
import 'package:vaden/vaden.dart';

@Configuration()
class DioConfiguration {
  @Bean()
  Dio dioApoiaseConfig(ApplicationSettings settings) {
    return Dio(BaseOptions(baseUrl: 'http://localhost:8080', headers: {}));
  }
}

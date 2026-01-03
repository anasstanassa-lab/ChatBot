import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/chatbot_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000')
abstract class ApiService {
  factory ApiService(
      Dio dio, {
        String? baseUrl,
      }) = _ApiService;

  @POST('/rag-chat')
  Future<ChatbotResponse> askQuestion(@Body() Map<String, dynamic> body);
}
import 'package:json_annotation/json_annotation.dart';
part 'chatbot_response.g.dart';
@JsonSerializable()
class ChatbotResponse {
  final String answer;
  ChatbotResponse({required this.answer});
  factory ChatbotResponse.fromJson(Map<String, dynamic> json) =>_$ChatbotResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatbotResponseToJson(this);
}
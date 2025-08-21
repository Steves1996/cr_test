import 'package:json_annotation/json_annotation.dart';

part 'rates.model.g.dart';

@JsonSerializable()
class RatesResponse {
  final bool status;
  final String message;
  final String fiatTime;
  final String cryptoTime;
  final Map<String, double> data;

  RatesResponse({
    required this.status,
    required this.message,
    required this.fiatTime,
    required this.cryptoTime,
    required this.data,
  });

  factory RatesResponse.fromJson(Map<String, dynamic> json) =>
      _$RatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatesResponseToJson(this);
}

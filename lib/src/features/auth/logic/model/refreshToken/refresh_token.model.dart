import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.model.g.dart';

@JsonSerializable(explicitToJson: true)
class RefreshResponse {
  final RefreshData data;

  RefreshResponse({required this.data});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefreshData {
  final String token;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'refresh_token_expires_in')
  final int refreshTokenExpiresIn;
  @JsonKey(name: 'token_type')
  final String tokenType;

  RefreshData({
    required this.token,
    required this.expiresIn,
    required this.refreshTokenExpiresIn,
    required this.tokenType,
  });

  factory RefreshData.fromJson(Map<String, dynamic> json) =>
      _$RefreshDataFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshDataToJson(this);
}

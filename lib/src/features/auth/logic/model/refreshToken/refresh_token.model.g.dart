// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) =>
    RefreshResponse(
      data: RefreshData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefreshResponseToJson(RefreshResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

RefreshData _$RefreshDataFromJson(Map<String, dynamic> json) => RefreshData(
      token: json['token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      refreshTokenExpiresIn: (json['refresh_token_expires_in'] as num).toInt(),
      tokenType: json['token_type'] as String,
    );

Map<String, dynamic> _$RefreshDataToJson(RefreshData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires_in': instance.expiresIn,
      'refresh_token_expires_in': instance.refreshTokenExpiresIn,
      'token_type': instance.tokenType,
    };

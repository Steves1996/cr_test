// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatesResponse _$RatesResponseFromJson(Map<String, dynamic> json) =>
    RatesResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      fiatTime: json['fiatTime'] as String,
      cryptoTime: json['cryptoTime'] as String,
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$RatesResponseToJson(RatesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'fiatTime': instance.fiatTime,
      'cryptoTime': instance.cryptoTime,
      'data': instance.data,
    };

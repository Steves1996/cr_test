// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      log: json['log'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'log': instance.log,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      responseCode: json['responsecode'] as String,
      message: json['message'] as String,
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      refreshTokenExpiresIn: (json['refresh_token_expires_in'] as num).toInt(),
      tokenType: json['token_type'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'responsecode': instance.responseCode,
      'message': instance.message,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'refresh_token_expires_in': instance.refreshTokenExpiresIn,
      'token_type': instance.tokenType,
      'data': instance.data.toJson(),
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      userId: (json['userId'] as num).toInt(),
      username: json['username'] as String,
      phoneNumber: json['phone_number'] as String,
      phoneId: json['phone_id'] as String,
      referalCode: json['referal_code'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      gender: json['gender'] as String,
      emailAddress: json['email_address'] as String,
      dateOfBirth: json['date_of_birth'] as String?,
      preferredLanguage: json['preferred_language'] as String,
      accountStatus: json['account_status'] as String,
      accountIsVerified: json['account_is_verified'] as bool,
      emailVerified: json['email_verified'] as bool,
      phoneVerified: json['phone_verified'] as bool,
      kycLevelNumber: (json['kyc_level_number'] as num).toInt(),
      kycLevelName: json['kyc_level_name'] as String,
      loyaltyLevel: (json['loyaltyLevel'] as num?)?.toInt(),
      countryCode: json['country_code'] as String,
      countryNameEn: json['country_name_en'] as String,
      countryNameFr: json['country_name_fr'] as String,
      shortCountryCode: json['short_country_code'] as String,
      countryId: (json['country_id'] as num).toInt(),
      customerType: json['customer_type'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: json['permissions'] as List<dynamic>,
      wallets: json['wallets'] as List<dynamic>,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'phone_number': instance.phoneNumber,
      'phone_id': instance.phoneId,
      'referal_code': instance.referalCode,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'email_address': instance.emailAddress,
      'date_of_birth': instance.dateOfBirth,
      'preferred_language': instance.preferredLanguage,
      'account_status': instance.accountStatus,
      'account_is_verified': instance.accountIsVerified,
      'email_verified': instance.emailVerified,
      'phone_verified': instance.phoneVerified,
      'kyc_level_number': instance.kycLevelNumber,
      'kyc_level_name': instance.kycLevelName,
      'loyaltyLevel': instance.loyaltyLevel,
      'country_code': instance.countryCode,
      'country_name_en': instance.countryNameEn,
      'country_name_fr': instance.countryNameFr,
      'short_country_code': instance.shortCountryCode,
      'country_id': instance.countryId,
      'customer_type': instance.customerType,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
      'permissions': instance.permissions,
      'wallets': instance.wallets,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

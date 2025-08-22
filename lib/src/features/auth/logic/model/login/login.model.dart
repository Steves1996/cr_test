import 'package:json_annotation/json_annotation.dart';

part 'login.model.g.dart';


@JsonSerializable()
class LoginRequest {
  final String log;
  final String password;

  LoginRequest({
    required this.log,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}





@JsonSerializable(explicitToJson: true)
class LoginResponse {
  @JsonKey(name: 'responsecode')
  final String responseCode;
  final String message;
  final String token;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'refresh_token_expires_in')
  final int refreshTokenExpiresIn;
  @JsonKey(name: 'token_type')
  final String tokenType;
  final LoginData data;

  LoginResponse({
    required this.responseCode,
    required this.message,
    required this.token,
    required this.refreshToken,
    required this.expiresIn,
    required this.refreshTokenExpiresIn,
    required this.tokenType,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginData {
  final int userId;
  final String username;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @JsonKey(name: 'phone_id')
  final String phoneId;
  @JsonKey(name: 'referal_code')
  final String referalCode;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String gender;
  @JsonKey(name: 'email_address')
  final String emailAddress;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @JsonKey(name: 'fiat_currency_code')
  final String? fiatCurrencyCode;
  @JsonKey(name: 'fiat_currency_id')
  final int? fiatCurrencyId;
  @JsonKey(name: 'preferred_language')
  final String preferredLanguage;
  @JsonKey(name: 'account_status')
  final String accountStatus;
  @JsonKey(name: 'account_is_verified')
  final bool accountIsVerified;
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @JsonKey(name: 'phone_verified')
  final bool phoneVerified;
  @JsonKey(name: 'kyc_level_number')
  final int kycLevelNumber;
  @JsonKey(name: 'kyc_level_name')
  final String kycLevelName;
  @JsonKey(name: 'loyaltyLevel')
  final int? loyaltyLevel;
  @JsonKey(name: 'country_code')
  final String countryCode;
  @JsonKey(name: 'country_name_en')
  final String countryNameEn;
  @JsonKey(name: 'country_name_fr')
  final String countryNameFr;
  @JsonKey(name: 'short_country_code')
  final String shortCountryCode;
  @JsonKey(name: 'date_creation')
  final int? dateCreation;
  @JsonKey(name: 'date_update')
  final int? dateUpdate;
  @JsonKey(name: 'country_id')
  final int countryId;
  @JsonKey(name: 'customer_type')
  final String customerType;
  final List<Role> roles;
  final List<dynamic> permissions;
  final List<dynamic> wallets;


  LoginData( { required this.userId,
    required this.username,
    required this.phoneNumber,
    required this.phoneId,
    required this.referalCode,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.emailAddress,
    this.dateOfBirth,
    required this.preferredLanguage,
    required this.accountStatus,
    required this.accountIsVerified,
    required this.emailVerified,
    required this.phoneVerified,
    required this.kycLevelNumber,
    required this.kycLevelName,
    this.loyaltyLevel,
    this.dateCreation,
    this.dateUpdate,
    this.fiatCurrencyCode,
    this.fiatCurrencyId,
    required this.countryCode,
    required this.countryNameEn,
    required this.countryNameFr,
    required this.shortCountryCode,
    required this.countryId,
    required this.customerType,
    required this.roles,
    required this.permissions,
    required this.wallets,}
  );

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class Role {
  final int id;
  final String name;
  final String description;

  Role({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashInitial value) initial,
    required TResult Function(_SplashLoading value) loading,
    required TResult Function(_SplashSucess value) success,
    required TResult Function(_SplashFailed value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashInitial value)? initial,
    TResult? Function(_SplashLoading value)? loading,
    TResult? Function(_SplashSucess value)? success,
    TResult? Function(_SplashFailed value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashInitial value)? initial,
    TResult Function(_SplashLoading value)? loading,
    TResult Function(_SplashSucess value)? success,
    TResult Function(_SplashFailed value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SplashInitialImplCopyWith<$Res> {
  factory _$$SplashInitialImplCopyWith(
          _$SplashInitialImpl value, $Res Function(_$SplashInitialImpl) then) =
      __$$SplashInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashInitialImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashInitialImpl>
    implements _$$SplashInitialImplCopyWith<$Res> {
  __$$SplashInitialImplCopyWithImpl(
      _$SplashInitialImpl _value, $Res Function(_$SplashInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SplashInitialImpl implements _SplashInitial {
  _$SplashInitialImpl();

  @override
  String toString() {
    return 'SplashState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashInitial value) initial,
    required TResult Function(_SplashLoading value) loading,
    required TResult Function(_SplashSucess value) success,
    required TResult Function(_SplashFailed value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashInitial value)? initial,
    TResult? Function(_SplashLoading value)? loading,
    TResult? Function(_SplashSucess value)? success,
    TResult? Function(_SplashFailed value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashInitial value)? initial,
    TResult Function(_SplashLoading value)? loading,
    TResult Function(_SplashSucess value)? success,
    TResult Function(_SplashFailed value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SplashInitial implements SplashState {
  factory _SplashInitial() = _$SplashInitialImpl;
}

/// @nodoc
abstract class _$$SplashLoadingImplCopyWith<$Res> {
  factory _$$SplashLoadingImplCopyWith(
          _$SplashLoadingImpl value, $Res Function(_$SplashLoadingImpl) then) =
      __$$SplashLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashLoadingImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashLoadingImpl>
    implements _$$SplashLoadingImplCopyWith<$Res> {
  __$$SplashLoadingImplCopyWithImpl(
      _$SplashLoadingImpl _value, $Res Function(_$SplashLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SplashLoadingImpl implements _SplashLoading {
  _$SplashLoadingImpl();

  @override
  String toString() {
    return 'SplashState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashInitial value) initial,
    required TResult Function(_SplashLoading value) loading,
    required TResult Function(_SplashSucess value) success,
    required TResult Function(_SplashFailed value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashInitial value)? initial,
    TResult? Function(_SplashLoading value)? loading,
    TResult? Function(_SplashSucess value)? success,
    TResult? Function(_SplashFailed value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashInitial value)? initial,
    TResult Function(_SplashLoading value)? loading,
    TResult Function(_SplashSucess value)? success,
    TResult Function(_SplashFailed value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SplashLoading implements SplashState {
  factory _SplashLoading() = _$SplashLoadingImpl;
}

/// @nodoc
abstract class _$$SplashSucessImplCopyWith<$Res> {
  factory _$$SplashSucessImplCopyWith(
          _$SplashSucessImpl value, $Res Function(_$SplashSucessImpl) then) =
      __$$SplashSucessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic response});
}

/// @nodoc
class __$$SplashSucessImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashSucessImpl>
    implements _$$SplashSucessImplCopyWith<$Res> {
  __$$SplashSucessImplCopyWithImpl(
      _$SplashSucessImpl _value, $Res Function(_$SplashSucessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$SplashSucessImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$SplashSucessImpl implements _SplashSucess {
  _$SplashSucessImpl({required this.response});

  @override
  final dynamic response;

  @override
  String toString() {
    return 'SplashState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashSucessImpl &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashSucessImplCopyWith<_$SplashSucessImpl> get copyWith =>
      __$$SplashSucessImplCopyWithImpl<_$SplashSucessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashInitial value) initial,
    required TResult Function(_SplashLoading value) loading,
    required TResult Function(_SplashSucess value) success,
    required TResult Function(_SplashFailed value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashInitial value)? initial,
    TResult? Function(_SplashLoading value)? loading,
    TResult? Function(_SplashSucess value)? success,
    TResult? Function(_SplashFailed value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashInitial value)? initial,
    TResult Function(_SplashLoading value)? loading,
    TResult Function(_SplashSucess value)? success,
    TResult Function(_SplashFailed value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SplashSucess implements SplashState {
  factory _SplashSucess({required final dynamic response}) = _$SplashSucessImpl;

  dynamic get response;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashSucessImplCopyWith<_$SplashSucessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SplashFailedImplCopyWith<$Res> {
  factory _$$SplashFailedImplCopyWith(
          _$SplashFailedImpl value, $Res Function(_$SplashFailedImpl) then) =
      __$$SplashFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$SplashFailedImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashFailedImpl>
    implements _$$SplashFailedImplCopyWith<$Res> {
  __$$SplashFailedImplCopyWithImpl(
      _$SplashFailedImpl _value, $Res Function(_$SplashFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SplashFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SplashFailedImpl implements _SplashFailed {
  _$SplashFailedImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SplashState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashFailedImplCopyWith<_$SplashFailedImpl> get copyWith =>
      __$$SplashFailedImplCopyWithImpl<_$SplashFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic response) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(dynamic response)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic response)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SplashInitial value) initial,
    required TResult Function(_SplashLoading value) loading,
    required TResult Function(_SplashSucess value) success,
    required TResult Function(_SplashFailed value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SplashInitial value)? initial,
    TResult? Function(_SplashLoading value)? loading,
    TResult? Function(_SplashSucess value)? success,
    TResult? Function(_SplashFailed value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SplashInitial value)? initial,
    TResult Function(_SplashLoading value)? loading,
    TResult Function(_SplashSucess value)? success,
    TResult Function(_SplashFailed value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _SplashFailed implements SplashState {
  factory _SplashFailed({required final String error}) = _$SplashFailedImpl;

  String get error;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashFailedImplCopyWith<_$SplashFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

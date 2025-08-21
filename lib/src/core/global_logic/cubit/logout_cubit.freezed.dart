// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LogoutState {
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
    required TResult Function(_LogoutInitial value) initial,
    required TResult Function(_LogoutLoading value) loading,
    required TResult Function(_LogoutSucess value) success,
    required TResult Function(_LogoutFailed value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutInitial value)? initial,
    TResult? Function(_LogoutLoading value)? loading,
    TResult? Function(_LogoutSucess value)? success,
    TResult? Function(_LogoutFailed value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutInitial value)? initial,
    TResult Function(_LogoutLoading value)? loading,
    TResult Function(_LogoutSucess value)? success,
    TResult Function(_LogoutFailed value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutStateCopyWith<$Res> {
  factory $LogoutStateCopyWith(
          LogoutState value, $Res Function(LogoutState) then) =
      _$LogoutStateCopyWithImpl<$Res, LogoutState>;
}

/// @nodoc
class _$LogoutStateCopyWithImpl<$Res, $Val extends LogoutState>
    implements $LogoutStateCopyWith<$Res> {
  _$LogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LogoutInitialImplCopyWith<$Res> {
  factory _$$LogoutInitialImplCopyWith(
          _$LogoutInitialImpl value, $Res Function(_$LogoutInitialImpl) then) =
      __$$LogoutInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutInitialImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutInitialImpl>
    implements _$$LogoutInitialImplCopyWith<$Res> {
  __$$LogoutInitialImplCopyWithImpl(
      _$LogoutInitialImpl _value, $Res Function(_$LogoutInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutInitialImpl implements _LogoutInitial {
  _$LogoutInitialImpl();

  @override
  String toString() {
    return 'LogoutState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutInitialImpl);
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
    required TResult Function(_LogoutInitial value) initial,
    required TResult Function(_LogoutLoading value) loading,
    required TResult Function(_LogoutSucess value) success,
    required TResult Function(_LogoutFailed value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutInitial value)? initial,
    TResult? Function(_LogoutLoading value)? loading,
    TResult? Function(_LogoutSucess value)? success,
    TResult? Function(_LogoutFailed value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutInitial value)? initial,
    TResult Function(_LogoutLoading value)? loading,
    TResult Function(_LogoutSucess value)? success,
    TResult Function(_LogoutFailed value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _LogoutInitial implements LogoutState {
  factory _LogoutInitial() = _$LogoutInitialImpl;
}

/// @nodoc
abstract class _$$LogoutLoadingImplCopyWith<$Res> {
  factory _$$LogoutLoadingImplCopyWith(
          _$LogoutLoadingImpl value, $Res Function(_$LogoutLoadingImpl) then) =
      __$$LogoutLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutLoadingImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutLoadingImpl>
    implements _$$LogoutLoadingImplCopyWith<$Res> {
  __$$LogoutLoadingImplCopyWithImpl(
      _$LogoutLoadingImpl _value, $Res Function(_$LogoutLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutLoadingImpl implements _LogoutLoading {
  _$LogoutLoadingImpl();

  @override
  String toString() {
    return 'LogoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutLoadingImpl);
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
    required TResult Function(_LogoutInitial value) initial,
    required TResult Function(_LogoutLoading value) loading,
    required TResult Function(_LogoutSucess value) success,
    required TResult Function(_LogoutFailed value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutInitial value)? initial,
    TResult? Function(_LogoutLoading value)? loading,
    TResult? Function(_LogoutSucess value)? success,
    TResult? Function(_LogoutFailed value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutInitial value)? initial,
    TResult Function(_LogoutLoading value)? loading,
    TResult Function(_LogoutSucess value)? success,
    TResult Function(_LogoutFailed value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LogoutLoading implements LogoutState {
  factory _LogoutLoading() = _$LogoutLoadingImpl;
}

/// @nodoc
abstract class _$$LogoutSucessImplCopyWith<$Res> {
  factory _$$LogoutSucessImplCopyWith(
          _$LogoutSucessImpl value, $Res Function(_$LogoutSucessImpl) then) =
      __$$LogoutSucessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic response});
}

/// @nodoc
class __$$LogoutSucessImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutSucessImpl>
    implements _$$LogoutSucessImplCopyWith<$Res> {
  __$$LogoutSucessImplCopyWithImpl(
      _$LogoutSucessImpl _value, $Res Function(_$LogoutSucessImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$LogoutSucessImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$LogoutSucessImpl implements _LogoutSucess {
  _$LogoutSucessImpl({required this.response});

  @override
  final dynamic response;

  @override
  String toString() {
    return 'LogoutState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutSucessImpl &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutSucessImplCopyWith<_$LogoutSucessImpl> get copyWith =>
      __$$LogoutSucessImplCopyWithImpl<_$LogoutSucessImpl>(this, _$identity);

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
    required TResult Function(_LogoutInitial value) initial,
    required TResult Function(_LogoutLoading value) loading,
    required TResult Function(_LogoutSucess value) success,
    required TResult Function(_LogoutFailed value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutInitial value)? initial,
    TResult? Function(_LogoutLoading value)? loading,
    TResult? Function(_LogoutSucess value)? success,
    TResult? Function(_LogoutFailed value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutInitial value)? initial,
    TResult Function(_LogoutLoading value)? loading,
    TResult Function(_LogoutSucess value)? success,
    TResult Function(_LogoutFailed value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _LogoutSucess implements LogoutState {
  factory _LogoutSucess({required final dynamic response}) = _$LogoutSucessImpl;

  dynamic get response;

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogoutSucessImplCopyWith<_$LogoutSucessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutFailedImplCopyWith<$Res> {
  factory _$$LogoutFailedImplCopyWith(
          _$LogoutFailedImpl value, $Res Function(_$LogoutFailedImpl) then) =
      __$$LogoutFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$LogoutFailedImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutFailedImpl>
    implements _$$LogoutFailedImplCopyWith<$Res> {
  __$$LogoutFailedImplCopyWithImpl(
      _$LogoutFailedImpl _value, $Res Function(_$LogoutFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LogoutFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogoutFailedImpl implements _LogoutFailed {
  _$LogoutFailedImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'LogoutState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutFailedImplCopyWith<_$LogoutFailedImpl> get copyWith =>
      __$$LogoutFailedImplCopyWithImpl<_$LogoutFailedImpl>(this, _$identity);

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
    required TResult Function(_LogoutInitial value) initial,
    required TResult Function(_LogoutLoading value) loading,
    required TResult Function(_LogoutSucess value) success,
    required TResult Function(_LogoutFailed value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LogoutInitial value)? initial,
    TResult? Function(_LogoutLoading value)? loading,
    TResult? Function(_LogoutSucess value)? success,
    TResult? Function(_LogoutFailed value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogoutInitial value)? initial,
    TResult Function(_LogoutLoading value)? loading,
    TResult Function(_LogoutSucess value)? success,
    TResult Function(_LogoutFailed value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _LogoutFailed implements LogoutState {
  factory _LogoutFailed({required final String error}) = _$LogoutFailedImpl;

  String get error;

  /// Create a copy of LogoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogoutFailedImplCopyWith<_$LogoutFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

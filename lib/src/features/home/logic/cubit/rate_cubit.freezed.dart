// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RatesResponse response) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RatesResponse response)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RatesResponse response)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RateInitial value) initial,
    required TResult Function(_RateLoading value) loading,
    required TResult Function(_RateSucess value) success,
    required TResult Function(_RateFailed value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RateInitial value)? initial,
    TResult? Function(_RateLoading value)? loading,
    TResult? Function(_RateSucess value)? success,
    TResult? Function(_RateFailed value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RateInitial value)? initial,
    TResult Function(_RateLoading value)? loading,
    TResult Function(_RateSucess value)? success,
    TResult Function(_RateFailed value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateStateCopyWith<$Res> {
  factory $RateStateCopyWith(RateState value, $Res Function(RateState) then) =
      _$RateStateCopyWithImpl<$Res, RateState>;
}

/// @nodoc
class _$RateStateCopyWithImpl<$Res, $Val extends RateState>
    implements $RateStateCopyWith<$Res> {
  _$RateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RateInitialImplCopyWith<$Res> {
  factory _$$RateInitialImplCopyWith(
          _$RateInitialImpl value, $Res Function(_$RateInitialImpl) then) =
      __$$RateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RateInitialImplCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateInitialImpl>
    implements _$$RateInitialImplCopyWith<$Res> {
  __$$RateInitialImplCopyWithImpl(
      _$RateInitialImpl _value, $Res Function(_$RateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RateInitialImpl implements _RateInitial {
  _$RateInitialImpl();

  @override
  String toString() {
    return 'RateState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RatesResponse response) success,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RatesResponse response)? success,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RatesResponse response)? success,
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
    required TResult Function(_RateInitial value) initial,
    required TResult Function(_RateLoading value) loading,
    required TResult Function(_RateSucess value) success,
    required TResult Function(_RateFailed value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RateInitial value)? initial,
    TResult? Function(_RateLoading value)? loading,
    TResult? Function(_RateSucess value)? success,
    TResult? Function(_RateFailed value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RateInitial value)? initial,
    TResult Function(_RateLoading value)? loading,
    TResult Function(_RateSucess value)? success,
    TResult Function(_RateFailed value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _RateInitial implements RateState {
  factory _RateInitial() = _$RateInitialImpl;
}

/// @nodoc
abstract class _$$RateLoadingImplCopyWith<$Res> {
  factory _$$RateLoadingImplCopyWith(
          _$RateLoadingImpl value, $Res Function(_$RateLoadingImpl) then) =
      __$$RateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RateLoadingImplCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateLoadingImpl>
    implements _$$RateLoadingImplCopyWith<$Res> {
  __$$RateLoadingImplCopyWithImpl(
      _$RateLoadingImpl _value, $Res Function(_$RateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RateLoadingImpl implements _RateLoading {
  _$RateLoadingImpl();

  @override
  String toString() {
    return 'RateState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RatesResponse response) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RatesResponse response)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RatesResponse response)? success,
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
    required TResult Function(_RateInitial value) initial,
    required TResult Function(_RateLoading value) loading,
    required TResult Function(_RateSucess value) success,
    required TResult Function(_RateFailed value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RateInitial value)? initial,
    TResult? Function(_RateLoading value)? loading,
    TResult? Function(_RateSucess value)? success,
    TResult? Function(_RateFailed value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RateInitial value)? initial,
    TResult Function(_RateLoading value)? loading,
    TResult Function(_RateSucess value)? success,
    TResult Function(_RateFailed value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _RateLoading implements RateState {
  factory _RateLoading() = _$RateLoadingImpl;
}

/// @nodoc
abstract class _$$RateSucessImplCopyWith<$Res> {
  factory _$$RateSucessImplCopyWith(
          _$RateSucessImpl value, $Res Function(_$RateSucessImpl) then) =
      __$$RateSucessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RatesResponse response});
}

/// @nodoc
class __$$RateSucessImplCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateSucessImpl>
    implements _$$RateSucessImplCopyWith<$Res> {
  __$$RateSucessImplCopyWithImpl(
      _$RateSucessImpl _value, $Res Function(_$RateSucessImpl) _then)
      : super(_value, _then);

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$RateSucessImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as RatesResponse,
    ));
  }
}

/// @nodoc

class _$RateSucessImpl implements _RateSucess {
  _$RateSucessImpl({required this.response});

  @override
  final RatesResponse response;

  @override
  String toString() {
    return 'RateState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateSucessImpl &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateSucessImplCopyWith<_$RateSucessImpl> get copyWith =>
      __$$RateSucessImplCopyWithImpl<_$RateSucessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RatesResponse response) success,
    required TResult Function(String error) failure,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RatesResponse response)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RatesResponse response)? success,
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
    required TResult Function(_RateInitial value) initial,
    required TResult Function(_RateLoading value) loading,
    required TResult Function(_RateSucess value) success,
    required TResult Function(_RateFailed value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RateInitial value)? initial,
    TResult? Function(_RateLoading value)? loading,
    TResult? Function(_RateSucess value)? success,
    TResult? Function(_RateFailed value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RateInitial value)? initial,
    TResult Function(_RateLoading value)? loading,
    TResult Function(_RateSucess value)? success,
    TResult Function(_RateFailed value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _RateSucess implements RateState {
  factory _RateSucess({required final RatesResponse response}) =
      _$RateSucessImpl;

  RatesResponse get response;

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateSucessImplCopyWith<_$RateSucessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RateFailedImplCopyWith<$Res> {
  factory _$$RateFailedImplCopyWith(
          _$RateFailedImpl value, $Res Function(_$RateFailedImpl) then) =
      __$$RateFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RateFailedImplCopyWithImpl<$Res>
    extends _$RateStateCopyWithImpl<$Res, _$RateFailedImpl>
    implements _$$RateFailedImplCopyWith<$Res> {
  __$$RateFailedImplCopyWithImpl(
      _$RateFailedImpl _value, $Res Function(_$RateFailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RateFailedImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RateFailedImpl implements _RateFailed {
  _$RateFailedImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'RateState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateFailedImplCopyWith<_$RateFailedImpl> get copyWith =>
      __$$RateFailedImplCopyWithImpl<_$RateFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RatesResponse response) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RatesResponse response)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RatesResponse response)? success,
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
    required TResult Function(_RateInitial value) initial,
    required TResult Function(_RateLoading value) loading,
    required TResult Function(_RateSucess value) success,
    required TResult Function(_RateFailed value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RateInitial value)? initial,
    TResult? Function(_RateLoading value)? loading,
    TResult? Function(_RateSucess value)? success,
    TResult? Function(_RateFailed value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RateInitial value)? initial,
    TResult Function(_RateLoading value)? loading,
    TResult Function(_RateSucess value)? success,
    TResult Function(_RateFailed value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _RateFailed implements RateState {
  factory _RateFailed({required final String error}) = _$RateFailedImpl;

  String get error;

  /// Create a copy of RateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateFailedImplCopyWith<_$RateFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

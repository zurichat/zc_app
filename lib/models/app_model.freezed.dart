// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddPeopleToChannel _$AddPeopleToChannelFromJson(Map<String, dynamic> json) {
  return _AddPeopleToChannel.fromJson(json);
}

/// @nodoc
class _$AddPeopleToChannelTearOff {
  const _$AddPeopleToChannelTearOff();

  _AddPeopleToChannel call(
      {required String? id,
      required String? roleId,
      required String? isAdmin}) {
    return _AddPeopleToChannel(
      id: id,
      roleId: roleId,
      isAdmin: isAdmin,
    );
  }

  AddPeopleToChannel fromJson(Map<String, Object> json) {
    return AddPeopleToChannel.fromJson(json);
  }
}

/// @nodoc
const $AddPeopleToChannel = _$AddPeopleToChannelTearOff();

/// @nodoc
mixin _$AddPeopleToChannel {
  String? get id => throw _privateConstructorUsedError;
  String? get roleId => throw _privateConstructorUsedError;
  String? get isAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddPeopleToChannelCopyWith<AddPeopleToChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPeopleToChannelCopyWith<$Res> {
  factory $AddPeopleToChannelCopyWith(
          AddPeopleToChannel value, $Res Function(AddPeopleToChannel) then) =
      _$AddPeopleToChannelCopyWithImpl<$Res>;
  $Res call({String? id, String? roleId, String? isAdmin});
}

/// @nodoc
class _$AddPeopleToChannelCopyWithImpl<$Res>
    implements $AddPeopleToChannelCopyWith<$Res> {
  _$AddPeopleToChannelCopyWithImpl(this._value, this._then);

  final AddPeopleToChannel _value;

  final $Res Function(AddPeopleToChannel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? roleId = freezed,
    Object? isAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String?,
      roleId: roleId == freezed ? _value.roleId : roleId as String?,
      isAdmin: isAdmin == freezed ? _value.isAdmin : isAdmin as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddPeopleToChannelCopyWith<$Res>
    implements $AddPeopleToChannelCopyWith<$Res> {
  factory _$AddPeopleToChannelCopyWith(
          _AddPeopleToChannel value, $Res Function(_AddPeopleToChannel) then) =
      __$AddPeopleToChannelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? roleId, String? isAdmin});
}

/// @nodoc
class __$AddPeopleToChannelCopyWithImpl<$Res>
    extends _$AddPeopleToChannelCopyWithImpl<$Res>
    implements _$AddPeopleToChannelCopyWith<$Res> {
  __$AddPeopleToChannelCopyWithImpl(
      _AddPeopleToChannel _value, $Res Function(_AddPeopleToChannel) _then)
      : super(_value, (v) => _then(v as _AddPeopleToChannel));

  @override
  _AddPeopleToChannel get _value => super._value as _AddPeopleToChannel;

  @override
  $Res call({
    Object? id = freezed,
    Object? roleId = freezed,
    Object? isAdmin = freezed,
  }) {
    return _then(_AddPeopleToChannel(
      id: id == freezed ? _value.id : id as String?,
      roleId: roleId == freezed ? _value.roleId : roleId as String?,
      isAdmin: isAdmin == freezed ? _value.isAdmin : isAdmin as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddPeopleToChannel implements _AddPeopleToChannel {
  _$_AddPeopleToChannel(
      {required this.id, required this.roleId, required this.isAdmin});

  factory _$_AddPeopleToChannel.fromJson(Map<String, dynamic> json) =>
      _$_$_AddPeopleToChannelFromJson(json);

  @override
  final String? id;
  @override
  final String? roleId;
  @override
  final String? isAdmin;

  @override
  String toString() {
    return 'AddPeopleToChannel(id: $id, roleId: $roleId, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddPeopleToChannel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.roleId, roleId) ||
                const DeepCollectionEquality().equals(other.roleId, roleId)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(other.isAdmin, isAdmin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(roleId) ^
      const DeepCollectionEquality().hash(isAdmin);

  @JsonKey(ignore: true)
  @override
  _$AddPeopleToChannelCopyWith<_AddPeopleToChannel> get copyWith =>
      __$AddPeopleToChannelCopyWithImpl<_AddPeopleToChannel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddPeopleToChannelToJson(this);
  }
}

abstract class _AddPeopleToChannel implements AddPeopleToChannel {
  factory _AddPeopleToChannel(
      {required String? id,
      required String? roleId,
      required String? isAdmin}) = _$_AddPeopleToChannel;

  factory _AddPeopleToChannel.fromJson(Map<String, dynamic> json) =
      _$_AddPeopleToChannel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get roleId => throw _privateConstructorUsedError;
  @override
  String? get isAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddPeopleToChannelCopyWith<_AddPeopleToChannel> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
class _$ApiResponseTearOff {
  const _$ApiResponseTearOff();

  _ApiResponse call(
      {required int? statusCode,
      required String? statusMessage,
      required dynamic data}) {
    return _ApiResponse(
      statusCode: statusCode,
      statusMessage: statusMessage,
      data: data,
    );
  }

  ApiResponse fromJson(Map<String, Object> json) {
    return ApiResponse.fromJson(json);
  }
}

/// @nodoc
const $ApiResponse = _$ApiResponseTearOff();

/// @nodoc
mixin _$ApiResponse {
  int? get statusCode => throw _privateConstructorUsedError;
  String? get statusMessage => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res>;
  $Res call({int? statusCode, String? statusMessage, dynamic data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res> implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  final ApiResponse _value;

  final $Res Function(ApiResponse) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode:
          statusCode == freezed ? _value.statusCode : statusCode as int?,
      statusMessage: statusMessage == freezed
          ? _value.statusMessage
          : statusMessage as String?,
      data: data == freezed ? _value.data : data as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$ApiResponseCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$ApiResponseCopyWith(
          _ApiResponse value, $Res Function(_ApiResponse) then) =
      __$ApiResponseCopyWithImpl<$Res>;
  @override
  $Res call({int? statusCode, String? statusMessage, dynamic data});
}

/// @nodoc
class __$ApiResponseCopyWithImpl<$Res> extends _$ApiResponseCopyWithImpl<$Res>
    implements _$ApiResponseCopyWith<$Res> {
  __$ApiResponseCopyWithImpl(
      _ApiResponse _value, $Res Function(_ApiResponse) _then)
      : super(_value, (v) => _then(v as _ApiResponse));

  @override
  _ApiResponse get _value => super._value as _ApiResponse;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
  }) {
    return _then(_ApiResponse(
      statusCode:
          statusCode == freezed ? _value.statusCode : statusCode as int?,
      statusMessage: statusMessage == freezed
          ? _value.statusMessage
          : statusMessage as String?,
      data: data == freezed ? _value.data : data as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiResponse implements _ApiResponse {
  _$_ApiResponse(
      {required this.statusCode,
      required this.statusMessage,
      required this.data});

  factory _$_ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ApiResponseFromJson(json);

  @override
  final int? statusCode;
  @override
  final String? statusMessage;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'ApiResponse(statusCode: $statusCode, statusMessage: $statusMessage, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApiResponse &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.statusMessage, statusMessage) ||
                const DeepCollectionEquality()
                    .equals(other.statusMessage, statusMessage)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(statusMessage) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$ApiResponseCopyWith<_ApiResponse> get copyWith =>
      __$ApiResponseCopyWithImpl<_ApiResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ApiResponseToJson(this);
  }
}

abstract class _ApiResponse implements ApiResponse {
  factory _ApiResponse(
      {required int? statusCode,
      required String? statusMessage,
      required dynamic data}) = _$_ApiResponse;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$_ApiResponse.fromJson;

  @override
  int? get statusCode => throw _privateConstructorUsedError;
  @override
  String? get statusMessage => throw _privateConstructorUsedError;
  @override
  dynamic get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApiResponseCopyWith<_ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelMembersModel _$ChannelMembersModelFromJson(Map<String, dynamic> json) {
  return _ChannelMembersModel.fromJson(json);
}

/// @nodoc
class _$ChannelMembersModelTearOff {
  const _$ChannelMembersModelTearOff();

  _ChannelMembersModel call({required String? name, required bool? isAdmin}) {
    return _ChannelMembersModel(
      name: name,
      isAdmin: isAdmin,
    );
  }

  ChannelMembersModel fromJson(Map<String, Object> json) {
    return ChannelMembersModel.fromJson(json);
  }
}

/// @nodoc
const $ChannelMembersModel = _$ChannelMembersModelTearOff();

/// @nodoc
mixin _$ChannelMembersModel {
  String? get name => throw _privateConstructorUsedError;
  bool? get isAdmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelMembersModelCopyWith<ChannelMembersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelMembersModelCopyWith<$Res> {
  factory $ChannelMembersModelCopyWith(
          ChannelMembersModel value, $Res Function(ChannelMembersModel) then) =
      _$ChannelMembersModelCopyWithImpl<$Res>;
  $Res call({String? name, bool? isAdmin});
}

/// @nodoc
class _$ChannelMembersModelCopyWithImpl<$Res>
    implements $ChannelMembersModelCopyWith<$Res> {
  _$ChannelMembersModelCopyWithImpl(this._value, this._then);

  final ChannelMembersModel _value;

  final $Res Function(ChannelMembersModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? isAdmin = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String?,
      isAdmin: isAdmin == freezed ? _value.isAdmin : isAdmin as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ChannelMembersModelCopyWith<$Res>
    implements $ChannelMembersModelCopyWith<$Res> {
  factory _$ChannelMembersModelCopyWith(_ChannelMembersModel value,
          $Res Function(_ChannelMembersModel) then) =
      __$ChannelMembersModelCopyWithImpl<$Res>;
  @override
  $Res call({String? name, bool? isAdmin});
}

/// @nodoc
class __$ChannelMembersModelCopyWithImpl<$Res>
    extends _$ChannelMembersModelCopyWithImpl<$Res>
    implements _$ChannelMembersModelCopyWith<$Res> {
  __$ChannelMembersModelCopyWithImpl(
      _ChannelMembersModel _value, $Res Function(_ChannelMembersModel) _then)
      : super(_value, (v) => _then(v as _ChannelMembersModel));

  @override
  _ChannelMembersModel get _value => super._value as _ChannelMembersModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? isAdmin = freezed,
  }) {
    return _then(_ChannelMembersModel(
      name: name == freezed ? _value.name : name as String?,
      isAdmin: isAdmin == freezed ? _value.isAdmin : isAdmin as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelMembersModel implements _ChannelMembersModel {
  _$_ChannelMembersModel({required this.name, required this.isAdmin});

  factory _$_ChannelMembersModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ChannelMembersModelFromJson(json);

  @override
  final String? name;
  @override
  final bool? isAdmin;

  @override
  String toString() {
    return 'ChannelMembersModel(name: $name, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChannelMembersModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isAdmin, isAdmin) ||
                const DeepCollectionEquality().equals(other.isAdmin, isAdmin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isAdmin);

  @JsonKey(ignore: true)
  @override
  _$ChannelMembersModelCopyWith<_ChannelMembersModel> get copyWith =>
      __$ChannelMembersModelCopyWithImpl<_ChannelMembersModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChannelMembersModelToJson(this);
  }
}

abstract class _ChannelMembersModel implements ChannelMembersModel {
  factory _ChannelMembersModel(
      {required String? name, required bool? isAdmin}) = _$_ChannelMembersModel;

  factory _ChannelMembersModel.fromJson(Map<String, dynamic> json) =
      _$_ChannelMembersModel.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  bool? get isAdmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelMembersModelCopyWith<_ChannelMembersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) {
  return _ChannelModel.fromJson(json);
}

/// @nodoc
class _$ChannelModelTearOff {
  const _$ChannelModelTearOff();

  _ChannelModel call({required int? id, required String? name}) {
    return _ChannelModel(
      id: id,
      name: name,
    );
  }

  ChannelModel fromJson(Map<String, Object> json) {
    return ChannelModel.fromJson(json);
  }
}

/// @nodoc
const $ChannelModel = _$ChannelModelTearOff();

/// @nodoc
mixin _$ChannelModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelModelCopyWith<ChannelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelModelCopyWith<$Res> {
  factory $ChannelModelCopyWith(
          ChannelModel value, $Res Function(ChannelModel) then) =
      _$ChannelModelCopyWithImpl<$Res>;
  $Res call({int? id, String? name});
}

/// @nodoc
class _$ChannelModelCopyWithImpl<$Res> implements $ChannelModelCopyWith<$Res> {
  _$ChannelModelCopyWithImpl(this._value, this._then);

  final ChannelModel _value;

  final $Res Function(ChannelModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      name: name == freezed ? _value.name : name as String?,
    ));
  }
}

/// @nodoc
abstract class _$ChannelModelCopyWith<$Res>
    implements $ChannelModelCopyWith<$Res> {
  factory _$ChannelModelCopyWith(
          _ChannelModel value, $Res Function(_ChannelModel) then) =
      __$ChannelModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name});
}

/// @nodoc
class __$ChannelModelCopyWithImpl<$Res> extends _$ChannelModelCopyWithImpl<$Res>
    implements _$ChannelModelCopyWith<$Res> {
  __$ChannelModelCopyWithImpl(
      _ChannelModel _value, $Res Function(_ChannelModel) _then)
      : super(_value, (v) => _then(v as _ChannelModel));

  @override
  _ChannelModel get _value => super._value as _ChannelModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_ChannelModel(
      id: id == freezed ? _value.id : id as int?,
      name: name == freezed ? _value.name : name as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelModel implements _ChannelModel {
  _$_ChannelModel({required this.id, required this.name});

  factory _$_ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ChannelModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'ChannelModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChannelModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ChannelModelCopyWith<_ChannelModel> get copyWith =>
      __$ChannelModelCopyWithImpl<_ChannelModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChannelModelToJson(this);
  }
}

abstract class _ChannelModel implements ChannelModel {
  factory _ChannelModel({required int? id, required String? name}) =
      _$_ChannelModel;

  factory _ChannelModel.fromJson(Map<String, dynamic> json) =
      _$_ChannelModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelModelCopyWith<_ChannelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelsSearch _$ChannelsSearchFromJson(Map<String, dynamic> json) {
  return _ChannelsSearch.fromJson(json);
}

/// @nodoc
class _$ChannelsSearchTearOff {
  const _$ChannelsSearchTearOff();

  _ChannelsSearch call(
      {required int? id, required String? slug, required String? name}) {
    return _ChannelsSearch(
      id: id,
      slug: slug,
      name: name,
    );
  }

  ChannelsSearch fromJson(Map<String, Object> json) {
    return ChannelsSearch.fromJson(json);
  }
}

/// @nodoc
const $ChannelsSearch = _$ChannelsSearchTearOff();

/// @nodoc
mixin _$ChannelsSearch {
  int? get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelsSearchCopyWith<ChannelsSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelsSearchCopyWith<$Res> {
  factory $ChannelsSearchCopyWith(
          ChannelsSearch value, $Res Function(ChannelsSearch) then) =
      _$ChannelsSearchCopyWithImpl<$Res>;
  $Res call({int? id, String? slug, String? name});
}

/// @nodoc
class _$ChannelsSearchCopyWithImpl<$Res>
    implements $ChannelsSearchCopyWith<$Res> {
  _$ChannelsSearchCopyWithImpl(this._value, this._then);

  final ChannelsSearch _value;

  final $Res Function(ChannelsSearch) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      slug: slug == freezed ? _value.slug : slug as String?,
      name: name == freezed ? _value.name : name as String?,
    ));
  }
}

/// @nodoc
abstract class _$ChannelsSearchCopyWith<$Res>
    implements $ChannelsSearchCopyWith<$Res> {
  factory _$ChannelsSearchCopyWith(
          _ChannelsSearch value, $Res Function(_ChannelsSearch) then) =
      __$ChannelsSearchCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? slug, String? name});
}

/// @nodoc
class __$ChannelsSearchCopyWithImpl<$Res>
    extends _$ChannelsSearchCopyWithImpl<$Res>
    implements _$ChannelsSearchCopyWith<$Res> {
  __$ChannelsSearchCopyWithImpl(
      _ChannelsSearch _value, $Res Function(_ChannelsSearch) _then)
      : super(_value, (v) => _then(v as _ChannelsSearch));

  @override
  _ChannelsSearch get _value => super._value as _ChannelsSearch;

  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
  }) {
    return _then(_ChannelsSearch(
      id: id == freezed ? _value.id : id as int?,
      slug: slug == freezed ? _value.slug : slug as String?,
      name: name == freezed ? _value.name : name as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelsSearch implements _ChannelsSearch {
  _$_ChannelsSearch({required this.id, required this.slug, required this.name});

  factory _$_ChannelsSearch.fromJson(Map<String, dynamic> json) =>
      _$_$_ChannelsSearchFromJson(json);

  @override
  final int? id;
  @override
  final String? slug;
  @override
  final String? name;

  @override
  String toString() {
    return 'ChannelsSearch(id: $id, slug: $slug, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChannelsSearch &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.slug, slug) ||
                const DeepCollectionEquality().equals(other.slug, slug)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(slug) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ChannelsSearchCopyWith<_ChannelsSearch> get copyWith =>
      __$ChannelsSearchCopyWithImpl<_ChannelsSearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChannelsSearchToJson(this);
  }
}

abstract class _ChannelsSearch implements ChannelsSearch {
  factory _ChannelsSearch(
      {required int? id,
      required String? slug,
      required String? name}) = _$_ChannelsSearch;

  factory _ChannelsSearch.fromJson(Map<String, dynamic> json) =
      _$_ChannelsSearch.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get slug => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelsSearchCopyWith<_ChannelsSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

OrganizationModel _$OrganizationModelFromJson(Map<String, dynamic> json) {
  return _OrganizationModel.fromJson(json);
}

/// @nodoc
class _$OrganizationModelTearOff {
  const _$OrganizationModelTearOff();

  _OrganizationModel call(
      {required int? id,
      required String? name,
      required String? organizationUrl,
      required String? time,
      required String? logoUrl,
      required bool? isOwner,
      required int? noOfMembers}) {
    return _OrganizationModel(
      id: id,
      name: name,
      organizationUrl: organizationUrl,
      time: time,
      logoUrl: logoUrl,
      isOwner: isOwner,
      noOfMembers: noOfMembers,
    );
  }

  OrganizationModel fromJson(Map<String, Object> json) {
    return OrganizationModel.fromJson(json);
  }
}

/// @nodoc
const $OrganizationModel = _$OrganizationModelTearOff();

/// @nodoc
mixin _$OrganizationModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get organizationUrl => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  bool? get isOwner => throw _privateConstructorUsedError;
  int? get noOfMembers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationModelCopyWith<OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationModelCopyWith<$Res> {
  factory $OrganizationModelCopyWith(
          OrganizationModel value, $Res Function(OrganizationModel) then) =
      _$OrganizationModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? organizationUrl,
      String? time,
      String? logoUrl,
      bool? isOwner,
      int? noOfMembers});
}

/// @nodoc
class _$OrganizationModelCopyWithImpl<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  _$OrganizationModelCopyWithImpl(this._value, this._then);

  final OrganizationModel _value;

  final $Res Function(OrganizationModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? organizationUrl = freezed,
    Object? time = freezed,
    Object? logoUrl = freezed,
    Object? isOwner = freezed,
    Object? noOfMembers = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      name: name == freezed ? _value.name : name as String?,
      organizationUrl: organizationUrl == freezed
          ? _value.organizationUrl
          : organizationUrl as String?,
      time: time == freezed ? _value.time : time as String?,
      logoUrl: logoUrl == freezed ? _value.logoUrl : logoUrl as String?,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool?,
      noOfMembers:
          noOfMembers == freezed ? _value.noOfMembers : noOfMembers as int?,
    ));
  }
}

/// @nodoc
abstract class _$OrganizationModelCopyWith<$Res>
    implements $OrganizationModelCopyWith<$Res> {
  factory _$OrganizationModelCopyWith(
          _OrganizationModel value, $Res Function(_OrganizationModel) then) =
      __$OrganizationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? organizationUrl,
      String? time,
      String? logoUrl,
      bool? isOwner,
      int? noOfMembers});
}

/// @nodoc
class __$OrganizationModelCopyWithImpl<$Res>
    extends _$OrganizationModelCopyWithImpl<$Res>
    implements _$OrganizationModelCopyWith<$Res> {
  __$OrganizationModelCopyWithImpl(
      _OrganizationModel _value, $Res Function(_OrganizationModel) _then)
      : super(_value, (v) => _then(v as _OrganizationModel));

  @override
  _OrganizationModel get _value => super._value as _OrganizationModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? organizationUrl = freezed,
    Object? time = freezed,
    Object? logoUrl = freezed,
    Object? isOwner = freezed,
    Object? noOfMembers = freezed,
  }) {
    return _then(_OrganizationModel(
      id: id == freezed ? _value.id : id as int?,
      name: name == freezed ? _value.name : name as String?,
      organizationUrl: organizationUrl == freezed
          ? _value.organizationUrl
          : organizationUrl as String?,
      time: time == freezed ? _value.time : time as String?,
      logoUrl: logoUrl == freezed ? _value.logoUrl : logoUrl as String?,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool?,
      noOfMembers:
          noOfMembers == freezed ? _value.noOfMembers : noOfMembers as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrganizationModel implements _OrganizationModel {
  _$_OrganizationModel(
      {required this.id,
      required this.name,
      required this.organizationUrl,
      required this.time,
      required this.logoUrl,
      required this.isOwner,
      required this.noOfMembers});

  factory _$_OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$_$_OrganizationModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? organizationUrl;
  @override
  final String? time;
  @override
  final String? logoUrl;
  @override
  final bool? isOwner;
  @override
  final int? noOfMembers;

  @override
  String toString() {
    return 'OrganizationModel(id: $id, name: $name, organizationUrl: $organizationUrl, time: $time, logoUrl: $logoUrl, isOwner: $isOwner, noOfMembers: $noOfMembers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrganizationModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.organizationUrl, organizationUrl) ||
                const DeepCollectionEquality()
                    .equals(other.organizationUrl, organizationUrl)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.logoUrl, logoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.logoUrl, logoUrl)) &&
            (identical(other.isOwner, isOwner) ||
                const DeepCollectionEquality()
                    .equals(other.isOwner, isOwner)) &&
            (identical(other.noOfMembers, noOfMembers) ||
                const DeepCollectionEquality()
                    .equals(other.noOfMembers, noOfMembers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(organizationUrl) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(logoUrl) ^
      const DeepCollectionEquality().hash(isOwner) ^
      const DeepCollectionEquality().hash(noOfMembers);

  @JsonKey(ignore: true)
  @override
  _$OrganizationModelCopyWith<_OrganizationModel> get copyWith =>
      __$OrganizationModelCopyWithImpl<_OrganizationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrganizationModelToJson(this);
  }
}

abstract class _OrganizationModel implements OrganizationModel {
  factory _OrganizationModel(
      {required int? id,
      required String? name,
      required String? organizationUrl,
      required String? time,
      required String? logoUrl,
      required bool? isOwner,
      required int? noOfMembers}) = _$_OrganizationModel;

  factory _OrganizationModel.fromJson(Map<String, dynamic> json) =
      _$_OrganizationModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get organizationUrl => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  String? get logoUrl => throw _privateConstructorUsedError;
  @override
  bool? get isOwner => throw _privateConstructorUsedError;
  @override
  int? get noOfMembers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrganizationModelCopyWith<_OrganizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
class _$ProfileModelTearOff {
  const _$ProfileModelTearOff();

  _ProfileModel call(
      {required bool? userId,
      required String? firstName,
      required String? lastName,
      required String? displayName,
      required String? email,
      required int? phoneNumber,
      required String? status,
      required String? bio}) {
    return _ProfileModel(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
      email: email,
      phoneNumber: phoneNumber,
      status: status,
      bio: bio,
    );
  }

  ProfileModel fromJson(Map<String, Object> json) {
    return ProfileModel.fromJson(json);
  }
}

/// @nodoc
const $ProfileModel = _$ProfileModelTearOff();

/// @nodoc
mixin _$ProfileModel {
  bool? get userId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get phoneNumber => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res>;
  $Res call(
      {bool? userId,
      String? firstName,
      String? lastName,
      String? displayName,
      String? email,
      int? phoneNumber,
      String? status,
      String? bio});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res> implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  final ProfileModel _value;

  final $Res Function(ProfileModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as bool?,
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      email: email == freezed ? _value.email : email as String?,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as int?,
      status: status == freezed ? _value.status : status as String?,
      bio: bio == freezed ? _value.bio : bio as String?,
    ));
  }
}

/// @nodoc
abstract class _$ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(
          _ProfileModel value, $Res Function(_ProfileModel) then) =
      __$ProfileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? userId,
      String? firstName,
      String? lastName,
      String? displayName,
      String? email,
      int? phoneNumber,
      String? status,
      String? bio});
}

/// @nodoc
class __$ProfileModelCopyWithImpl<$Res> extends _$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(
      _ProfileModel _value, $Res Function(_ProfileModel) _then)
      : super(_value, (v) => _then(v as _ProfileModel));

  @override
  _ProfileModel get _value => super._value as _ProfileModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? bio = freezed,
  }) {
    return _then(_ProfileModel(
      userId: userId == freezed ? _value.userId : userId as bool?,
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      email: email == freezed ? _value.email : email as String?,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as int?,
      status: status == freezed ? _value.status : status as String?,
      bio: bio == freezed ? _value.bio : bio as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel implements _ProfileModel {
  _$_ProfileModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.displayName,
      required this.email,
      required this.phoneNumber,
      required this.status,
      required this.bio});

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ProfileModelFromJson(json);

  @override
  final bool? userId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final int? phoneNumber;
  @override
  final String? status;
  @override
  final String? bio;

  @override
  String toString() {
    return 'ProfileModel(userId: $userId, firstName: $firstName, lastName: $lastName, displayName: $displayName, email: $email, phoneNumber: $phoneNumber, status: $status, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProfileModel &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(bio);

  @JsonKey(ignore: true)
  @override
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProfileModelToJson(this);
  }
}

abstract class _ProfileModel implements ProfileModel {
  factory _ProfileModel(
      {required bool? userId,
      required String? firstName,
      required String? lastName,
      required String? displayName,
      required String? email,
      required int? phoneNumber,
      required String? status,
      required String? bio}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  bool? get userId => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  int? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get bio => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpDataModel _$SignUpDataModelFromJson(Map<String, dynamic> json) {
  return _SignUpDataModel.fromJson(json);
}

/// @nodoc
class _$SignUpDataModelTearOff {
  const _$SignUpDataModelTearOff();

  _SignUpDataModel call(
      {required String? firstName,
      required String? lastName,
      required String? email,
      required String? password,
      required String? confirmPassword,
      required String? displayName,
      required String? phoneNumber}) {
    return _SignUpDataModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      displayName: displayName,
      phoneNumber: phoneNumber,
    );
  }

  SignUpDataModel fromJson(Map<String, Object> json) {
    return SignUpDataModel.fromJson(json);
  }
}

/// @nodoc
const $SignUpDataModel = _$SignUpDataModelTearOff();

/// @nodoc
mixin _$SignUpDataModel {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpDataModelCopyWith<SignUpDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDataModelCopyWith<$Res> {
  factory $SignUpDataModelCopyWith(
          SignUpDataModel value, $Res Function(SignUpDataModel) then) =
      _$SignUpDataModelCopyWithImpl<$Res>;
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? confirmPassword,
      String? displayName,
      String? phoneNumber});
}

/// @nodoc
class _$SignUpDataModelCopyWithImpl<$Res>
    implements $SignUpDataModelCopyWith<$Res> {
  _$SignUpDataModelCopyWithImpl(this._value, this._then);

  final SignUpDataModel _value;

  final $Res Function(SignUpDataModel) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? displayName = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      email: email == freezed ? _value.email : email as String?,
      password: password == freezed ? _value.password : password as String?,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String?,
    ));
  }
}

/// @nodoc
abstract class _$SignUpDataModelCopyWith<$Res>
    implements $SignUpDataModelCopyWith<$Res> {
  factory _$SignUpDataModelCopyWith(
          _SignUpDataModel value, $Res Function(_SignUpDataModel) then) =
      __$SignUpDataModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? confirmPassword,
      String? displayName,
      String? phoneNumber});
}

/// @nodoc
class __$SignUpDataModelCopyWithImpl<$Res>
    extends _$SignUpDataModelCopyWithImpl<$Res>
    implements _$SignUpDataModelCopyWith<$Res> {
  __$SignUpDataModelCopyWithImpl(
      _SignUpDataModel _value, $Res Function(_SignUpDataModel) _then)
      : super(_value, (v) => _then(v as _SignUpDataModel));

  @override
  _SignUpDataModel get _value => super._value as _SignUpDataModel;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? displayName = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_SignUpDataModel(
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      email: email == freezed ? _value.email : email as String?,
      password: password == freezed ? _value.password : password as String?,
      confirmPassword: confirmPassword == freezed
          ? _value.confirmPassword
          : confirmPassword as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpDataModel implements _SignUpDataModel {
  _$_SignUpDataModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.displayName,
      required this.phoneNumber});

  factory _$_SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SignUpDataModelFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? confirmPassword;
  @override
  final String? displayName;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'SignUpDataModel(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword, displayName: $displayName, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpDataModel &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmPassword, confirmPassword) ||
                const DeepCollectionEquality()
                    .equals(other.confirmPassword, confirmPassword)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmPassword) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(phoneNumber);

  @JsonKey(ignore: true)
  @override
  _$SignUpDataModelCopyWith<_SignUpDataModel> get copyWith =>
      __$SignUpDataModelCopyWithImpl<_SignUpDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignUpDataModelToJson(this);
  }
}

abstract class _SignUpDataModel implements SignUpDataModel {
  factory _SignUpDataModel(
      {required String? firstName,
      required String? lastName,
      required String? email,
      required String? password,
      required String? confirmPassword,
      required String? displayName,
      required String? phoneNumber}) = _$_SignUpDataModel;

  factory _SignUpDataModel.fromJson(Map<String, dynamic> json) =
      _$_SignUpDataModel.fromJson;

  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get password => throw _privateConstructorUsedError;
  @override
  String? get confirmPassword => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignUpDataModelCopyWith<_SignUpDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

StartDmModel _$StartDmModelFromJson(Map<String, dynamic> json) {
  return _StartDmModel.fromJson(json);
}

/// @nodoc
class _$StartDmModelTearOff {
  const _$StartDmModelTearOff();

  _StartDmModel call(
      {required int? id,
      required String? orgId,
      required bool? isOnline,
      required String? imageUrl,
      required String? fullName,
      required String? files,
      required String? status,
      required String? email,
      required String? displayName,
      required String? bio,
      required String? pronouns,
      required String? phone,
      required String? timeZone,
      required String? joinedAt,
      required bool? isChecked}) {
    return _StartDmModel(
      id: id,
      orgId: orgId,
      isOnline: isOnline,
      imageUrl: imageUrl,
      fullName: fullName,
      files: files,
      status: status,
      email: email,
      displayName: displayName,
      bio: bio,
      pronouns: pronouns,
      phone: phone,
      timeZone: timeZone,
      joinedAt: joinedAt,
      isChecked: isChecked,
    );
  }

  StartDmModel fromJson(Map<String, Object> json) {
    return StartDmModel.fromJson(json);
  }
}

/// @nodoc
const $StartDmModel = _$StartDmModelTearOff();

/// @nodoc
mixin _$StartDmModel {
  int? get id => throw _privateConstructorUsedError;
  String? get orgId => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get files => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get pronouns => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get timeZone => throw _privateConstructorUsedError;
  String? get joinedAt => throw _privateConstructorUsedError;
  bool? get isChecked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartDmModelCopyWith<StartDmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartDmModelCopyWith<$Res> {
  factory $StartDmModelCopyWith(
          StartDmModel value, $Res Function(StartDmModel) then) =
      _$StartDmModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? orgId,
      bool? isOnline,
      String? imageUrl,
      String? fullName,
      String? files,
      String? status,
      String? email,
      String? displayName,
      String? bio,
      String? pronouns,
      String? phone,
      String? timeZone,
      String? joinedAt,
      bool? isChecked});
}

/// @nodoc
class _$StartDmModelCopyWithImpl<$Res> implements $StartDmModelCopyWith<$Res> {
  _$StartDmModelCopyWithImpl(this._value, this._then);

  final StartDmModel _value;

  final $Res Function(StartDmModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = freezed,
    Object? isOnline = freezed,
    Object? imageUrl = freezed,
    Object? fullName = freezed,
    Object? files = freezed,
    Object? status = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? bio = freezed,
    Object? pronouns = freezed,
    Object? phone = freezed,
    Object? timeZone = freezed,
    Object? joinedAt = freezed,
    Object? isChecked = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      orgId: orgId == freezed ? _value.orgId : orgId as String?,
      isOnline: isOnline == freezed ? _value.isOnline : isOnline as bool?,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String?,
      fullName: fullName == freezed ? _value.fullName : fullName as String?,
      files: files == freezed ? _value.files : files as String?,
      status: status == freezed ? _value.status : status as String?,
      email: email == freezed ? _value.email : email as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      bio: bio == freezed ? _value.bio : bio as String?,
      pronouns: pronouns == freezed ? _value.pronouns : pronouns as String?,
      phone: phone == freezed ? _value.phone : phone as String?,
      timeZone: timeZone == freezed ? _value.timeZone : timeZone as String?,
      joinedAt: joinedAt == freezed ? _value.joinedAt : joinedAt as String?,
      isChecked: isChecked == freezed ? _value.isChecked : isChecked as bool?,
    ));
  }
}

/// @nodoc
abstract class _$StartDmModelCopyWith<$Res>
    implements $StartDmModelCopyWith<$Res> {
  factory _$StartDmModelCopyWith(
          _StartDmModel value, $Res Function(_StartDmModel) then) =
      __$StartDmModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? orgId,
      bool? isOnline,
      String? imageUrl,
      String? fullName,
      String? files,
      String? status,
      String? email,
      String? displayName,
      String? bio,
      String? pronouns,
      String? phone,
      String? timeZone,
      String? joinedAt,
      bool? isChecked});
}

/// @nodoc
class __$StartDmModelCopyWithImpl<$Res> extends _$StartDmModelCopyWithImpl<$Res>
    implements _$StartDmModelCopyWith<$Res> {
  __$StartDmModelCopyWithImpl(
      _StartDmModel _value, $Res Function(_StartDmModel) _then)
      : super(_value, (v) => _then(v as _StartDmModel));

  @override
  _StartDmModel get _value => super._value as _StartDmModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? orgId = freezed,
    Object? isOnline = freezed,
    Object? imageUrl = freezed,
    Object? fullName = freezed,
    Object? files = freezed,
    Object? status = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? bio = freezed,
    Object? pronouns = freezed,
    Object? phone = freezed,
    Object? timeZone = freezed,
    Object? joinedAt = freezed,
    Object? isChecked = freezed,
  }) {
    return _then(_StartDmModel(
      id: id == freezed ? _value.id : id as int?,
      orgId: orgId == freezed ? _value.orgId : orgId as String?,
      isOnline: isOnline == freezed ? _value.isOnline : isOnline as bool?,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String?,
      fullName: fullName == freezed ? _value.fullName : fullName as String?,
      files: files == freezed ? _value.files : files as String?,
      status: status == freezed ? _value.status : status as String?,
      email: email == freezed ? _value.email : email as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      bio: bio == freezed ? _value.bio : bio as String?,
      pronouns: pronouns == freezed ? _value.pronouns : pronouns as String?,
      phone: phone == freezed ? _value.phone : phone as String?,
      timeZone: timeZone == freezed ? _value.timeZone : timeZone as String?,
      joinedAt: joinedAt == freezed ? _value.joinedAt : joinedAt as String?,
      isChecked: isChecked == freezed ? _value.isChecked : isChecked as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartDmModel implements _StartDmModel {
  _$_StartDmModel(
      {required this.id,
      required this.orgId,
      required this.isOnline,
      required this.imageUrl,
      required this.fullName,
      required this.files,
      required this.status,
      required this.email,
      required this.displayName,
      required this.bio,
      required this.pronouns,
      required this.phone,
      required this.timeZone,
      required this.joinedAt,
      required this.isChecked});

  factory _$_StartDmModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StartDmModelFromJson(json);

  @override
  final int? id;
  @override
  final String? orgId;
  @override
  final bool? isOnline;
  @override
  final String? imageUrl;
  @override
  final String? fullName;
  @override
  final String? files;
  @override
  final String? status;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? bio;
  @override
  final String? pronouns;
  @override
  final String? phone;
  @override
  final String? timeZone;
  @override
  final String? joinedAt;
  @override
  final bool? isChecked;

  @override
  String toString() {
    return 'StartDmModel(id: $id, orgId: $orgId, isOnline: $isOnline, imageUrl: $imageUrl, fullName: $fullName, files: $files, status: $status, email: $email, displayName: $displayName, bio: $bio, pronouns: $pronouns, phone: $phone, timeZone: $timeZone, joinedAt: $joinedAt, isChecked: $isChecked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StartDmModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.orgId, orgId) ||
                const DeepCollectionEquality().equals(other.orgId, orgId)) &&
            (identical(other.isOnline, isOnline) ||
                const DeepCollectionEquality()
                    .equals(other.isOnline, isOnline)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.fullName, fullName) ||
                const DeepCollectionEquality()
                    .equals(other.fullName, fullName)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)) &&
            (identical(other.pronouns, pronouns) ||
                const DeepCollectionEquality()
                    .equals(other.pronouns, pronouns)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.timeZone, timeZone) ||
                const DeepCollectionEquality()
                    .equals(other.timeZone, timeZone)) &&
            (identical(other.joinedAt, joinedAt) ||
                const DeepCollectionEquality()
                    .equals(other.joinedAt, joinedAt)) &&
            (identical(other.isChecked, isChecked) ||
                const DeepCollectionEquality()
                    .equals(other.isChecked, isChecked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(orgId) ^
      const DeepCollectionEquality().hash(isOnline) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(fullName) ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(bio) ^
      const DeepCollectionEquality().hash(pronouns) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(timeZone) ^
      const DeepCollectionEquality().hash(joinedAt) ^
      const DeepCollectionEquality().hash(isChecked);

  @JsonKey(ignore: true)
  @override
  _$StartDmModelCopyWith<_StartDmModel> get copyWith =>
      __$StartDmModelCopyWithImpl<_StartDmModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StartDmModelToJson(this);
  }
}

abstract class _StartDmModel implements StartDmModel {
  factory _StartDmModel(
      {required int? id,
      required String? orgId,
      required bool? isOnline,
      required String? imageUrl,
      required String? fullName,
      required String? files,
      required String? status,
      required String? email,
      required String? displayName,
      required String? bio,
      required String? pronouns,
      required String? phone,
      required String? timeZone,
      required String? joinedAt,
      required bool? isChecked}) = _$_StartDmModel;

  factory _StartDmModel.fromJson(Map<String, dynamic> json) =
      _$_StartDmModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get orgId => throw _privateConstructorUsedError;
  @override
  bool? get isOnline => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get fullName => throw _privateConstructorUsedError;
  @override
  String? get files => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get bio => throw _privateConstructorUsedError;
  @override
  String? get pronouns => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get timeZone => throw _privateConstructorUsedError;
  @override
  String? get joinedAt => throw _privateConstructorUsedError;
  @override
  bool? get isChecked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StartDmModelCopyWith<_StartDmModel> get copyWith =>
      throw _privateConstructorUsedError;
}

StaticUserModel _$StaticUserModelFromJson(Map<String, dynamic> json) {
  return _StaticUserModel.fromJson(json);
}

/// @nodoc
class _$StaticUserModelTearOff {
  const _$StaticUserModelTearOff();

  _StaticUserModel call(
      {required String? userName,
      required String? userImg,
      required String? joinInfo,
      required String? time,
      required bool? online}) {
    return _StaticUserModel(
      userName: userName,
      userImg: userImg,
      joinInfo: joinInfo,
      time: time,
      online: online,
    );
  }

  StaticUserModel fromJson(Map<String, Object> json) {
    return StaticUserModel.fromJson(json);
  }
}

/// @nodoc
const $StaticUserModel = _$StaticUserModelTearOff();

/// @nodoc
mixin _$StaticUserModel {
  String? get userName => throw _privateConstructorUsedError;
  String? get userImg => throw _privateConstructorUsedError;
  String? get joinInfo => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  bool? get online => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaticUserModelCopyWith<StaticUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaticUserModelCopyWith<$Res> {
  factory $StaticUserModelCopyWith(
          StaticUserModel value, $Res Function(StaticUserModel) then) =
      _$StaticUserModelCopyWithImpl<$Res>;
  $Res call(
      {String? userName,
      String? userImg,
      String? joinInfo,
      String? time,
      bool? online});
}

/// @nodoc
class _$StaticUserModelCopyWithImpl<$Res>
    implements $StaticUserModelCopyWith<$Res> {
  _$StaticUserModelCopyWithImpl(this._value, this._then);

  final StaticUserModel _value;

  final $Res Function(StaticUserModel) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userImg = freezed,
    Object? joinInfo = freezed,
    Object? time = freezed,
    Object? online = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed ? _value.userName : userName as String?,
      userImg: userImg == freezed ? _value.userImg : userImg as String?,
      joinInfo: joinInfo == freezed ? _value.joinInfo : joinInfo as String?,
      time: time == freezed ? _value.time : time as String?,
      online: online == freezed ? _value.online : online as bool?,
    ));
  }
}

/// @nodoc
abstract class _$StaticUserModelCopyWith<$Res>
    implements $StaticUserModelCopyWith<$Res> {
  factory _$StaticUserModelCopyWith(
          _StaticUserModel value, $Res Function(_StaticUserModel) then) =
      __$StaticUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userName,
      String? userImg,
      String? joinInfo,
      String? time,
      bool? online});
}

/// @nodoc
class __$StaticUserModelCopyWithImpl<$Res>
    extends _$StaticUserModelCopyWithImpl<$Res>
    implements _$StaticUserModelCopyWith<$Res> {
  __$StaticUserModelCopyWithImpl(
      _StaticUserModel _value, $Res Function(_StaticUserModel) _then)
      : super(_value, (v) => _then(v as _StaticUserModel));

  @override
  _StaticUserModel get _value => super._value as _StaticUserModel;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userImg = freezed,
    Object? joinInfo = freezed,
    Object? time = freezed,
    Object? online = freezed,
  }) {
    return _then(_StaticUserModel(
      userName: userName == freezed ? _value.userName : userName as String?,
      userImg: userImg == freezed ? _value.userImg : userImg as String?,
      joinInfo: joinInfo == freezed ? _value.joinInfo : joinInfo as String?,
      time: time == freezed ? _value.time : time as String?,
      online: online == freezed ? _value.online : online as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StaticUserModel implements _StaticUserModel {
  _$_StaticUserModel(
      {required this.userName,
      required this.userImg,
      required this.joinInfo,
      required this.time,
      required this.online});

  factory _$_StaticUserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_StaticUserModelFromJson(json);

  @override
  final String? userName;
  @override
  final String? userImg;
  @override
  final String? joinInfo;
  @override
  final String? time;
  @override
  final bool? online;

  @override
  String toString() {
    return 'StaticUserModel(userName: $userName, userImg: $userImg, joinInfo: $joinInfo, time: $time, online: $online)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StaticUserModel &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.userImg, userImg) ||
                const DeepCollectionEquality()
                    .equals(other.userImg, userImg)) &&
            (identical(other.joinInfo, joinInfo) ||
                const DeepCollectionEquality()
                    .equals(other.joinInfo, joinInfo)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.online, online) ||
                const DeepCollectionEquality().equals(other.online, online)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(userImg) ^
      const DeepCollectionEquality().hash(joinInfo) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(online);

  @JsonKey(ignore: true)
  @override
  _$StaticUserModelCopyWith<_StaticUserModel> get copyWith =>
      __$StaticUserModelCopyWithImpl<_StaticUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StaticUserModelToJson(this);
  }
}

abstract class _StaticUserModel implements StaticUserModel {
  factory _StaticUserModel(
      {required String? userName,
      required String? userImg,
      required String? joinInfo,
      required String? time,
      required bool? online}) = _$_StaticUserModel;

  factory _StaticUserModel.fromJson(Map<String, dynamic> json) =
      _$_StaticUserModel.fromJson;

  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  String? get userImg => throw _privateConstructorUsedError;
  @override
  String? get joinInfo => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  bool? get online => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StaticUserModelCopyWith<_StaticUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
class _$TodoModelTearOff {
  const _$TodoModelTearOff();

  _TodoModel call(
      {required int? userId,
      required int? id,
      required String? title,
      required bool? status}) {
    return _TodoModel(
      userId: userId,
      id: id,
      title: title,
      status: status,
    );
  }

  TodoModel fromJson(Map<String, Object> json) {
    return TodoModel.fromJson(json);
  }
}

/// @nodoc
const $TodoModel = _$TodoModelTearOff();

/// @nodoc
mixin _$TodoModel {
  int? get userId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res>;
  $Res call({int? userId, int? id, String? title, bool? status});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res> implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  final TodoModel _value;

  final $Res Function(TodoModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as int?,
      id: id == freezed ? _value.id : id as int?,
      title: title == freezed ? _value.title : title as String?,
      status: status == freezed ? _value.status : status as bool?,
    ));
  }
}

/// @nodoc
abstract class _$TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$TodoModelCopyWith(
          _TodoModel value, $Res Function(_TodoModel) then) =
      __$TodoModelCopyWithImpl<$Res>;
  @override
  $Res call({int? userId, int? id, String? title, bool? status});
}

/// @nodoc
class __$TodoModelCopyWithImpl<$Res> extends _$TodoModelCopyWithImpl<$Res>
    implements _$TodoModelCopyWith<$Res> {
  __$TodoModelCopyWithImpl(_TodoModel _value, $Res Function(_TodoModel) _then)
      : super(_value, (v) => _then(v as _TodoModel));

  @override
  _TodoModel get _value => super._value as _TodoModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? status = freezed,
  }) {
    return _then(_TodoModel(
      userId: userId == freezed ? _value.userId : userId as int?,
      id: id == freezed ? _value.id : id as int?,
      title: title == freezed ? _value.title : title as String?,
      status: status == freezed ? _value.status : status as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoModel implements _TodoModel {
  _$_TodoModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.status});

  factory _$_TodoModel.fromJson(Map<String, dynamic> json) =>
      _$_$_TodoModelFromJson(json);

  @override
  final int? userId;
  @override
  final int? id;
  @override
  final String? title;
  @override
  final bool? status;

  @override
  String toString() {
    return 'TodoModel(userId: $userId, id: $id, title: $title, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoModel &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$TodoModelCopyWith<_TodoModel> get copyWith =>
      __$TodoModelCopyWithImpl<_TodoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TodoModelToJson(this);
  }
}

abstract class _TodoModel implements TodoModel {
  factory _TodoModel(
      {required int? userId,
      required int? id,
      required String? title,
      required bool? status}) = _$_TodoModel;

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$_TodoModel.fromJson;

  @override
  int? get userId => throw _privateConstructorUsedError;
  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  bool? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodoModelCopyWith<_TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {required String? userId,
      required String? firstName,
      required String? lastName,
      required String? displayName,
      required String? email,
      required String? phoneNumber,
      required int? status,
      required String? timezone,
      required String? createdAt,
      required String? updatedAt}) {
    return _UserModel(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      displayName: displayName,
      email: email,
      phoneNumber: phoneNumber,
      status: status,
      timezone: timezone,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  UserModel fromJson(Map<String, Object> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String? get userId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String? userId,
      String? firstName,
      String? lastName,
      String? displayName,
      String? email,
      String? phoneNumber,
      int? status,
      String? timezone,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;

  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? timezone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String?,
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      email: email == freezed ? _value.email : email as String?,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String?,
      status: status == freezed ? _value.status : status as int?,
      timezone: timezone == freezed ? _value.timezone : timezone as String?,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String?,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userId,
      String? firstName,
      String? lastName,
      String? displayName,
      String? email,
      String? phoneNumber,
      int? status,
      String? timezone,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
    Object? timezone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_UserModel(
      userId: userId == freezed ? _value.userId : userId as String?,
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      email: email == freezed ? _value.email : email as String?,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String?,
      status: status == freezed ? _value.status : status as int?,
      timezone: timezone == freezed ? _value.timezone : timezone as String?,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String?,
      updatedAt: updatedAt == freezed ? _value.updatedAt : updatedAt as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.displayName,
      required this.email,
      required this.phoneNumber,
      required this.status,
      required this.timezone,
      required this.createdAt,
      required this.updatedAt});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  final String? userId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final int? status;
  @override
  final String? timezone;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'UserModel(userId: $userId, firstName: $firstName, lastName: $lastName, displayName: $displayName, email: $email, phoneNumber: $phoneNumber, status: $status, timezone: $timezone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.timezone, timezone) ||
                const DeepCollectionEquality()
                    .equals(other.timezone, timezone)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(timezone) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required String? userId,
      required String? firstName,
      required String? lastName,
      required String? displayName,
      required String? email,
      required String? phoneNumber,
      required int? status,
      required String? timezone,
      required String? createdAt,
      required String? updatedAt}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  int? get status => throw _privateConstructorUsedError;
  @override
  String? get timezone => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserThreadPost _$UserThreadPostFromJson(Map<String, dynamic> json) {
  return _UserThreadPost.fromJson(json);
}

/// @nodoc
class _$UserThreadPostTearOff {
  const _$UserThreadPostTearOff();

  _UserThreadPost call(
      {required int? id,
      required String? userId,
      required String? image,
      required String? displayName,
      required String? statusIcon,
      required String? lastSeen,
      required String? message,
      List<PostEmojis>? postEmojis,
      required String? postDate}) {
    return _UserThreadPost(
      id: id,
      userId: userId,
      image: image,
      displayName: displayName,
      statusIcon: statusIcon,
      lastSeen: lastSeen,
      message: message,
      postEmojis: postEmojis,
      postDate: postDate,
    );
  }

  UserThreadPost fromJson(Map<String, Object> json) {
    return UserThreadPost.fromJson(json);
  }
}

/// @nodoc
const $UserThreadPost = _$UserThreadPostTearOff();

/// @nodoc
mixin _$UserThreadPost {
  int? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get statusIcon => throw _privateConstructorUsedError;
  String? get lastSeen => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<PostEmojis>? get postEmojis => throw _privateConstructorUsedError;
  String? get postDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserThreadPostCopyWith<UserThreadPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserThreadPostCopyWith<$Res> {
  factory $UserThreadPostCopyWith(
          UserThreadPost value, $Res Function(UserThreadPost) then) =
      _$UserThreadPostCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? userId,
      String? image,
      String? displayName,
      String? statusIcon,
      String? lastSeen,
      String? message,
      List<PostEmojis>? postEmojis,
      String? postDate});
}

/// @nodoc
class _$UserThreadPostCopyWithImpl<$Res>
    implements $UserThreadPostCopyWith<$Res> {
  _$UserThreadPostCopyWithImpl(this._value, this._then);

  final UserThreadPost _value;

  final $Res Function(UserThreadPost) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? displayName = freezed,
    Object? statusIcon = freezed,
    Object? lastSeen = freezed,
    Object? message = freezed,
    Object? postEmojis = freezed,
    Object? postDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      userId: userId == freezed ? _value.userId : userId as String?,
      image: image == freezed ? _value.image : image as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      statusIcon:
          statusIcon == freezed ? _value.statusIcon : statusIcon as String?,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as String?,
      message: message == freezed ? _value.message : message as String?,
      postEmojis: postEmojis == freezed
          ? _value.postEmojis
          : postEmojis as List<PostEmojis>?,
      postDate: postDate == freezed ? _value.postDate : postDate as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserThreadPostCopyWith<$Res>
    implements $UserThreadPostCopyWith<$Res> {
  factory _$UserThreadPostCopyWith(
          _UserThreadPost value, $Res Function(_UserThreadPost) then) =
      __$UserThreadPostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? userId,
      String? image,
      String? displayName,
      String? statusIcon,
      String? lastSeen,
      String? message,
      List<PostEmojis>? postEmojis,
      String? postDate});
}

/// @nodoc
class __$UserThreadPostCopyWithImpl<$Res>
    extends _$UserThreadPostCopyWithImpl<$Res>
    implements _$UserThreadPostCopyWith<$Res> {
  __$UserThreadPostCopyWithImpl(
      _UserThreadPost _value, $Res Function(_UserThreadPost) _then)
      : super(_value, (v) => _then(v as _UserThreadPost));

  @override
  _UserThreadPost get _value => super._value as _UserThreadPost;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? displayName = freezed,
    Object? statusIcon = freezed,
    Object? lastSeen = freezed,
    Object? message = freezed,
    Object? postEmojis = freezed,
    Object? postDate = freezed,
  }) {
    return _then(_UserThreadPost(
      id: id == freezed ? _value.id : id as int?,
      userId: userId == freezed ? _value.userId : userId as String?,
      image: image == freezed ? _value.image : image as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      statusIcon:
          statusIcon == freezed ? _value.statusIcon : statusIcon as String?,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as String?,
      message: message == freezed ? _value.message : message as String?,
      postEmojis: postEmojis == freezed
          ? _value.postEmojis
          : postEmojis as List<PostEmojis>?,
      postDate: postDate == freezed ? _value.postDate : postDate as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserThreadPost implements _UserThreadPost {
  _$_UserThreadPost(
      {required this.id,
      required this.userId,
      required this.image,
      required this.displayName,
      required this.statusIcon,
      required this.lastSeen,
      required this.message,
      this.postEmojis,
      required this.postDate});

  factory _$_UserThreadPost.fromJson(Map<String, dynamic> json) =>
      _$_$_UserThreadPostFromJson(json);

  @override
  final int? id;
  @override
  final String? userId;
  @override
  final String? image;
  @override
  final String? displayName;
  @override
  final String? statusIcon;
  @override
  final String? lastSeen;
  @override
  final String? message;
  @override
  final List<PostEmojis>? postEmojis;
  @override
  final String? postDate;

  @override
  String toString() {
    return 'UserThreadPost(id: $id, userId: $userId, image: $image, displayName: $displayName, statusIcon: $statusIcon, lastSeen: $lastSeen, message: $message, postEmojis: $postEmojis, postDate: $postDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserThreadPost &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.statusIcon, statusIcon) ||
                const DeepCollectionEquality()
                    .equals(other.statusIcon, statusIcon)) &&
            (identical(other.lastSeen, lastSeen) ||
                const DeepCollectionEquality()
                    .equals(other.lastSeen, lastSeen)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.postEmojis, postEmojis) ||
                const DeepCollectionEquality()
                    .equals(other.postEmojis, postEmojis)) &&
            (identical(other.postDate, postDate) ||
                const DeepCollectionEquality()
                    .equals(other.postDate, postDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(statusIcon) ^
      const DeepCollectionEquality().hash(lastSeen) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(postEmojis) ^
      const DeepCollectionEquality().hash(postDate);

  @JsonKey(ignore: true)
  @override
  _$UserThreadPostCopyWith<_UserThreadPost> get copyWith =>
      __$UserThreadPostCopyWithImpl<_UserThreadPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserThreadPostToJson(this);
  }
}

abstract class _UserThreadPost implements UserThreadPost {
  factory _UserThreadPost(
      {required int? id,
      required String? userId,
      required String? image,
      required String? displayName,
      required String? statusIcon,
      required String? lastSeen,
      required String? message,
      List<PostEmojis>? postEmojis,
      required String? postDate}) = _$_UserThreadPost;

  factory _UserThreadPost.fromJson(Map<String, dynamic> json) =
      _$_UserThreadPost.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get statusIcon => throw _privateConstructorUsedError;
  @override
  String? get lastSeen => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  List<PostEmojis>? get postEmojis => throw _privateConstructorUsedError;
  @override
  String? get postDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserThreadPostCopyWith<_UserThreadPost> get copyWith =>
      throw _privateConstructorUsedError;
}

PostEmojis _$PostEmojisFromJson(Map<String, dynamic> json) {
  return _PostEmojis.fromJson(json);
}

/// @nodoc
class _$PostEmojisTearOff {
  const _$PostEmojisTearOff();

  _PostEmojis call(
      {required int? id,
      required String? postEmoji,
      required int? postEmojiCount,
      required bool? hasReacted}) {
    return _PostEmojis(
      id: id,
      postEmoji: postEmoji,
      postEmojiCount: postEmojiCount,
      hasReacted: hasReacted,
    );
  }

  PostEmojis fromJson(Map<String, Object> json) {
    return PostEmojis.fromJson(json);
  }
}

/// @nodoc
const $PostEmojis = _$PostEmojisTearOff();

/// @nodoc
mixin _$PostEmojis {
  int? get id => throw _privateConstructorUsedError;
  String? get postEmoji => throw _privateConstructorUsedError;
  int? get postEmojiCount => throw _privateConstructorUsedError;
  bool? get hasReacted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostEmojisCopyWith<PostEmojis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEmojisCopyWith<$Res> {
  factory $PostEmojisCopyWith(
          PostEmojis value, $Res Function(PostEmojis) then) =
      _$PostEmojisCopyWithImpl<$Res>;
  $Res call(
      {int? id, String? postEmoji, int? postEmojiCount, bool? hasReacted});
}

/// @nodoc
class _$PostEmojisCopyWithImpl<$Res> implements $PostEmojisCopyWith<$Res> {
  _$PostEmojisCopyWithImpl(this._value, this._then);

  final PostEmojis _value;

  final $Res Function(PostEmojis) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postEmoji = freezed,
    Object? postEmojiCount = freezed,
    Object? hasReacted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      postEmoji: postEmoji == freezed ? _value.postEmoji : postEmoji as String?,
      postEmojiCount: postEmojiCount == freezed
          ? _value.postEmojiCount
          : postEmojiCount as int?,
      hasReacted:
          hasReacted == freezed ? _value.hasReacted : hasReacted as bool?,
    ));
  }
}

/// @nodoc
abstract class _$PostEmojisCopyWith<$Res> implements $PostEmojisCopyWith<$Res> {
  factory _$PostEmojisCopyWith(
          _PostEmojis value, $Res Function(_PostEmojis) then) =
      __$PostEmojisCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id, String? postEmoji, int? postEmojiCount, bool? hasReacted});
}

/// @nodoc
class __$PostEmojisCopyWithImpl<$Res> extends _$PostEmojisCopyWithImpl<$Res>
    implements _$PostEmojisCopyWith<$Res> {
  __$PostEmojisCopyWithImpl(
      _PostEmojis _value, $Res Function(_PostEmojis) _then)
      : super(_value, (v) => _then(v as _PostEmojis));

  @override
  _PostEmojis get _value => super._value as _PostEmojis;

  @override
  $Res call({
    Object? id = freezed,
    Object? postEmoji = freezed,
    Object? postEmojiCount = freezed,
    Object? hasReacted = freezed,
  }) {
    return _then(_PostEmojis(
      id: id == freezed ? _value.id : id as int?,
      postEmoji: postEmoji == freezed ? _value.postEmoji : postEmoji as String?,
      postEmojiCount: postEmojiCount == freezed
          ? _value.postEmojiCount
          : postEmojiCount as int?,
      hasReacted:
          hasReacted == freezed ? _value.hasReacted : hasReacted as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostEmojis implements _PostEmojis {
  _$_PostEmojis(
      {required this.id,
      required this.postEmoji,
      required this.postEmojiCount,
      required this.hasReacted});

  factory _$_PostEmojis.fromJson(Map<String, dynamic> json) =>
      _$_$_PostEmojisFromJson(json);

  @override
  final int? id;
  @override
  final String? postEmoji;
  @override
  final int? postEmojiCount;
  @override
  final bool? hasReacted;

  @override
  String toString() {
    return 'PostEmojis(id: $id, postEmoji: $postEmoji, postEmojiCount: $postEmojiCount, hasReacted: $hasReacted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostEmojis &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.postEmoji, postEmoji) ||
                const DeepCollectionEquality()
                    .equals(other.postEmoji, postEmoji)) &&
            (identical(other.postEmojiCount, postEmojiCount) ||
                const DeepCollectionEquality()
                    .equals(other.postEmojiCount, postEmojiCount)) &&
            (identical(other.hasReacted, hasReacted) ||
                const DeepCollectionEquality()
                    .equals(other.hasReacted, hasReacted)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(postEmoji) ^
      const DeepCollectionEquality().hash(postEmojiCount) ^
      const DeepCollectionEquality().hash(hasReacted);

  @JsonKey(ignore: true)
  @override
  _$PostEmojisCopyWith<_PostEmojis> get copyWith =>
      __$PostEmojisCopyWithImpl<_PostEmojis>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostEmojisToJson(this);
  }
}

abstract class _PostEmojis implements PostEmojis {
  factory _PostEmojis(
      {required int? id,
      required String? postEmoji,
      required int? postEmojiCount,
      required bool? hasReacted}) = _$_PostEmojis;

  factory _PostEmojis.fromJson(Map<String, dynamic> json) =
      _$_PostEmojis.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get postEmoji => throw _privateConstructorUsedError;
  @override
  int? get postEmojiCount => throw _privateConstructorUsedError;
  @override
  bool? get hasReacted => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostEmojisCopyWith<_PostEmojis> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPost _$UserPostFromJson(Map<String, dynamic> json) {
  return _UserPost.fromJson(json);
}

/// @nodoc
class _$UserPostTearOff {
  const _$UserPostTearOff();

  _UserPost call(
      {required int? id,
      required String? userId,
      required String? displayName,
      required String? userImage,
      required String? message,
      required String? statusIcon,
      required String? lastSeen,
      List<PostEmojis>? postEmojis,
      List<UserThreadPost>? userThreadPosts,
      required String? channelName,
      required String? channelType,
      required String? postDate}) {
    return _UserPost(
      id: id,
      userId: userId,
      displayName: displayName,
      userImage: userImage,
      message: message,
      statusIcon: statusIcon,
      lastSeen: lastSeen,
      postEmojis: postEmojis,
      userThreadPosts: userThreadPosts,
      channelName: channelName,
      channelType: channelType,
      postDate: postDate,
    );
  }

  UserPost fromJson(Map<String, Object> json) {
    return UserPost.fromJson(json);
  }
}

/// @nodoc
const $UserPost = _$UserPostTearOff();

/// @nodoc
mixin _$UserPost {
  int? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get statusIcon => throw _privateConstructorUsedError;
  String? get lastSeen => throw _privateConstructorUsedError;
  List<PostEmojis>? get postEmojis => throw _privateConstructorUsedError;
  List<UserThreadPost>? get userThreadPosts =>
      throw _privateConstructorUsedError;
  String? get channelName => throw _privateConstructorUsedError;
  String? get channelType => throw _privateConstructorUsedError;
  String? get postDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPostCopyWith<UserPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostCopyWith<$Res> {
  factory $UserPostCopyWith(UserPost value, $Res Function(UserPost) then) =
      _$UserPostCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? userId,
      String? displayName,
      String? userImage,
      String? message,
      String? statusIcon,
      String? lastSeen,
      List<PostEmojis>? postEmojis,
      List<UserThreadPost>? userThreadPosts,
      String? channelName,
      String? channelType,
      String? postDate});
}

/// @nodoc
class _$UserPostCopyWithImpl<$Res> implements $UserPostCopyWith<$Res> {
  _$UserPostCopyWithImpl(this._value, this._then);

  final UserPost _value;

  final $Res Function(UserPost) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? displayName = freezed,
    Object? userImage = freezed,
    Object? message = freezed,
    Object? statusIcon = freezed,
    Object? lastSeen = freezed,
    Object? postEmojis = freezed,
    Object? userThreadPosts = freezed,
    Object? channelName = freezed,
    Object? channelType = freezed,
    Object? postDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      userId: userId == freezed ? _value.userId : userId as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      userImage: userImage == freezed ? _value.userImage : userImage as String?,
      message: message == freezed ? _value.message : message as String?,
      statusIcon:
          statusIcon == freezed ? _value.statusIcon : statusIcon as String?,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as String?,
      postEmojis: postEmojis == freezed
          ? _value.postEmojis
          : postEmojis as List<PostEmojis>?,
      userThreadPosts: userThreadPosts == freezed
          ? _value.userThreadPosts
          : userThreadPosts as List<UserThreadPost>?,
      channelName:
          channelName == freezed ? _value.channelName : channelName as String?,
      channelType:
          channelType == freezed ? _value.channelType : channelType as String?,
      postDate: postDate == freezed ? _value.postDate : postDate as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserPostCopyWith<$Res> implements $UserPostCopyWith<$Res> {
  factory _$UserPostCopyWith(_UserPost value, $Res Function(_UserPost) then) =
      __$UserPostCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? userId,
      String? displayName,
      String? userImage,
      String? message,
      String? statusIcon,
      String? lastSeen,
      List<PostEmojis>? postEmojis,
      List<UserThreadPost>? userThreadPosts,
      String? channelName,
      String? channelType,
      String? postDate});
}

/// @nodoc
class __$UserPostCopyWithImpl<$Res> extends _$UserPostCopyWithImpl<$Res>
    implements _$UserPostCopyWith<$Res> {
  __$UserPostCopyWithImpl(_UserPost _value, $Res Function(_UserPost) _then)
      : super(_value, (v) => _then(v as _UserPost));

  @override
  _UserPost get _value => super._value as _UserPost;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? displayName = freezed,
    Object? userImage = freezed,
    Object? message = freezed,
    Object? statusIcon = freezed,
    Object? lastSeen = freezed,
    Object? postEmojis = freezed,
    Object? userThreadPosts = freezed,
    Object? channelName = freezed,
    Object? channelType = freezed,
    Object? postDate = freezed,
  }) {
    return _then(_UserPost(
      id: id == freezed ? _value.id : id as int?,
      userId: userId == freezed ? _value.userId : userId as String?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      userImage: userImage == freezed ? _value.userImage : userImage as String?,
      message: message == freezed ? _value.message : message as String?,
      statusIcon:
          statusIcon == freezed ? _value.statusIcon : statusIcon as String?,
      lastSeen: lastSeen == freezed ? _value.lastSeen : lastSeen as String?,
      postEmojis: postEmojis == freezed
          ? _value.postEmojis
          : postEmojis as List<PostEmojis>?,
      userThreadPosts: userThreadPosts == freezed
          ? _value.userThreadPosts
          : userThreadPosts as List<UserThreadPost>?,
      channelName:
          channelName == freezed ? _value.channelName : channelName as String?,
      channelType:
          channelType == freezed ? _value.channelType : channelType as String?,
      postDate: postDate == freezed ? _value.postDate : postDate as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPost implements _UserPost {
  _$_UserPost(
      {required this.id,
      required this.userId,
      required this.displayName,
      required this.userImage,
      required this.message,
      required this.statusIcon,
      required this.lastSeen,
      this.postEmojis,
      this.userThreadPosts,
      required this.channelName,
      required this.channelType,
      required this.postDate});

  factory _$_UserPost.fromJson(Map<String, dynamic> json) =>
      _$_$_UserPostFromJson(json);

  @override
  final int? id;
  @override
  final String? userId;
  @override
  final String? displayName;
  @override
  final String? userImage;
  @override
  final String? message;
  @override
  final String? statusIcon;
  @override
  final String? lastSeen;
  @override
  final List<PostEmojis>? postEmojis;
  @override
  final List<UserThreadPost>? userThreadPosts;
  @override
  final String? channelName;
  @override
  final String? channelType;
  @override
  final String? postDate;

  @override
  String toString() {
    return 'UserPost(id: $id, userId: $userId, displayName: $displayName, userImage: $userImage, message: $message, statusIcon: $statusIcon, lastSeen: $lastSeen, postEmojis: $postEmojis, userThreadPosts: $userThreadPosts, channelName: $channelName, channelType: $channelType, postDate: $postDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserPost &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.userImage, userImage) ||
                const DeepCollectionEquality()
                    .equals(other.userImage, userImage)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.statusIcon, statusIcon) ||
                const DeepCollectionEquality()
                    .equals(other.statusIcon, statusIcon)) &&
            (identical(other.lastSeen, lastSeen) ||
                const DeepCollectionEquality()
                    .equals(other.lastSeen, lastSeen)) &&
            (identical(other.postEmojis, postEmojis) ||
                const DeepCollectionEquality()
                    .equals(other.postEmojis, postEmojis)) &&
            (identical(other.userThreadPosts, userThreadPosts) ||
                const DeepCollectionEquality()
                    .equals(other.userThreadPosts, userThreadPosts)) &&
            (identical(other.channelName, channelName) ||
                const DeepCollectionEquality()
                    .equals(other.channelName, channelName)) &&
            (identical(other.channelType, channelType) ||
                const DeepCollectionEquality()
                    .equals(other.channelType, channelType)) &&
            (identical(other.postDate, postDate) ||
                const DeepCollectionEquality()
                    .equals(other.postDate, postDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(userImage) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(statusIcon) ^
      const DeepCollectionEquality().hash(lastSeen) ^
      const DeepCollectionEquality().hash(postEmojis) ^
      const DeepCollectionEquality().hash(userThreadPosts) ^
      const DeepCollectionEquality().hash(channelName) ^
      const DeepCollectionEquality().hash(channelType) ^
      const DeepCollectionEquality().hash(postDate);

  @JsonKey(ignore: true)
  @override
  _$UserPostCopyWith<_UserPost> get copyWith =>
      __$UserPostCopyWithImpl<_UserPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserPostToJson(this);
  }
}

abstract class _UserPost implements UserPost {
  factory _UserPost(
      {required int? id,
      required String? userId,
      required String? displayName,
      required String? userImage,
      required String? message,
      required String? statusIcon,
      required String? lastSeen,
      List<PostEmojis>? postEmojis,
      List<UserThreadPost>? userThreadPosts,
      required String? channelName,
      required String? channelType,
      required String? postDate}) = _$_UserPost;

  factory _UserPost.fromJson(Map<String, dynamic> json) = _$_UserPost.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get userImage => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get statusIcon => throw _privateConstructorUsedError;
  @override
  String? get lastSeen => throw _privateConstructorUsedError;
  @override
  List<PostEmojis>? get postEmojis => throw _privateConstructorUsedError;
  @override
  List<UserThreadPost>? get userThreadPosts =>
      throw _privateConstructorUsedError;
  @override
  String? get channelName => throw _privateConstructorUsedError;
  @override
  String? get channelType => throw _privateConstructorUsedError;
  @override
  String? get postDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserPostCopyWith<_UserPost> get copyWith =>
      throw _privateConstructorUsedError;
}

NewUser _$NewUserFromJson(Map<String, dynamic> json) {
  return _NewUser.fromJson(json);
}

/// @nodoc
class _$NewUserTearOff {
  const _$NewUserTearOff();

  _NewUser call({required int? id, required String? username}) {
    return _NewUser(
      id: id,
      username: username,
    );
  }

  NewUser fromJson(Map<String, Object> json) {
    return NewUser.fromJson(json);
  }
}

/// @nodoc
const $NewUser = _$NewUserTearOff();

/// @nodoc
mixin _$NewUser {
  int? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewUserCopyWith<NewUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewUserCopyWith<$Res> {
  factory $NewUserCopyWith(NewUser value, $Res Function(NewUser) then) =
      _$NewUserCopyWithImpl<$Res>;
  $Res call({int? id, String? username});
}

/// @nodoc
class _$NewUserCopyWithImpl<$Res> implements $NewUserCopyWith<$Res> {
  _$NewUserCopyWithImpl(this._value, this._then);

  final NewUser _value;

  final $Res Function(NewUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      username: username == freezed ? _value.username : username as String?,
    ));
  }
}

/// @nodoc
abstract class _$NewUserCopyWith<$Res> implements $NewUserCopyWith<$Res> {
  factory _$NewUserCopyWith(_NewUser value, $Res Function(_NewUser) then) =
      __$NewUserCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? username});
}

/// @nodoc
class __$NewUserCopyWithImpl<$Res> extends _$NewUserCopyWithImpl<$Res>
    implements _$NewUserCopyWith<$Res> {
  __$NewUserCopyWithImpl(_NewUser _value, $Res Function(_NewUser) _then)
      : super(_value, (v) => _then(v as _NewUser));

  @override
  _NewUser get _value => super._value as _NewUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
  }) {
    return _then(_NewUser(
      id: id == freezed ? _value.id : id as int?,
      username: username == freezed ? _value.username : username as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewUser implements _NewUser {
  _$_NewUser({required this.id, required this.username});

  factory _$_NewUser.fromJson(Map<String, dynamic> json) =>
      _$_$_NewUserFromJson(json);

  @override
  final int? id;
  @override
  final String? username;

  @override
  String toString() {
    return 'NewUser(id: $id, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username);

  @JsonKey(ignore: true)
  @override
  _$NewUserCopyWith<_NewUser> get copyWith =>
      __$NewUserCopyWithImpl<_NewUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NewUserToJson(this);
  }
}

abstract class _NewUser implements NewUser {
  factory _NewUser({required int? id, required String? username}) = _$_NewUser;

  factory _NewUser.fromJson(Map<String, dynamic> json) = _$_NewUser.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewUserCopyWith<_NewUser> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSearch _$UserSearchFromJson(Map<String, dynamic> json) {
  return _UserSearch.fromJson(json);
}

/// @nodoc
class _$UserSearchTearOff {
  const _$UserSearchTearOff();

  _UserSearch call(
      {required int? id,
      required String? bio,
      required bool? deleted,
      required DateTime? deletedAt,
      required String? displayName,
      required String? email,
      required dynamic files,
      required String? firstName,
      required String? imageUrl,
      required String? joinedAt,
      required String? lastName,
      required String? orgId,
      required String? phone,
      required String? presence,
      required String? pronouns,
      required String? role,
      required String? settings,
      required dynamic socials,
      required String? status,
      required String? timeZone,
      required String? userName}) {
    return _UserSearch(
      id: id,
      bio: bio,
      deleted: deleted,
      deletedAt: deletedAt,
      displayName: displayName,
      email: email,
      files: files,
      firstName: firstName,
      imageUrl: imageUrl,
      joinedAt: joinedAt,
      lastName: lastName,
      orgId: orgId,
      phone: phone,
      presence: presence,
      pronouns: pronouns,
      role: role,
      settings: settings,
      socials: socials,
      status: status,
      timeZone: timeZone,
      userName: userName,
    );
  }

  UserSearch fromJson(Map<String, Object> json) {
    return UserSearch.fromJson(json);
  }
}

/// @nodoc
const $UserSearch = _$UserSearchTearOff();

/// @nodoc
mixin _$UserSearch {
  int? get id => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  bool? get deleted => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  dynamic get files => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get joinedAt => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get orgId => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get presence => throw _privateConstructorUsedError;
  String? get pronouns => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get settings => throw _privateConstructorUsedError;
  dynamic get socials => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get timeZone => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSearchCopyWith<UserSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchCopyWith<$Res> {
  factory $UserSearchCopyWith(
          UserSearch value, $Res Function(UserSearch) then) =
      _$UserSearchCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? bio,
      bool? deleted,
      DateTime? deletedAt,
      String? displayName,
      String? email,
      dynamic files,
      String? firstName,
      String? imageUrl,
      String? joinedAt,
      String? lastName,
      String? orgId,
      String? phone,
      String? presence,
      String? pronouns,
      String? role,
      String? settings,
      dynamic socials,
      String? status,
      String? timeZone,
      String? userName});
}

/// @nodoc
class _$UserSearchCopyWithImpl<$Res> implements $UserSearchCopyWith<$Res> {
  _$UserSearchCopyWithImpl(this._value, this._then);

  final UserSearch _value;

  final $Res Function(UserSearch) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bio = freezed,
    Object? deleted = freezed,
    Object? deletedAt = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? files = freezed,
    Object? firstName = freezed,
    Object? imageUrl = freezed,
    Object? joinedAt = freezed,
    Object? lastName = freezed,
    Object? orgId = freezed,
    Object? phone = freezed,
    Object? presence = freezed,
    Object? pronouns = freezed,
    Object? role = freezed,
    Object? settings = freezed,
    Object? socials = freezed,
    Object? status = freezed,
    Object? timeZone = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      bio: bio == freezed ? _value.bio : bio as String?,
      deleted: deleted == freezed ? _value.deleted : deleted as bool?,
      deletedAt:
          deletedAt == freezed ? _value.deletedAt : deletedAt as DateTime?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      email: email == freezed ? _value.email : email as String?,
      files: files == freezed ? _value.files : files as dynamic,
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String?,
      joinedAt: joinedAt == freezed ? _value.joinedAt : joinedAt as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      orgId: orgId == freezed ? _value.orgId : orgId as String?,
      phone: phone == freezed ? _value.phone : phone as String?,
      presence: presence == freezed ? _value.presence : presence as String?,
      pronouns: pronouns == freezed ? _value.pronouns : pronouns as String?,
      role: role == freezed ? _value.role : role as String?,
      settings: settings == freezed ? _value.settings : settings as String?,
      socials: socials == freezed ? _value.socials : socials as dynamic,
      status: status == freezed ? _value.status : status as String?,
      timeZone: timeZone == freezed ? _value.timeZone : timeZone as String?,
      userName: userName == freezed ? _value.userName : userName as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserSearchCopyWith<$Res> implements $UserSearchCopyWith<$Res> {
  factory _$UserSearchCopyWith(
          _UserSearch value, $Res Function(_UserSearch) then) =
      __$UserSearchCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? bio,
      bool? deleted,
      DateTime? deletedAt,
      String? displayName,
      String? email,
      dynamic files,
      String? firstName,
      String? imageUrl,
      String? joinedAt,
      String? lastName,
      String? orgId,
      String? phone,
      String? presence,
      String? pronouns,
      String? role,
      String? settings,
      dynamic socials,
      String? status,
      String? timeZone,
      String? userName});
}

/// @nodoc
class __$UserSearchCopyWithImpl<$Res> extends _$UserSearchCopyWithImpl<$Res>
    implements _$UserSearchCopyWith<$Res> {
  __$UserSearchCopyWithImpl(
      _UserSearch _value, $Res Function(_UserSearch) _then)
      : super(_value, (v) => _then(v as _UserSearch));

  @override
  _UserSearch get _value => super._value as _UserSearch;

  @override
  $Res call({
    Object? id = freezed,
    Object? bio = freezed,
    Object? deleted = freezed,
    Object? deletedAt = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? files = freezed,
    Object? firstName = freezed,
    Object? imageUrl = freezed,
    Object? joinedAt = freezed,
    Object? lastName = freezed,
    Object? orgId = freezed,
    Object? phone = freezed,
    Object? presence = freezed,
    Object? pronouns = freezed,
    Object? role = freezed,
    Object? settings = freezed,
    Object? socials = freezed,
    Object? status = freezed,
    Object? timeZone = freezed,
    Object? userName = freezed,
  }) {
    return _then(_UserSearch(
      id: id == freezed ? _value.id : id as int?,
      bio: bio == freezed ? _value.bio : bio as String?,
      deleted: deleted == freezed ? _value.deleted : deleted as bool?,
      deletedAt:
          deletedAt == freezed ? _value.deletedAt : deletedAt as DateTime?,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String?,
      email: email == freezed ? _value.email : email as String?,
      files: files == freezed ? _value.files : files as dynamic,
      firstName: firstName == freezed ? _value.firstName : firstName as String?,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String?,
      joinedAt: joinedAt == freezed ? _value.joinedAt : joinedAt as String?,
      lastName: lastName == freezed ? _value.lastName : lastName as String?,
      orgId: orgId == freezed ? _value.orgId : orgId as String?,
      phone: phone == freezed ? _value.phone : phone as String?,
      presence: presence == freezed ? _value.presence : presence as String?,
      pronouns: pronouns == freezed ? _value.pronouns : pronouns as String?,
      role: role == freezed ? _value.role : role as String?,
      settings: settings == freezed ? _value.settings : settings as String?,
      socials: socials == freezed ? _value.socials : socials as dynamic,
      status: status == freezed ? _value.status : status as String?,
      timeZone: timeZone == freezed ? _value.timeZone : timeZone as String?,
      userName: userName == freezed ? _value.userName : userName as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSearch implements _UserSearch {
  _$_UserSearch(
      {required this.id,
      required this.bio,
      required this.deleted,
      required this.deletedAt,
      required this.displayName,
      required this.email,
      required this.files,
      required this.firstName,
      required this.imageUrl,
      required this.joinedAt,
      required this.lastName,
      required this.orgId,
      required this.phone,
      required this.presence,
      required this.pronouns,
      required this.role,
      required this.settings,
      required this.socials,
      required this.status,
      required this.timeZone,
      required this.userName});

  factory _$_UserSearch.fromJson(Map<String, dynamic> json) =>
      _$_$_UserSearchFromJson(json);

  @override
  final int? id;
  @override
  final String? bio;
  @override
  final bool? deleted;
  @override
  final DateTime? deletedAt;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final dynamic files;
  @override
  final String? firstName;
  @override
  final String? imageUrl;
  @override
  final String? joinedAt;
  @override
  final String? lastName;
  @override
  final String? orgId;
  @override
  final String? phone;
  @override
  final String? presence;
  @override
  final String? pronouns;
  @override
  final String? role;
  @override
  final String? settings;
  @override
  final dynamic socials;
  @override
  final String? status;
  @override
  final String? timeZone;
  @override
  final String? userName;

  @override
  String toString() {
    return 'UserSearch(id: $id, bio: $bio, deleted: $deleted, deletedAt: $deletedAt, displayName: $displayName, email: $email, files: $files, firstName: $firstName, imageUrl: $imageUrl, joinedAt: $joinedAt, lastName: $lastName, orgId: $orgId, phone: $phone, presence: $presence, pronouns: $pronouns, role: $role, settings: $settings, socials: $socials, status: $status, timeZone: $timeZone, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserSearch &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)) &&
            (identical(other.deleted, deleted) ||
                const DeepCollectionEquality()
                    .equals(other.deleted, deleted)) &&
            (identical(other.deletedAt, deletedAt) ||
                const DeepCollectionEquality()
                    .equals(other.deletedAt, deletedAt)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.joinedAt, joinedAt) ||
                const DeepCollectionEquality()
                    .equals(other.joinedAt, joinedAt)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.orgId, orgId) ||
                const DeepCollectionEquality().equals(other.orgId, orgId)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.presence, presence) ||
                const DeepCollectionEquality()
                    .equals(other.presence, presence)) &&
            (identical(other.pronouns, pronouns) ||
                const DeepCollectionEquality()
                    .equals(other.pronouns, pronouns)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.socials, socials) ||
                const DeepCollectionEquality()
                    .equals(other.socials, socials)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.timeZone, timeZone) ||
                const DeepCollectionEquality()
                    .equals(other.timeZone, timeZone)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(bio) ^
      const DeepCollectionEquality().hash(deleted) ^
      const DeepCollectionEquality().hash(deletedAt) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(joinedAt) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(orgId) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(presence) ^
      const DeepCollectionEquality().hash(pronouns) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(socials) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(timeZone) ^
      const DeepCollectionEquality().hash(userName);

  @JsonKey(ignore: true)
  @override
  _$UserSearchCopyWith<_UserSearch> get copyWith =>
      __$UserSearchCopyWithImpl<_UserSearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserSearchToJson(this);
  }
}

abstract class _UserSearch implements UserSearch {
  factory _UserSearch(
      {required int? id,
      required String? bio,
      required bool? deleted,
      required DateTime? deletedAt,
      required String? displayName,
      required String? email,
      required dynamic files,
      required String? firstName,
      required String? imageUrl,
      required String? joinedAt,
      required String? lastName,
      required String? orgId,
      required String? phone,
      required String? presence,
      required String? pronouns,
      required String? role,
      required String? settings,
      required dynamic socials,
      required String? status,
      required String? timeZone,
      required String? userName}) = _$_UserSearch;

  factory _UserSearch.fromJson(Map<String, dynamic> json) =
      _$_UserSearch.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get bio => throw _privateConstructorUsedError;
  @override
  bool? get deleted => throw _privateConstructorUsedError;
  @override
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  dynamic get files => throw _privateConstructorUsedError;
  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get joinedAt => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  String? get orgId => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get presence => throw _privateConstructorUsedError;
  @override
  String? get pronouns => throw _privateConstructorUsedError;
  @override
  String? get role => throw _privateConstructorUsedError;
  @override
  String? get settings => throw _privateConstructorUsedError;
  @override
  dynamic get socials => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  String? get timeZone => throw _privateConstructorUsedError;
  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserSearchCopyWith<_UserSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

MainMembers _$MainMembersFromJson(Map<String, dynamic> json) {
  return _MainMembeers.fromJson(json);
}

/// @nodoc
class _$MainMembersTearOff {
  const _$MainMembersTearOff();

  _MainMembeers call(
      {required int? id, required String? name, List<UserSearch>? data}) {
    return _MainMembeers(
      id: id,
      name: name,
      data: data,
    );
  }

  MainMembers fromJson(Map<String, Object> json) {
    return MainMembers.fromJson(json);
  }
}

/// @nodoc
const $MainMembers = _$MainMembersTearOff();

/// @nodoc
mixin _$MainMembers {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<UserSearch>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainMembersCopyWith<MainMembers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMembersCopyWith<$Res> {
  factory $MainMembersCopyWith(
          MainMembers value, $Res Function(MainMembers) then) =
      _$MainMembersCopyWithImpl<$Res>;
  $Res call({int? id, String? name, List<UserSearch>? data});
}

/// @nodoc
class _$MainMembersCopyWithImpl<$Res> implements $MainMembersCopyWith<$Res> {
  _$MainMembersCopyWithImpl(this._value, this._then);

  final MainMembers _value;

  final $Res Function(MainMembers) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int?,
      name: name == freezed ? _value.name : name as String?,
      data: data == freezed ? _value.data : data as List<UserSearch>?,
    ));
  }
}

/// @nodoc
abstract class _$MainMembeersCopyWith<$Res>
    implements $MainMembersCopyWith<$Res> {
  factory _$MainMembeersCopyWith(
          _MainMembeers value, $Res Function(_MainMembeers) then) =
      __$MainMembeersCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, List<UserSearch>? data});
}

/// @nodoc
class __$MainMembeersCopyWithImpl<$Res> extends _$MainMembersCopyWithImpl<$Res>
    implements _$MainMembeersCopyWith<$Res> {
  __$MainMembeersCopyWithImpl(
      _MainMembeers _value, $Res Function(_MainMembeers) _then)
      : super(_value, (v) => _then(v as _MainMembeers));

  @override
  _MainMembeers get _value => super._value as _MainMembeers;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? data = freezed,
  }) {
    return _then(_MainMembeers(
      id: id == freezed ? _value.id : id as int?,
      name: name == freezed ? _value.name : name as String?,
      data: data == freezed ? _value.data : data as List<UserSearch>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MainMembeers implements _MainMembeers {
  _$_MainMembeers({required this.id, required this.name, this.data});

  factory _$_MainMembeers.fromJson(Map<String, dynamic> json) =>
      _$_$_MainMembeersFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final List<UserSearch>? data;

  @override
  String toString() {
    return 'MainMembers(id: $id, name: $name, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MainMembeers &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$MainMembeersCopyWith<_MainMembeers> get copyWith =>
      __$MainMembeersCopyWithImpl<_MainMembeers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MainMembeersToJson(this);
  }
}

abstract class _MainMembeers implements MainMembers {
  factory _MainMembeers(
      {required int? id,
      required String? name,
      List<UserSearch>? data}) = _$_MainMembeers;

  factory _MainMembeers.fromJson(Map<String, dynamic> json) =
      _$_MainMembeers.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  List<UserSearch>? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MainMembeersCopyWith<_MainMembeers> get copyWith =>
      throw _privateConstructorUsedError;
}

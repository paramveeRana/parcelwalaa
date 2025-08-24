// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BottomNavItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  /// Create a copy of BottomNavItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomNavItemCopyWith<BottomNavItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavItemCopyWith<$Res> {
  factory $BottomNavItemCopyWith(
    BottomNavItem value,
    $Res Function(BottomNavItem) then,
  ) = _$BottomNavItemCopyWithImpl<$Res, BottomNavItem>;
  @useResult
  $Res call({
    String id,
    String title,
    String iconPath,
    bool isSelected,
    int index,
  });
}

/// @nodoc
class _$BottomNavItemCopyWithImpl<$Res, $Val extends BottomNavItem>
    implements $BottomNavItemCopyWith<$Res> {
  _$BottomNavItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomNavItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? iconPath = null,
    Object? isSelected = null,
    Object? index = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            iconPath:
                null == iconPath
                    ? _value.iconPath
                    : iconPath // ignore: cast_nullable_to_non_nullable
                        as String,
            isSelected:
                null == isSelected
                    ? _value.isSelected
                    : isSelected // ignore: cast_nullable_to_non_nullable
                        as bool,
            index:
                null == index
                    ? _value.index
                    : index // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BottomNavItemImplCopyWith<$Res>
    implements $BottomNavItemCopyWith<$Res> {
  factory _$$BottomNavItemImplCopyWith(
    _$BottomNavItemImpl value,
    $Res Function(_$BottomNavItemImpl) then,
  ) = __$$BottomNavItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String iconPath,
    bool isSelected,
    int index,
  });
}

/// @nodoc
class __$$BottomNavItemImplCopyWithImpl<$Res>
    extends _$BottomNavItemCopyWithImpl<$Res, _$BottomNavItemImpl>
    implements _$$BottomNavItemImplCopyWith<$Res> {
  __$$BottomNavItemImplCopyWithImpl(
    _$BottomNavItemImpl _value,
    $Res Function(_$BottomNavItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BottomNavItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? iconPath = null,
    Object? isSelected = null,
    Object? index = null,
  }) {
    return _then(
      _$BottomNavItemImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        iconPath:
            null == iconPath
                ? _value.iconPath
                : iconPath // ignore: cast_nullable_to_non_nullable
                    as String,
        isSelected:
            null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                    as bool,
        index:
            null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$BottomNavItemImpl implements _BottomNavItem {
  const _$BottomNavItemImpl({
    required this.id,
    required this.title,
    required this.iconPath,
    required this.isSelected,
    required this.index,
  });

  @override
  final String id;
  @override
  final String title;
  @override
  final String iconPath;
  @override
  final bool isSelected;
  @override
  final int index;

  @override
  String toString() {
    return 'BottomNavItem(id: $id, title: $title, iconPath: $iconPath, isSelected: $isSelected, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, iconPath, isSelected, index);

  /// Create a copy of BottomNavItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavItemImplCopyWith<_$BottomNavItemImpl> get copyWith =>
      __$$BottomNavItemImplCopyWithImpl<_$BottomNavItemImpl>(this, _$identity);
}

abstract class _BottomNavItem implements BottomNavItem {
  const factory _BottomNavItem({
    required final String id,
    required final String title,
    required final String iconPath,
    required final bool isSelected,
    required final int index,
  }) = _$BottomNavItemImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String get iconPath;
  @override
  bool get isSelected;
  @override
  int get index;

  /// Create a copy of BottomNavItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomNavItemImplCopyWith<_$BottomNavItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

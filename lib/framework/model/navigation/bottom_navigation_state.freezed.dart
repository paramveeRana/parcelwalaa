// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BottomNavigationState {
  List<BottomNavItem> get navItems => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomNavigationStateCopyWith<BottomNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavigationStateCopyWith<$Res> {
  factory $BottomNavigationStateCopyWith(
    BottomNavigationState value,
    $Res Function(BottomNavigationState) then,
  ) = _$BottomNavigationStateCopyWithImpl<$Res, BottomNavigationState>;
  @useResult
  $Res call({List<BottomNavItem> navItems, int selectedIndex, bool isLoading});
}

/// @nodoc
class _$BottomNavigationStateCopyWithImpl<
  $Res,
  $Val extends BottomNavigationState
>
    implements $BottomNavigationStateCopyWith<$Res> {
  _$BottomNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navItems = null,
    Object? selectedIndex = null,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            navItems:
                null == navItems
                    ? _value.navItems
                    : navItems // ignore: cast_nullable_to_non_nullable
                        as List<BottomNavItem>,
            selectedIndex:
                null == selectedIndex
                    ? _value.selectedIndex
                    : selectedIndex // ignore: cast_nullable_to_non_nullable
                        as int,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BottomNavigationStateImplCopyWith<$Res>
    implements $BottomNavigationStateCopyWith<$Res> {
  factory _$$BottomNavigationStateImplCopyWith(
    _$BottomNavigationStateImpl value,
    $Res Function(_$BottomNavigationStateImpl) then,
  ) = __$$BottomNavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BottomNavItem> navItems, int selectedIndex, bool isLoading});
}

/// @nodoc
class __$$BottomNavigationStateImplCopyWithImpl<$Res>
    extends
        _$BottomNavigationStateCopyWithImpl<$Res, _$BottomNavigationStateImpl>
    implements _$$BottomNavigationStateImplCopyWith<$Res> {
  __$$BottomNavigationStateImplCopyWithImpl(
    _$BottomNavigationStateImpl _value,
    $Res Function(_$BottomNavigationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navItems = null,
    Object? selectedIndex = null,
    Object? isLoading = null,
  }) {
    return _then(
      _$BottomNavigationStateImpl(
        navItems:
            null == navItems
                ? _value._navItems
                : navItems // ignore: cast_nullable_to_non_nullable
                    as List<BottomNavItem>,
        selectedIndex:
            null == selectedIndex
                ? _value.selectedIndex
                : selectedIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$BottomNavigationStateImpl implements _BottomNavigationState {
  const _$BottomNavigationStateImpl({
    required final List<BottomNavItem> navItems,
    required this.selectedIndex,
    required this.isLoading,
  }) : _navItems = navItems;

  final List<BottomNavItem> _navItems;
  @override
  List<BottomNavItem> get navItems {
    if (_navItems is EqualUnmodifiableListView) return _navItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_navItems);
  }

  @override
  final int selectedIndex;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'BottomNavigationState(navItems: $navItems, selectedIndex: $selectedIndex, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavigationStateImpl &&
            const DeepCollectionEquality().equals(other._navItems, _navItems) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_navItems),
    selectedIndex,
    isLoading,
  );

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavigationStateImplCopyWith<_$BottomNavigationStateImpl>
  get copyWith =>
      __$$BottomNavigationStateImplCopyWithImpl<_$BottomNavigationStateImpl>(
        this,
        _$identity,
      );
}

abstract class _BottomNavigationState implements BottomNavigationState {
  const factory _BottomNavigationState({
    required final List<BottomNavItem> navItems,
    required final int selectedIndex,
    required final bool isLoading,
  }) = _$BottomNavigationStateImpl;

  @override
  List<BottomNavItem> get navItems;
  @override
  int get selectedIndex;
  @override
  bool get isLoading;

  /// Create a copy of BottomNavigationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomNavigationStateImplCopyWith<_$BottomNavigationStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

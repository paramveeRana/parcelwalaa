import 'package:flutter/material.dart';

/// Widget extensions for better code readability and performance
extension WidgetExtensions on Widget {
  /// Adds padding to the widget
  Widget padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
      ),
      child: this,
    );
  }

  /// Adds symmetric padding to the widget
  Widget paddingSymmetric({
    double? horizontal,
    double? vertical,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      child: this,
    );
  }

  /// Adds all padding to the widget
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  /// Adds custom EdgeInsets padding to the widget
  Widget paddingCustom(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  /// Centers the widget
  Widget center() {
    return Center(child: this);
  }

  /// Expands the widget
  Widget expand({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// Adds a flexible wrapper
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  /// Adds a hero animation
  Widget hero(String tag) {
    return Hero(tag: tag, child: this);
  }

  /// Adds opacity to the widget
  Widget opacity(double opacity) {
    return Opacity(opacity: opacity, child: this);
  }

  /// Adds a positioned wrapper
  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? width,
    double? height,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      width: width,
      height: height,
      child: this,
    );
  }

  /// Adds a safe area wrapper
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  /// Adds a scroll view wrapper
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollPhysics? physics,
  }) {
    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      physics: physics,
      child: this,
    );
  }
}

/// List extensions for better code readability
extension ListWidgetExtensions on List<Widget> {
  /// Adds padding to all widgets in the list
  List<Widget> padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return map((widget) => widget.padding(
          all: all,
          horizontal: horizontal,
          vertical: vertical,
          top: top,
          bottom: bottom,
          left: left,
          right: right,
        )).toList();
  }

  /// Converts list to Column
  Widget toColumn({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: this,
    );
  }

  /// Converts list to Row
  Widget toRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: this,
    );
  }

  /// Adds spacing between widgets
  List<Widget> withSpacing(double spacing) {
    if (isEmpty) return this;
    
    final spacedList = <Widget>[];
    for (int i = 0; i < length; i++) {
      spacedList.add(this[i]);
      if (i < length - 1) {
        spacedList.add(SizedBox(
          width: spacing,
          height: spacing,
        ));
      }
    }
    return spacedList;
  }
}

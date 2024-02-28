import 'package:flutter/material.dart';

extension IntExtensions on int? {
  int validate({int value = 0}) => this ?? value;

  Widget get height => SizedBox(height: this?.toDouble());
  Widget get width => SizedBox(width: this?.toDouble());

  Duration get microseconds => Duration(microseconds: validate());
  Duration get milliseconds => Duration(milliseconds: validate());
  Duration get seconds => Duration(seconds: validate());
  Duration get minutes => Duration(minutes: validate());
  Duration get hours => Duration(hours: validate());
  Duration get days => Duration(days: validate());
}

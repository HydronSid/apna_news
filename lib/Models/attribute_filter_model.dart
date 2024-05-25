import 'package:get/get.dart';

class Attribute {
  final String? attributeName;
  final String? attributecode;
  final List<FilterModel>? attributeValues;

  Attribute({this.attributeName, this.attributeValues, this.attributecode});
}

class FilterModel {
  final String? value;
  final String? code;
  RxBool? isSelected;

  FilterModel({this.value, this.isSelected, required this.code});
}

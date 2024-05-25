class Attribute {
  final String? attributeName;
  final String? attributecode;
  final List<FilterModel>? attributeValues;

  Attribute({this.attributeName, this.attributeValues, this.attributecode});
}

class FilterModel {
  final String? value;
  final String? code;
  bool isSelected;

  set changeIsSelected(bool val) {
    isSelected = val;
  }

  FilterModel({this.value, this.isSelected = false, required this.code});
}

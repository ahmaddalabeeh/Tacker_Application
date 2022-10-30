import 'package:api/data/models/enum/category_enum.dart';
import 'package:api/utilities/extensions/string_extension.dart';

class ExpenseModel {
  int? _id;
  int? _timestamp;
  double? _amount;
  CategoryEnum? _categoryType;

  ExpenseModel({
    int? id,
    int? timestamp,
    double? amount,
    CategoryEnum? categoryType,
  }) {
    if (id != null) {
      _id = id;
    }
    if (timestamp != null) {
      _timestamp = timestamp;
    }
    if (amount != null) {
      _amount = amount;
    }
    if (categoryType != null) {
      _categoryType = categoryType;
    }
  }

  int? get id => _id;

  int? get timestamp => _timestamp;

  double? get amount => _amount;

  CategoryEnum? get categoryType => _categoryType;

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _timestamp = json['timestamp'];
    _amount = json['amount'];
    _categoryType = (json['categoryType'] as String).toCategoryType();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['timestamp'] = _timestamp;
    data['amount'] = _amount;
    data['categoryType'] = _categoryType?.name;
    return data;
  }
}

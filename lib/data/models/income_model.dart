class IncomeModel {
  int? _id;
  int? _timestamp;
  double? _amount;

  IncomeModel({int? id, int? timestamp, double? amount}) {
    if (id != null) {
      _id = id;
    }
    if (timestamp != null) {
      _timestamp = timestamp;
    }
    if (amount != null) {
      _amount = amount;
    }
  }

  int? get id => _id;

  int? get timestamp => _timestamp;

  double? get amount => _amount;

  IncomeModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _timestamp = json['timestamp'];
    _amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['timestamp'] = _timestamp;
    data['amount'] = _amount;
    return data;
  }
}

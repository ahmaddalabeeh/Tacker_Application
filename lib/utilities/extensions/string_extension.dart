import '../../data/models/enum/category_enum.dart';

extension StringExtension on String {
  CategoryEnum toCategoryType() {
    switch (this) {
      case "food":
        return CategoryEnum.food;
      case "clothes":
        return CategoryEnum.clothes;
      case "kids":
        return CategoryEnum.kids;
      case "leisure":
        return CategoryEnum.leisure;
      case "car":
        return CategoryEnum.car;
      case "general":
        return CategoryEnum.general;
      case "gifts":
        return CategoryEnum.gifts;
      case "groceries":
        return CategoryEnum.groceries;
      case "transports":
        return CategoryEnum.transports;
      case "charity":
        return CategoryEnum.charity;
      case "sports":
        return CategoryEnum.sports;
      case "debts":
        return CategoryEnum.debts;
      default:
        throw "WRONG VALUE BITCH";
    }
  }
}

import 'package:api/data/models/income_model.dart';
import 'package:api/data/repositories/expense_repo.dart';

import '../sources/local/sqldb.dart';

class IncomeRepo {
  IncomeRepo._internal();

  static IncomeRepo instance = IncomeRepo._internal();

  Future<List<IncomeModel>> readAllIncomes() async {
    List<Map<String, dynamic>> result =
        await SqlDB().readData("SELECT * FROM income ORDER BY timestamp DESC");
    List<IncomeModel> incomeModeList = [];
    for (Map<String, dynamic> income in result) {
      incomeModeList.add(IncomeModel.fromJson(income));
    }
    return incomeModeList;
  }

  Future<void> addIncome({required IncomeModel income}) async {
    await SqlDB().writeData(
      "INSERT INTO income(timestamp, amount) VALUES(${income.timestamp}, ${income.amount})",
    );
  }

  Future<double> getTotal() async {
    final incomes = await readAllIncomes();
    double total = 0.0;
    for (IncomeModel incomeModel in incomes) {
      total += incomeModel.amount ?? 0;
    }
    return total - await ExpenseRepo.instance.getTotal();
  }
}

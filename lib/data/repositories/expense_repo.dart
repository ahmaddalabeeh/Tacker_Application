import 'package:api/data/models/enum/category_enum.dart';
import 'package:api/data/models/expense_model.dart';
import 'package:api/data/repositories/income_repo.dart';
import 'package:api/data/sources/local/sqldb.dart';
import 'package:flutter/material.dart';

class ExpenseRepo {
  ExpenseRepo._internal();

  static ExpenseRepo instance = ExpenseRepo._internal();

  Future<List<ExpenseModel>> readExpenseByCategory({
    required CategoryEnum category,
  }) async {
    List<Map<String, dynamic>> result = await SqlDB().readData(
      "SELECT * FROM expense WHERE categoryType = '${category.name}' ORDER BY timestamp DESC",
    );
    List<ExpenseModel> expenseModelList = [];
    for (Map<String, dynamic> expense in result) {
      expenseModelList.add(ExpenseModel.fromJson(expense));
    }
    return expenseModelList;
  }

  Future<List<ExpenseModel>> readAllExpense() async {
    List<Map<String, dynamic>> result =
        await SqlDB().readData("SELECT * FROM expense ORDER BY timestamp DESC");
    List<ExpenseModel> expenseModeList = [];
    for (Map<String, dynamic> expense in result) {
      expenseModeList.add(ExpenseModel.fromJson(expense));
    }
    return expenseModeList;
  }

  Future<void> deleteExpenseById({required id}) async {
    await SqlDB().deleteData("DELETE FROM expense WHERE id = $id");
  }

  Future<void> addExpense(BuildContext context,
      {required ExpenseModel expense}) async {
    if ((expense.amount ?? 0) > (await IncomeRepo.instance.getTotal())) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("INSUFFICIENT FUNDS")),
      );
    } else {
      await SqlDB().writeData(
          "INSERT INTO expense(timestamp, amount, categoryType) VALUES(${expense.timestamp}, ${expense.amount}, '${expense.categoryType!.name}')");
    }
  }

  Future<double> getTotal() async {
    final expenses = await readAllExpense();
    double total = 0.0;
    for (ExpenseModel expenseModel in expenses) {
      total += expenseModel.amount ?? 0;
    }
    return total;
  }
}

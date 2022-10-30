import 'package:api/data/models/enum/category_enum.dart';
import 'package:api/data/models/expense_model.dart';
import 'package:api/data/repositories/expense_repo.dart';
import 'package:flutter/material.dart';

import '../data/models/income_model.dart';
import '../data/repositories/income_repo.dart';

class TransactionsProvider with ChangeNotifier {
  late TextEditingController amountController;
  late GlobalKey<FormState> dialogKey;
  late CategoryEnum currentCategory;
  final List<ExpenseModel> _expenseModelList = [];
  final List<IncomeModel> _incomeModelList = [];

  List<IncomeModel> get incomeModelList => _incomeModelList;

  List<ExpenseModel> get expenseModelList => _expenseModelList;

  void initializer() {
    amountController = TextEditingController();
    dialogKey = GlobalKey<FormState>();
  }

  void disposer() {
    amountController.dispose();
  }

  Future<void> appendToExpenseList(BuildContext context) async {
    await ExpenseRepo.instance.addExpense(
      context,
      expense: ExpenseModel(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        amount: double.tryParse(amountController.text.trim()) ?? 0,
        categoryType: currentCategory,
      ),
    );
    await fillExpenseListByCategory();
  }

  Future<void> removeFromExpenseList(
    BuildContext context, {
    required id,
    bool fillByCategory = false,
  }) async {
    await ExpenseRepo.instance.deleteExpenseById(id: id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item deleted'),
      ),
    );
    if (fillByCategory) {
      await fillExpenseListByCategory();
    } else {
      await fillExpenseList();
    }
  }

  Future<void> fillExpenseListByCategory() async {
    final cachedList = await ExpenseRepo.instance.readExpenseByCategory(
      category: currentCategory,
    );
    expenseModelList.clear();
    expenseModelList.addAll(cachedList);
    notifyListeners();
  }

  Future<void> fillIncomeList() async {
    final cachedList = await IncomeRepo.instance.readAllIncomes();
    incomeModelList.clear();
    incomeModelList.addAll(cachedList);
    notifyListeners();
  }

  Future<void> fillExpenseList() async {
    final cachedList = await ExpenseRepo.instance.readAllExpense();
    expenseModelList.clear();
    expenseModelList.addAll(cachedList);
    notifyListeners();
  }

  Future<void> appendToIncomeList() async {
    await IncomeRepo.instance.addIncome(
      income: IncomeModel(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        amount: double.tryParse(amountController.text.trim()) ?? 0,
      ),
    );
    await fillIncomeList();
  }
}

import 'package:api/data/repositories/expense_repo.dart';
import 'package:api/data/repositories/income_repo.dart';
import 'package:api/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/expense_model.dart';
import '../../providers/salary_provider.dart';
import '../../widgets/plus_button.dart';
import '../../widgets/transactions_tile.dart';

part 'components/salary_screen_balance_card.dart';

part 'components/salary_screen_expense_list.dart';

part 'components/salary_screen_income_list.dart';

part 'components/salary_screen_tab_bar.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  static const routeName = '/salary';

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  List<ExpenseModel> expenseList = [];

  @override
  void initState() {
    Provider.of<TransactionsProvider>(context, listen: false)
      ..initializer()
      ..fillIncomeList()
      ..fillExpenseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<SalaryProvider>(
        builder: (context, salaryProvider, child) {
          return Scaffold(
            body: Column(
              children: const [
                SalaryScreenBalanceCard(),
                SalaryScreenTabBar(),
              ],
            ),
            floatingActionButton: Visibility(
              visible: salaryProvider.currentTabIndex == 0 ? false : true,
              child: const PlusButton(isIncome: true),
            ),
          );
        },
      ),
    );
  }
}

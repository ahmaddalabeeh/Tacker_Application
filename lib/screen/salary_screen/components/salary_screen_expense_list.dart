part of '../salary_screen.dart';

class SalaryScreenExpenseList extends StatelessWidget {
  const SalaryScreenExpenseList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, transProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: transProvider.expenseModelList.length,
          padding: const EdgeInsets.only(top: 16),
          itemBuilder: (context, index) => TransactionsTile(
            id: transProvider.expenseModelList[index].id!,
            index: index,
            amount: transProvider.expenseModelList[index].amount ?? 0,
            timeStamp: transProvider.expenseModelList[index].timestamp ?? 0,
            categoryType: transProvider.expenseModelList[index].categoryType,
          ),
        );
      },
    );
  }
}

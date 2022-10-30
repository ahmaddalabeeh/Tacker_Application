part of '../salary_screen.dart';

class SalaryScreenIncomeList extends StatelessWidget {
  const SalaryScreenIncomeList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, transProvider, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: transProvider.incomeModelList.length,
          padding: const EdgeInsets.only(top: 16),
          itemBuilder: (context, index) => TransactionsTile(
            isIncome: true,
            id: transProvider.incomeModelList[index].id!,
            index: index,
            amount: transProvider.incomeModelList[index].amount ?? 0,
            timeStamp: transProvider.incomeModelList[index].timestamp ?? 0,
          ),
        );
      },
    );
  }
}

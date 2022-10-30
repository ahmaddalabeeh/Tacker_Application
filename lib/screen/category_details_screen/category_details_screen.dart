import 'package:api/widgets/empty_list.dart';
import 'package:api/widgets/plus_button.dart';
import 'package:api/widgets/transactions_tile.dart';
import 'package:api/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/transactions_provider.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static const routeName = "/categoryDetailsScreen";

  const CategoryDetailsScreen({super.key});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionsProvider>(context, listen: false)
      ..initializer()
      ..fillExpenseListByCategory();
  }

  @override
  void dispose() {
    // Provider.of<TransactionsProvider>(context, listen: false).disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transactionsProvider =
        Provider.of<TransactionsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CategoryTitle(
          title:
              "${transactionsProvider.currentCategory.name.toUpperCase()} TRANSACTION LIST",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Consumer<TransactionsProvider>(
                builder: (context, transProvider, _) {
                  return transProvider.expenseModelList.isEmpty
                      ? const EmptyList()
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: transProvider.expenseModelList.length,
                          itemBuilder: (context, index) {
                            return TransactionsTile(
                              id: transProvider.expenseModelList[index].id!,
                              index: index,
                              amount: transProvider
                                      .expenseModelList[index].amount ??
                                  0,
                              categoryType: transProvider
                                  .expenseModelList[index].categoryType,
                              timeStamp: transProvider
                                      .expenseModelList[index].timestamp ??
                                  0,
                              isSalaryScreen: false,
                            );
                          },
                        );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const PlusButton(),
    );
  }
}

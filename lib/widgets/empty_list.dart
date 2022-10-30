import 'package:api/providers/transactions_provider.dart';
import 'package:api/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final transactionProvider = Provider.of<TransactionsProvider>(
      context,
      listen: false,
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images-icons/empty.png",
            scale: 3,
            color: Colors.grey[500],
          ),
          SizedBox(
            height: size.height * (0.02),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CategoryTitle(
                title:
                    "Looks like your ${transactionProvider.currentCategory.name} transaction list is empty!"),
          )
        ],
      ),
    );
  }
}

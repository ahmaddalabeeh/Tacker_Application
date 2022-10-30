import 'package:api/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class PlusButton extends StatelessWidget {
  final bool isIncome;

  const PlusButton({super.key, this.isIncome = false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final transactionsProvider =
        Provider.of<TransactionsProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: CategoryTitle(
                title: isIncome ? "NEW INCOME" : "NEW TRANSACTION",
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Form(
                            key: transactionsProvider.dialogKey,
                            child: TextFormField(
                              maxLength: 7,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'A M O U N T?',
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Enter an amount';
                                }
                                return null;
                              },
                              controller: transactionsProvider.amountController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (!isIncome)
                      SizedBox(
                        height: size.height * (0.02),
                      ),
                    if (!isIncome)
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: transactionsProvider
                                    .currentCategory.name
                                    .toUpperCase(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (!isIncome)
                      SizedBox(
                        height: size.height * (0.02),
                      ),
                  ],
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  color: const Color.fromARGB(255, 131, 45, 45),
                  child: CategoryTitle(title: "Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  color: const Color.fromARGB(255, 131, 45, 45),
                  child: CategoryTitle(title: "Enter"),
                  onPressed: () async {
                    if (transactionsProvider.dialogKey.currentState!
                        .validate()) {
                      Navigator.of(context).pop();
                      if (isIncome) {
                        await transactionsProvider.appendToIncomeList();
                      } else {
                        await transactionsProvider.appendToExpenseList(context);
                      }
                    }
                  },
                )
              ],
            );
          },
        );
      },
      child: Container(
        height: size.height * (0.08),
        width: size.height * (0.08),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 131, 45, 45), shape: BoxShape.circle),
        child: const Center(
          child: Text(
            "+",
            style: TextStyle(
                color: Color.fromARGB(255, 226, 221, 221), fontSize: 25),
          ),
        ),
      ),
    );
  }
}

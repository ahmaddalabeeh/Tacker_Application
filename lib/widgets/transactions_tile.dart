import 'package:api/data/models/enum/category_enum.dart';
import 'package:api/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionsTile extends StatelessWidget {
  const TransactionsTile({
    super.key,
    required this.id,
    required this.index,
    required this.amount,
    required this.timeStamp,
    this.categoryType,
    this.isIncome = false,
    this.isSalaryScreen = true,
  });

  final int id, index, timeStamp;
  final double amount;
  final CategoryEnum? categoryType;
  final bool isIncome, isSalaryScreen;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isIncome
        ? _cardBody(size)
        : Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.black.withOpacity(0),
            ),
            key: ValueKey<int>(index),
            confirmDismiss: (DismissDirection direction) async {
              await Provider.of<TransactionsProvider>(context, listen: false)
                  .removeFromExpenseList(
                context,
                id: id,
                fillByCategory: !isSalaryScreen,
              );
              return null;
            },
            child: _cardBody(size),
          );
  }

  Padding _cardBody(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            height: size.height * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isIncome
                  ? Colors.blueGrey
                  : const Color.fromARGB(255, 131, 45, 45).withOpacity(0.7),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      isIncome
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: isIncome ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (categoryType != null)
                        Text(
                          (categoryType?.name ?? "").toUpperCase(),
                          style: const TextStyle(
                              fontSize: 23, color: Colors.white),
                        ),
                      Text(
                        DateFormat("yyyy MM dd , hh:mm:ss a").format(
                            DateTime.fromMillisecondsSinceEpoch(timeStamp)),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "\$ ${isIncome ? "+" : "-"} $amount",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: isIncome
                          ? const Color(0xFF00FF00)
                          : const Color.fromARGB(255, 255, 17, 0),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * (0.03)),
        ],
      ),
    );
  }
}

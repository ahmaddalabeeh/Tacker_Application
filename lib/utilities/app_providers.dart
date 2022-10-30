import 'package:api/providers/salary_provider.dart';
import 'package:api/providers/transactions_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider.value(value: TransactionsProvider()),
  ChangeNotifierProvider.value(value: SalaryProvider()),
];

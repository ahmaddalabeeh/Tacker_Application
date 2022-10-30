import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/transactions_provider.dart';
import '../../utilities/categories_list.dart';
import '../../widgets/custom_text.dart';
import '../category_details_screen/category_details_screen.dart';
import 'components.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Headline1(text: "Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          itemCount: categoriesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: size.height * (0.034),
          ),
          itemBuilder: (context, index) {
            return CustomCircleAvatar(
              backImage: categoriesList[index]['icon'],
              title: categoriesList[index]['title'],
              onTap: () {
                Provider.of<TransactionsProvider>(context, listen: false)
                    .currentCategory = categoriesList[index]["type"];
                Navigator.pushNamed(
                  context,
                  CategoryDetailsScreen.routeName,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

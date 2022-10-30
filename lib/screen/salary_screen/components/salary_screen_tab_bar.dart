part of '../salary_screen.dart';

class SalaryScreenTabBar extends StatelessWidget {
  const SalaryScreenTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DefaultTabController(
          length: 2,
          child: Consumer<SalaryProvider>(
            builder: (context, salaryProvider, child) {
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: 5,
                  elevation: 10,
                  bottom: TabBar(
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.white, width: 3),
                      insets: EdgeInsets.only(left: 50, right: 50),
                    ),
                    onTap: (index) {
                      salaryProvider.currentTabIndex = index;
                    },
                    tabs: const [
                      Tab(text: "E x p e n s e"),
                      Tab(text: "I n c o m e"),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    SalaryScreenExpenseList(),
                    SalaryScreenIncomeList(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

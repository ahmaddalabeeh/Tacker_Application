part of '../salary_screen.dart';

class SalaryScreenBalanceCard extends StatelessWidget {
  const SalaryScreenBalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 131, 45, 45),
          Color.fromARGB(255, 38, 37, 37)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Consumer<TransactionsProvider>(
        builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.green,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'I n c o m e',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        FutureBuilder<double>(
                          future: IncomeRepo.instance.getTotal(),
                          builder: (context, snapshot) {
                            return Text(
                              '\$ ${snapshot.connectionState ==
                                  ConnectionState.waiting ? 0 : snapshot.data?.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_downward_rounded,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'E x p e n s e',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        FutureBuilder<double>(
                          future: ExpenseRepo.instance.getTotal(),
                          builder: (context, snapshot) {
                            return Text(
                              '\$ ${snapshot.connectionState ==
                                  ConnectionState.waiting ? 0 : snapshot.data?.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

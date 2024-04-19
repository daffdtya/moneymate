import 'package:flutter/material.dart';
import 'package:moneymate/widget/bills.dart';
import 'package:moneymate/widget/expense.dart';
import 'package:moneymate/widget/income.dart';
import 'package:moneymate/widget/planning.dart';
import 'package:moneymate/widget/receipt.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({Key? key}) : super(key: key);

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 244, 205, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "\nHey, Daffa Aditya\nAdd Your Tracking Budget Here",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildMainCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      margin: EdgeInsets.all(1.0),
      width: 500,
      height: 1000,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        children: [
          Image.asset(
            "images/addbudget.png",
            width: 300,
          ),
          SizedBox(height: 20),
          _buildOption(
              "Set Your Planning",
              "images/planning.png",
              "Easily organize your financial categories with\npercentages",
              PlanningPage()),
          _buildOption("Scan Your Receipt", "images/scan.png",
              "Scan your receipts for easy expense tracking", ReceiptPage()),
          _buildOption(
              "Note Your Bills",
              "images/note.png",
              "Easily record your monthly bills and set your\nown reminders",
              BillsPage()),
          _buildOption("Add Your Income", "images/income.png",
              "Keep track of your income here", IncomePage()),
          _buildOption("Track Your Expenses", "images/expense.png",
              "Manually record your expenses by category", ExpensePage())
        ],
      ),
    );
  }

  Widget _buildOption(
      String title, String imagePath, String subtitle, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        height: 80,
        width: 300,
        padding: EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromRGBO(204, 244, 205, 1),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(61, 124, 64, 1),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

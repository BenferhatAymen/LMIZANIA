import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:lmizania/utils/filter_row.dart';

import '../model/transactions_model.dart';

import '../widget/transaction_list_view.dart';

class AllTransactions extends StatefulWidget {
  final List<Transaction> transactions;

  const AllTransactions({Key? key, required this.transactions})
      : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TColor.bgColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: buildAppBar(() {
            Navigator.pop(context);
          }),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: mainMin,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterRowWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Flexible(
                  fit: FlexFit.loose,
                  child: TransactionListView(transactions: widget.transactions),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function to build the category selection bottom sheet
  FilterChip buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      backgroundColor: Colors.white,
      selectedColor: CustomColors.top,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      selected: false,
      showCheckmark: false,
      onSelected: (bool isSelected) {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}

Widget _buildFilterBottomSheet(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(Dimensions.paddingSize),
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 50,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Filter Transactions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement reset functionality
              },
              child: const Text('Reset'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Filter By',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement filter by income functionality
              },
              child: const Text('Income'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement filter by expense functionality
              },
              child: const Text('Expense'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Sort By',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: [
            buildFilterChip('Highest'),
            buildFilterChip('Lowest'),
            buildFilterChip('Newest'),
            buildFilterChip('Oldest'),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Category',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Choose category',
            suffixIcon: Icon(Icons.arrow_forward),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Show category selection bottom sheet
            // _showCategorySelectionBottomSheet(context);
          },
          child: const Text('Apply'),
        ),
      ],
    ),
  );
}

Widget buildFilterChip(String label) {
  return FilterChip(
    label: Text(label),
    backgroundColor: Colors.white,
    selectedColor: CustomColors.top,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    selected: false,
    showCheckmark: false,
    onSelected: (bool isSelected) {
      // Handle chip selection
    },
  );
}

Widget buildAppBar(VoidCallback onPressed) {
  return SafeArea(
    child: Container(
      color: Colors.black,
      child: AppBar(
        backgroundColor: CustomColors.navorappbar,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              onPressed;
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'All Transactions',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

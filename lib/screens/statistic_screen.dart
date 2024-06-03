import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/data/models/category_model.dart';
import 'package:lmizania/data/models/transaction_models.dart';
import 'package:lmizania/screens/bar_chart.dart';
import 'package:lmizania/screens/pie_chart.dart';
import 'package:lmizania/utils/basic_imports.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String _selectedDate = '5 October 2024'; // Initial selected date
  bool isDropdownOpened = false;
  List<bool> isSelected = [true, false];
  bool isIncome = true;
  int categoryInitialLabelindex = 0;
  List<CategoryModel> expenseCategories = [
    CategoryModel(name: 'Food', amount: 100),
    CategoryModel(name: 'Transport', amount: 200),
    CategoryModel(name: 'Entertainment', amount: 300),
    CategoryModel(name: 'Health', amount: 400),
    CategoryModel(name: 'Education', amount: 500),
    CategoryModel(name: 'Shopping', amount: 600),
    CategoryModel(name: 'Others', amount: 700),
  ];
  List<CategoryModel> incomeCategories = [
    CategoryModel(name: 'Salary', amount: 100),
    CategoryModel(name: 'College', amount: 200),
    CategoryModel(name: 'Loan', amount: 300),
  ];

  List<TransactionModel> incomeTransactions = [
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 20,
      date: "04-04-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 30,
      date: "02-03-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "04-04-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-03-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-02-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-02-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-11-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-01-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-09-2024",
      category: "Food",
      id: "1",
    ),
  ];
  var expenseTransactions = [
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 20,
      date: "04-01-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 30,
      date: "02-02-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "04-05-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-06-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-07-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-08-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-11-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-011-2024",
      category: "Food",
      id: "1",
    ),
    TransactionModel(
      name: "hmida",
      type: "income",
      amount: 40,
      date: "02-12-2024",
      category: "Food",
      id: "1",
    ),
  ];
  final List<Color> progressBarColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.cyanAccent,
    Colors.yellowAccent,
    Colors.teal,
    Colors.brown,
    Colors.indigoAccent,
    Colors.pink,
    Colors.lightGreen
  ];
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = incomeCategories;

    return Scaffold(
      backgroundColor: CustomColors.bg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: buildAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              switchbetweendays(),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Normal Dropdown aligned to the start
                        Spacer(),
                        ToggleButtons(
                          children: const [
                            Icon(
                              Icons.bar_chart,
                            ),
                            Icon(
                              Icons.pie_chart,
                            )
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < isSelected.length;
                                  buttonIndex++) {
                                isSelected[buttonIndex] = index == buttonIndex;
                              }
                            });
                          },
                          isSelected: isSelected,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          selectedColor: Colors.white, // Selected icon color
                          color:
                              CustomColors.navorappbar, // Unselected icon color
                          selectedBorderColor: CustomColors
                              .navorappbar, // Selected button border color
                          borderColor: CustomColors
                              .navorappbar, // Unselected button border color
                          fillColor: CustomColors
                              .navorappbar, // Unselected button background color
                        ),
                      ],
                    ),
                  ),
                  //line chart
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  // Conditionally render the chart based on selection
                  SizedBox(
                    height: 250,
                    child: isSelected[0]
                        ? BarChartWidget(
                            transactions: (categoryInitialLabelindex == 0)
                                ? incomeTransactions
                                : expenseTransactions,
                            isIncome:
                                (categoryInitialLabelindex == 0 ? true : false),
                          )
                        : PieChartWidget(
                            categories: (categoryInitialLabelindex == 0)
                                ? incomeCategories
                                : expenseCategories,
                          ),
                  ),
                ]),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: ToggleSwitch(
                    minWidth: 200.w,
                    minHeight: 50.h,
                    cornerRadius: 15.r,
                    activeBgColors: const [
                      [CustomColors.navorappbar],
                      [CustomColors.navorappbar]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey[300],
                    inactiveFgColor: Colors.black,
                    initialLabelIndex: categoryInitialLabelindex,
                    totalSwitches: 2,
                    labels: const ['Income', 'Expense'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                      setState(() {
                        categoryInitialLabelindex = index!;
                        if (categoryInitialLabelindex == 0) {
                          categories = incomeCategories;
                        } else {
                          categories = expenseCategories;
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: categories
                      .map((category) => _buildCategoryItem(
                            category.name!,
                            category.amount!.toDouble(),
                            progressBarColors[categories.indexOf(category) %
                                progressBarColors.length],
                            progressBarColors[categories.indexOf(category) %
                                progressBarColors.length],
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ToggleSwitch switchbetweendays() {
    return ToggleSwitch(
      minWidth: 75.0,
      cornerRadius: 20.0,
      activeBgColors: const [
        [CustomColors.navorappbar],
        const [CustomColors.navorappbar],
        [CustomColors.navorappbar],
        [CustomColors.navorappbar],
        [CustomColors.navorappbar],
        [CustomColors.navorappbar]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.white,
      inactiveFgColor: Colors.black,
      initialLabelIndex: 0,
      totalSwitches: 5,
      labels: const ['Day', 'Week', 'Month', 'Year', 'All'],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }

  SfCartesianChart linedchart() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
        labelStyle: const TextStyle(color: Colors.transparent),
        labelPlacement: LabelPlacement.onTicks,
        interval: 1,
        axisBorderType: AxisBorderType.rectangle,
        isVisible: false,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        axisLine: AxisLine(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(width: 0),
        labelStyle: const TextStyle(color: Colors.transparent),
        labelFormat: '{value}%',
        interval: 10,
        maximum: 50,
        isVisible: false,
        minimum: 0,
        axisLine: AxisLine(width: 0),
      ),
      plotAreaBorderWidth: 0,
      series: <AreaSeries<SalesData, String>>[
        AreaSeries<SalesData, String>(
          dataSource: <SalesData>[
            SalesData('Internet', 0),
            SalesData('Car', 35),
            SalesData('Home', 45),
          ],
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          dataLabelSettings: const DataLabelSettings(
              isVisible: false,
              labelIntersectAction: LabelIntersectAction.hide),
          borderWidth: 2,
          borderColor: Colors.black,
        ),
      ],
    );
  }

  SfCircularChart pichart() {
    return SfCircularChart(
      series: <DoughnutSeries<SalesData, String>>[
        DoughnutSeries<SalesData, String>(
          dataSource: <SalesData>[
            SalesData('Internet', 20),
            SalesData('Car', 35),
            SalesData('Home', 45),
          ],
          xValueMapper: (SalesData sales, _) => sales.year,
          yValueMapper: (SalesData sales, _) => sales.sales,
          dataLabelMapper: (SalesData data, _) =>
              '${data.sales}%', // Display data labels in percentage format
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            useSeriesColor: true,
            connectorLineSettings: ConnectorLineSettings(
                type: ConnectorType.line), // Use curve connector lines
          ),
          pointColorMapper: (SalesData sales, _) {
            // Provide custom colors based on the category
            switch (sales.year) {
              case 'Internet':
                return CustomColors.blueColor; // Custom color for 'Internet'
              case 'Car':
                return CustomColors.yellowColor; // Custom color for 'Car'
              case 'Home':
                return CustomColors.greenColor; // Custom color for 'Home'
              default:
                return Colors.grey; // Default color
            }
          },
        )
      ],
    );
  }

  Widget _buildCategoryItem(
      String name, double price, Color dotColor, Color progressColor) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        color: dotColor, // Use the provided dot color
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(name),
                  ],
                ),
              ),
              const Spacer(),
              Text('\$$price'),
            ],
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          LinearPercentIndicator(
            width: 350.w,
            lineHeight: 14.h,
            percent: 0.5,
            barRadius: const Radius.circular(25),
            backgroundColor: Colors.grey,
            progressColor: progressColor, // Use the provided progress color
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
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
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

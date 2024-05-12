import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // Handle back button tap
                      },
                    ),
                    DropdownButton<String>(
                      elevation: 0,
                      borderRadius: null,
                      value: _selectedDate,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDate = newValue!;
                        });
                      },
                      items: <String>['5 October 2024', '6 October 2024']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        // Handle forward button tap
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Container(
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 5),
                                  DropdownButton<String>(
                                    underline: Container(
                                      height: 0,
                                      color: Colors
                                          .transparent, // Change this to your desired underline color
                                    ),
                                    value:
                                        isDropdownOpened ? 'Compare' : 'Normal',
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        isDropdownOpened = !isDropdownOpened;
                                      });
                                    },
                                    items: <String>['Normal', 'Compare']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ToggleButtons(
                          children: const [
                            Icon(
                              Icons.line_axis,
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
                  isSelected[0] ? linedchart() : pichart(),
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
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: const ['Income', 'Expense'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
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
                  children: [
                    _buildCategoryItem(
                        'Internet', 100, Colors.green, Colors.green),
                    _buildCategoryItem('Car', 200, Colors.blue, Colors.blue),
                    _buildCategoryItem(
                        'Home', 300, Colors.yellow, Colors.yellow),
                  ],
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

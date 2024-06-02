import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lmizania/cubits/get_all_goals_cubit/get_all_goals_cubit.dart';
import 'package:lmizania/screens/add_goals.dart';
import 'package:lmizania/screens/add_personal_goal.dart';
import 'package:lmizania/utils/basic_imports.dart';
import '../model/goal_model.dart';
import '../widget/custom_appbar.dart';
import '../widget/goal_container.dart';
import '../widget/goals_list.dart';

class Goals extends StatefulWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllGoalsCubit>(context).getAllGoals();
  }

  bool _isFirstGradient = true;
  int balance = 5200000;
  int goalsamount = 4800;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: CustomAppBar(
          onBack: () {
            // Handle back button press
          },
          text: 'Goals',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize),
          child: Column(
            children: [
              GoalsContainer(
                goals: goalsamount,
                isFirstGradient: _isFirstGradient,
              ),
              SizedBox(height: Dimensions.heightSize),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Goals',
                    style: CustomStyle.goalTextStyle,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle,
                        size: 24, color: CustomColors.strong),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPersonalGoal()));
                    },
                  ),
                ],
              ),
              BlocBuilder<GetAllGoalsCubit, GetAllGoalsState>(
                builder: (context, state) {
                  if (state is GetAllGoalsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is GetAllGoalsSuccess) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.goals.length,
                      itemBuilder: (context, index) {
                        return GoalListItem(
                          goal: state.goals[index],
                          index: index,
                        );
                      },
                    );
                  }
                  return Text("Failed to load goals");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

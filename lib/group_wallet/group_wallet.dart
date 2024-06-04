import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lmizania/add_goal/add_goal_screen.dart';
import 'package:lmizania/colors.dart';
import 'package:lmizania/cubits/create_group_cubit/create_group_cubit.dart';
import 'package:lmizania/cubits/get_all_groups_cubit/get_all_groups_cubit.dart';
import 'package:lmizania/data/models/group_model.dart';
import 'package:lmizania/group_screen/group_screen.dart';
import 'package:lmizania/settings_view/settings_view.dart';
import 'package:lmizania/utils/Group_card.dart';
import 'package:lmizania/utils/segment_button.dart';
import 'package:lmizania/widget/text_alert_dialog.dart';

class GroupWalletView extends StatefulWidget {
  @override
  State<GroupWalletView> createState() => _GroupWalletViewState();
}

class _GroupWalletViewState extends State<GroupWalletView> {
  bool isPersonal = false;
  var groupsData = [
    {"name": "Family", "members": 5, "icon": "images/family.png"},
    {"name": "Friends", "members": 3, "icon": "images/friends.png"},
    {"name": "2cp4", "members": 20, "icon": "images/2cp5.png"},
    {"name": "2cp5", "members": 20, "icon": "images/2cp5.png"},
    {"name": "Estin Boys", "members": 16, "icon": "images/family.png"},
    {"name": "Chabiba", "members": "3", "icon": "images/2cp5.png"},
    {"name": "2cp4", "members": 20, "icon": "images/2cp5.png"},
    {"name": "2cp5", "members": 20, "icon": "images/2cp5.png"},
    {"name": "Estin Boys", "members": 16, "icon": "images/family.png"},
    {"name": "Chabiba", "members": "3", "icon": "images/2cp5.png"},
    {"name": "2cp4", "members": 20, "icon": "images/2cp5.png"},
    {"name": "2cp5", "members": 20, "icon": "images/2cp5.png"},
    {"name": "Estin Boys", "members": 16, "icon": "images/family.png"},
    {"name": "Chabiba", "members": "3", "icon": "images/2cp5.png"},
  ];
  String? groupName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetAllGroupsCubit>(context).getAllGroups();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Groups',
                    style: TextStyle(
                      color: TColor.themeColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TextAlertDialog(
                            onChanged: (string) {
                              groupName = string;
                            },
                            onSave: () async {
                              BlocProvider.of<CreateGroupCubit>(context)
                                  .createGroup(
                                name: groupName!,
                                image: "images/family.png",
                              );
                              await Future.delayed(Duration(milliseconds: 200));

                              BlocProvider.of<GetAllGroupsCubit>(context)
                                  .getAllGroups();
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: TColor.themeColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<GetAllGroupsCubit, GetAllGroupsState>(
                builder: (context, state) {
                  if (state is GetAllGroupsLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetAllGroupsSuccess) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.groups.length,
                      itemBuilder: (context, index) {
                        var sObject = state.groups[index] as GroupModel;

                        return GroupCard(
                          groupData: sObject,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GroupScreenView(
                                          groupData: sObject,
                                        )));
                          },
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text("No Groups Found"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:made_soft_logic/reusables/elevated.dart';
import 'package:made_soft_logic/utils/colors.dart';
import 'package:made_soft_logic/view_model/appState.dart';
import 'package:provider/provider.dart';



class Grid extends StatelessWidget {

  AppState appState;

  @override
  Widget build(BuildContext context) {
appState = Provider.of<AppState>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 233,
            child: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Today's Transaction",
                          style: TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("15 June 2020",
                            style: TextStyle(
                                fontSize: 9, color: Colors.black)),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.greyBorder,
                    thickness: 1.0,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "₦ 0.00",
                          style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w500),
                        ),
                        Text("Sales")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 19,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                              BorderRadius.circular(4)),
                        ),
                        Container(
                          width: 59,
                          height: 19,
                          decoration: BoxDecoration(
                              color: AppColors.bar,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5))),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "₦ 0.00",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text("Profit",
                                style: TextStyle(fontSize: 12))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 120,
                          height: 19,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                              BorderRadius.circular(4)),
                        ),
                        Container(
                          width: 89,
                          height: 19,
                          decoration: BoxDecoration(
                              color: AppColors.bar,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5),
                                  topRight: Radius.circular(5))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "₦ 0.00",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text("Profit",
                                style: TextStyle(fontSize: 12))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 900,
            child: GridView.builder(

              physics: NeverScrollableScrollPhysics(),
              itemCount: appState.boxModel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:   2 ),
              itemBuilder: (BuildContext context, int index) {
                return Elevated(
                  number: appState.boxModel[index].number ==  null  ? "" : appState.boxModel[index].number.toString() ,
                  image: appState.boxModel[index].image,
                  text: appState.boxModel[index].text,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
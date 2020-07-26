import 'package:flutter/material.dart';
import 'package:made_soft_logic/model/customPopupMenu.dart';
import 'package:made_soft_logic/reusables/elevated.dart';
import 'package:made_soft_logic/utils/colors.dart';
import 'package:made_soft_logic/view_model/appState.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  var _tabIndex = ValueNotifier<int>(0);
AppState appState;


  CustomPopupMenu _selectedChoices;


  List<CustomPopupMenu> choices = [
    CustomPopupMenu(title: 'Home', icon: Icons.home),
    CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
    CustomPopupMenu(title: 'Settings', icon: Icons.settings),
  ];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }









  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: AppColors.primary),
        actions: <Widget>[
          PopupMenuButton(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 0,
            right: 0,
            top: 0,
          ),
          child: Column(
            children: <Widget>[
              // tab view
              TabBar(
                indicatorColor: Color(0xffF95862),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.5,
                    color: Color(
                      0xffF95862,
                    ),
                  ),
                  insets: EdgeInsets.symmetric(
                    horizontal: -70.0,
                  ),
                ),
                controller: _tabController,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text("DASHBOARD", style: TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                  Tab(
                    child: Text("ACTIVITY", style: TextStyle(color: Colors.black, fontSize: 12)),
                  ),
                ],
              ),

              SizedBox(
                height: 25,
              ),

              // tab bar views
              Visibility(
                visible: _tabIndex.value == 0 ? true : false,
                child: Column(
                  children: <Widget>[
                    // card
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
                                    decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child:  LinearPercentIndicator(
                                        width: 250.0,

                                        backgroundColor: AppColors.primary.withOpacity(0.2),
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 20.0,

                                        percent: 0.7,

                                        linearStrokeCap: LinearStrokeCap.butt,
                                        progressColor: AppColors.primary,
                                      ),
                                    ),
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
                                    decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child:  LinearPercentIndicator(
                                        width: 200.0,

                                        backgroundColor: AppColors.primary.withOpacity(0.2),
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 20.0,

                                        percent: 0.3,

                                        linearStrokeCap: LinearStrokeCap.butt,
                                        progressColor: AppColors.primary,
                                      ),
                                    ),
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


                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.99
                      ),
                      itemBuilder: (cxt, index) {
                        return Elevated(
                          number: appState.boxModel[index].number == null ?  "": appState.boxModel[index].number.toString(),
                          image: appState.boxModel[index].image,
                          text: appState.boxModel[index].text,
                        );
                      },
                      itemCount: 12,
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: _tabIndex.value == 1 ? true : false,
                child: Center(
                  child: Text(
                    'Activity Tab',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
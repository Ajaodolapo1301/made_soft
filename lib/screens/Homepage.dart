import 'package:flutter/material.dart';
import 'package:made_soft_logic/model/boxModel.dart';
import 'package:made_soft_logic/model/customPopupMenu.dart';
import 'package:made_soft_logic/reusables/elevated.dart';
import 'package:made_soft_logic/reusables/grid.dart';
import 'package:made_soft_logic/utils/colors.dart';
import 'package:made_soft_logic/view_model/appState.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  AppState appState;
  ScrollController _scrollController;
  bool fixedScroll = false;

  final List<Widget> myTabs = [
    Tab(text: 'auto short'),
    Tab(text: 'auto long'),
  ];

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  _buildTabContext() => Expanded(

        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: appState.boxModel.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Elevated(
                number: appState.boxModel[index].number == null ? appState.boxModel[index].number.toString() :"",
                image: appState.boxModel[index].image,
                text: appState.boxModel[index].text,
              ),
            );
          },
        ),
      );

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    super.initState();
  }

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
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    final orientation = MediaQuery.of(context).orientation;
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
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(

              child: Container(
                height: 50,
                width: 50,
                child: TabBar(
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
                  labelColor: Colors.redAccent,
                  isScrollable: true,
                  tabs: [
                    Text('DASHBOARD', style: TextStyle(color: Colors.black, fontSize: 12),),

                    Text('ACTIVITY', style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              Column(
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
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
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
                                      borderRadius: BorderRadius.circular(4)),
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
                                      borderRadius: BorderRadius.circular(4)),
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
                  _buildTabContext(),
                ],
              ),
              _buildTabContext()
            ],
          ),
        ),
      ),

//      SliverGrid(
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2,
//                  mainAxisSpacing: 20,
//                  crossAxisSpacing: 20,
//                  childAspectRatio: 0.95,
//                ),
//                delegate:
//                SliverChildBuilderDelegate(
//                        (BuildContext context, int index){
//
//                      return Elevated();
//
//                    },
//                    childCount: 5
//
//                )
//            ) ,
    );
  }
}

//
//Container(
//height: 900,
//child: GridView.builder(
//itemCount: 5,
//gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
//itemBuilder: (BuildContext context, int index) {
//return Padding(
//padding: const EdgeInsets.all(10.0),
//child: Elevated(),
//);
//},
//),
//)

//SliverPadding(
//            padding: EdgeInsets.only(left: 20.0, right: 20.0) ,
//            sliver:  SliverGrid(
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2,
//                  mainAxisSpacing: 15,
//                  crossAxisSpacing: 10,
//                  childAspectRatio: 0.75,
//                ),
//                delegate:
//                SliverChildBuilderDelegate(
//                        (BuildContext context, int index){
//
//                      return Elevated();
//
//                    },
//                    childCount: 5
//
//                )
//            ) ,
//          ),

//Container(
//height: 900,
//child: GridView.builder(
//physics: NeverScrollableScrollPhysics(),
//itemCount: appState.boxModel.length,
//gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
//itemBuilder: (BuildContext context, int index) {
//return Padding(
//padding: const EdgeInsets.all(10.0),
//child: Elevated(
//number: appState.boxModel[index].number.toString(),
//image: appState.boxModel[index].image,
//text: appState.boxModel[index].text,
//),
//);
//},
//),
//)

//GridView.count(
//crossAxisCount: 4,
//childAspectRatio: 1.0,
//padding: const EdgeInsets.all(4.0),
//mainAxisSpacing: 4.0,
//crossAxisSpacing: 4.0,
//children: appState.boxModel.map((BoxModel index) {
//return Elevated(
//image: ,
//}).toList()),

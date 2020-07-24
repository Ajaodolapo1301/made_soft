import 'package:flutter/material.dart';
import 'package:made_soft_logic/model/customPopupMenu.dart';
import 'package:made_soft_logic/reusables/elevated.dart';
import 'package:made_soft_logic/reusables/grid.dart';
import 'package:made_soft_logic/utils/colors.dart';
import 'package:made_soft_logic/view_model/appState.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController _tabController;
  CustomPopupMenu _selectedChoices;

  AppState appState;
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
  void initState() {

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState =  Provider.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),


        body: CustomScrollView(
          physics: ScrollPhysics(),


         slivers: <Widget>[
           SliverList(delegate: SliverChildListDelegate(
             [
               Container(
                 height: 50,
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
                   tabs: <Widget>[

                     Text('DASHBOARD', style: TextStyle(color: Colors.black, fontSize: 12),),
                     Text('ACTIVITY', style: TextStyle(color: Colors.black, fontSize: 12)),
                   ],
                 ),


               ),

               Container(
                 height: 900,
                 child: TabBarView(
                   children: [

                     CustomScrollView(
                       physics: ScrollPhysics(),
                       shrinkWrap: false,
                      slivers: <Widget>[

                        SliverList(
                          delegate: SliverChildListDelegate([



                            Column(
                              children: <Widget>[
                                SizedBox(height: 20,),
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








                              ],
                            ),
                          ]),
                        ),



                      ],
                     ) ,



                     Icon(Icons.directions_transit),

                   ],
                 ),
               ),
             ]
           ))
         ],
        ),
      ),
    );

//        body: CustomScrollView(
//          slivers: <Widget>[
//            SliverList(
//              delegate: SliverChildListDelegate(
//                [
//
//                  Align(
//                    alignment: Alignment.bottomCenter,
//                    child: Card(
//                      child: Container(
//                        height: 50,
//                        child: TabBar(
//                          indicatorColor: Color(0xffF95862),
//                          indicatorSize: TabBarIndicatorSize.label,
//                          controller: _tabController,
//                          indicator: UnderlineTabIndicator(
//                            borderSide: BorderSide(
//                              width: 3.5,
//                              color: Color(
//                                0xffF95862,
//                              ),
//                            ),
//                            insets: EdgeInsets.symmetric(
//                              horizontal: -70.0,
//                            ),
//                          ),
//                          tabs: <Widget>[
//                            Text('DASHBOARD', style: TextStyle(color: Colors.black, fontSize: 12),),
//                            Text('ACTIVITY', style: TextStyle(color: Colors.black, fontSize: 12)),
//
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
//
//                  Container(
//                    height: MediaQuery.of(context).size.height,
//                    child: TabBarView(
//                      controller: _tabController,
//                      children: <Widget>[
//                        Column(
//                          children: <Widget>[
//                            Container(
//                              decoration: BoxDecoration(
//                                color: Colors.white,
//                              ),
//                              width:MediaQuery.of(context).size.width * 0.9,
//                              height: 233,
//                              child: Material(
//                                elevation:3.0,
//                                borderRadius: BorderRadius.circular(10),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Container(
//                                      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
//                                      child: Column(
//                                        crossAxisAlignment: CrossAxisAlignment.start,
//                                        children: <Widget>[
//                                          Text("Today's Transaction", style: TextStyle(fontSize: 16, color: Colors.black),),
//                                          SizedBox(height: 5,),
//                                          Text("15 June 2020", style: TextStyle(fontSize: 9, color: Colors.black)),
//                                        ],
//                                      ),
//                                    ),
//
//                                    Divider(color: AppColors.greyBorder,thickness: 1.0,),
//
//
//                                    Center(
//                                      child: Column(
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        children: <Widget>[
//                                          Text("₦ 0.00", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),),
//                                          Text("Sales")
//                                        ],
//                                      ),
//                                    ),
//                                    SizedBox(height: 10,),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 15),
//                                      child: Row(
//
//                                        children: <Widget>[
//                                          Container(
//                                            width: 180,
//                                            height: 19,
//                                            decoration: BoxDecoration(
//                                                color: AppColors.primary,
//                                                borderRadius: BorderRadius.circular(4)
//                                            ),
//
//
//                                          ),
//                                          Container(
//                                            width: 59,
//                                            height: 19,
//                                            decoration: BoxDecoration(
//                                                color: AppColors.bar,
//                                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topRight: Radius.circular(5))
//                                            ),
//
//                                          ),
//                                          SizedBox(width: 15,),
//                                          Column(
//                                            children: <Widget>[
//                                              Text("₦ 0.00", style: TextStyle(fontSize: 12),),
//                                              Text("Profit", style: TextStyle(fontSize: 12))
//                                            ],
//                                          )
//                                        ],
//                                      ),
//                                    ),
//
//
//                                    SizedBox(height: 10,),
//                                    Padding(
//                                      padding: const EdgeInsets.only(left: 15),
//                                      child: Row(
//
//                                        children: <Widget>[
//                                          Container(
//                                            width: 120,
//                                            height: 19,
//                                            decoration: BoxDecoration(
//                                                color: AppColors.primary,
//                                                borderRadius: BorderRadius.circular(4)
//                                            ),
//
//
//                                          ),
//                                          Container(
//                                            width: 89,
//                                            height: 19,
//                                            decoration: BoxDecoration(
//                                                color: AppColors.bar,
//                                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topRight: Radius.circular(5))
//                                            ),
//
//                                          ),
//                                          SizedBox(width: 10,),
//                                          Column(
//                                            children: <Widget>[
//                                              Text("₦ 0.00", style: TextStyle(fontSize: 12),),
//                                              Text("Profit", style: TextStyle(fontSize: 12))
//                                            ],
//                                          )
//                                        ],
//                                      ),
//                                    )
//
//                                  ],
//                                ),
//                              ),
//                            ),
//
//                            SizedBox(height: 10,),
//
//
//
//
//
//                          ],
//                        ),
//                        Text("activity")
//                      ],
//                    ) ,
//                  )
//                ]
//              ),
//            ),
//
//
//
//
//
//          ],
//        )
//
//      ),
//    );
  }
}

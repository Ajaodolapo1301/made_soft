import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:made_soft_logic/constants/constants.dart';
import 'package:made_soft_logic/model/customPopupMenu.dart';

import 'package:made_soft_logic/screens/page.dart';
import 'package:made_soft_logic/utils/colors.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
  CustomPopupMenu _selectedChoices;
  bool hidePassword = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  String nameOfStaff;
  var email;
  String lname;
  var password;
  var address;
  var phone;
  var staffLocation;

  bool allsalesReport = false;
  bool onlinePos = false;
  bool viewCustomer= false;
  bool addCustomer = false;



  bool productList = false;
  bool addProduct = false;
  bool costPrice= false;
  bool productService = false;



  bool restockProduct = false;
  bool deleteProduct = false;
  bool editStaff= false;
  bool viewStaff = false;


  bool salesReport = false;
  bool inventoryReport= false;
  bool expensesReport = false;

  bool profileSetting = false;



  bool editExpense= false;
  bool viewExpense = false;






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
elevation: 0.0,
        backgroundColor: Colors.white,
    leading: Icon(Icons.arrow_back, color: AppColors.primary,),
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

      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: ListView(
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
//                   SizedBox(height: 20.0,),
                  Container(

                    child: TextFormField(
                        autofocus: true,

                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: AppColors.greyBorder, fontSize: 17,),
                            focusedBorder:UnderlineInputBorder(


                              borderSide:  BorderSide(color: AppColors.greyBorder, width: 1.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffF2F2F2)
                              ),
                            ),
//
                            labelText: 'Name of Staff',

                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return ' This field can not be empty';
                          }
                          nameOfStaff = value;
                          return null;
                        }
                    ),
                  ),

                  SizedBox(height: 25.0,),
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(


                          focusedBorder:UnderlineInputBorder(


                            borderSide:  BorderSide(color: AppColors.greyBorder, width: 1.0),
                          ),


                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffF2F2F2)
                            ),
                          ),
//                    suffixIcon:   Icon(Icons.person),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: AppColors.greyBorder, fontSize: 17,)
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ' This field can not be empty';
                        }
                        email = value;
                        return null;
                      }
                  ),




                  SizedBox(height: 25.0,),
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusedBorder:UnderlineInputBorder(


                            borderSide:  BorderSide(color: AppColors.greyBorder, width: 1.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffF2F2F2)
                            ),
                          ),
                          labelText: 'Address',
                          labelStyle: TextStyle(color: AppColors.greyBorder, fontSize: 17,)
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ' This field can not be empty';
                        }
                        address = value;
                        return null;
                      }
                  ),

                  SizedBox(height: 25.0,),
                  TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(

                          focusedBorder:UnderlineInputBorder(


                            borderSide:  BorderSide(color: AppColors.greyBorder, width: 1.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffF2F2F2)
                            ),
                          ),
//
                          labelText: 'Phone No',
                          labelStyle: TextStyle(fontSize: 17, color:  AppColors.greytext)
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ' This field can not be empty';
                        }
                        phone = value;
                        return null;
                      }
                  ),
                  SizedBox(height: 25.0,),
                  TextFormField(

                    keyboardType: TextInputType.text,
                    obscureText: hidePassword,
                    decoration: InputDecoration(

                        focusedBorder:UnderlineInputBorder(


                          borderSide:  BorderSide(color: AppColors.greyBorder, width: 1.0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xffF2F2F2)
                          ),
                        ),

                        labelText: 'Password',
                        labelStyle: TextStyle(color: AppColors.greyBorder, fontSize: 17,)
//                    hintText: 'Full na
//                    hintStyle: (
                    ),
                    validator: (value) {
                      if (!(value.length > 5 && value.isNotEmpty)) {
                        return "password should contain more than 5 characters";
                      }
                      password = value;
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),

                  TextFormField(

                    showCursor: false,
//                    cursorColor: Colors.black,
                  keyboardType:  TextInputType.url,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 17, ) ,
                        disabledBorder: InputBorder.none,
                        contentPadding:
                        EdgeInsets.only( bottom: 11, top: 11, right: 15),
                        hintText: "Staff Image"),
                  ),
                  Container(
                    margin: EdgeInsets.only( top: 11),
                   width: 143,
                    height: 39,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary, width: 2),
                      borderRadius: BorderRadius.circular(9)
                    ),
                    child: Center(child: Text("Select File", style: TextStyle(color: AppColors.textColor, fontSize: 20),)),
                  ),


                  SizedBox(height: 25.0,),
                  TextFormField(
                      autofocus: true,

                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
//
                          focusedBorder:UnderlineInputBorder(


                              borderSide:  BorderSide(color: AppColors.greyBorder, width: 1.0),
//
                          ),
                          labelText: 'Select Staff Location',
                          labelStyle: TextStyle(color: AppColors.greyBorder, fontSize: 17,)
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return ' This field can not be empty';
                        }
                        staffLocation = value;
                        return null;
                      }
                  ),

                ],
              ),
            ),
SizedBox(height: 30,),
            Text("Select Staff Access Rights", style: TextStyle(color: AppColors.greytext, fontSize: 17),),
SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Access to Sales Register", style: kTextStyle,),
                    ),
                    SizedBox(height: 10,),
                    switches(
                      text: "Online Pos",
                      toggler: onlinePos
                    ),

                    switches(
                        text: "All sales report",
                        toggler: allsalesReport
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Access to Customers", style: kTextStyle,),
                    ),
                    SizedBox(height: 10,),
                    switches(
                        text: "View Customers",
                        toggler: viewCustomer
                    ),

                    switches(
                        text: "Add/Edit Customer",
                        toggler: addCustomer
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Access to Suppliers", style: kTextStyle,),
                    ),
                    SizedBox(height: 10,),
                    switches(
                        text: "View Suppliers",
                        toggler: viewCustomer
                    ),

                    switches(
                        text: "Add/Edit Suppliers",
                        toggler: addCustomer
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Access to Products and Services", style: kTextStyle,),
                    ),
                    SizedBox(height: 10,),
                    switches(
                        text: "Access to Product List",
                        toggler: productList

                    ),

                    switches(
                        text: "Add Products",
                        toggler: addProduct
                    ),

                    switches(
                        text: "View Cost Price",
                        toggler: costPrice
                    ),

                    switches(
                        text: "Edit Product/Service",
                        toggler: productService
                    ),


                    switches(
                        text: "Restock Product",
                        toggler: costPrice
                    ),

                    switches(
                        text: "Delete Product/Service",
                        toggler: productService
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Access to Staff", style: kTextStyle,),
                    ),
                    SizedBox(height: 10,),
                    switches(
                        text: "Add / Edit Staff",
                        toggler: editStaff
                    ),

                    switches(
                        text: "View Staff",
                        toggler: viewStaff
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Access to Reporting", style: kTextStyle,),
                    ),
                    SizedBox(height: 10,),
                    switches(
                        text: "Sales Report",
                        toggler: salesReport

                    ),

                    switches(
                        text: "Inventory Report",
                        toggler: inventoryReport
                    ),

                    switches(
                        text: "Expense Report",
                        toggler: expensesReport
                    ),



                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Row(
                        children: <Widget>[
                          Text("Access to Profile ", style: kTextStyle,),
                          Baseline(
                            baselineType: TextBaseline.alphabetic,
                            child: Text(
                            "(Allow Staff to Edit his/her Details)",
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            baseline: 15.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    switches(
                        text: "Update Profile Settings",
                        toggler: profileSetting),





                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text("Access to Expense", style: kTextStyle,),
                    ),
                    SizedBox(height: 10,),
                    switches(
                        text: "Add/Edit Expenses",
                        toggler: editExpense

                    ),

                    switches(
                        text: "View Expenses",
                        toggler: viewExpense
                    ),




                  ],
                ),
            SizedBox(height: 30,),
                InkWell(
                  onTap: (){
//                    if( _formkey.currentState.validate()){
//
//                    }

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  },
                  child: Center(
                    child: Container(
                      width: 143,
                      height: 39,

                      decoration: BoxDecoration(
                        color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5)

                      ),

                      child: Center(child: Text("Save", style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                )



          ],
        ),
      ),


    );
  }

  Card switches({bool toggler, String text}) {
    return Card(
                    elevation: 0.0,
                    child: Container(
                      width: 384,
                      height: 55.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(

                          children: <Widget>[
                            Text( text, style: kGreyText,),

                                    Spacer(),
                            Container(
                              height: 25,
                              width: 77,
                              child: CustomSwitch(
                                activeColor: AppColors.primary,
                                value: toggler,
                                onChanged: (value) {

                                  setState(() {
                                    toggler = value;
                                  });
                                },
                              ),
                            )
                                            ],
                        ),
                      ),
                    ),
                  );
  }
}

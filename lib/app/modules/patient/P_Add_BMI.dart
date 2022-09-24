




import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class P_Add_BMI extends StatefulWidget
{

  @override
  State<P_Add_BMI> createState() => _P_Add_BMIState();
}

class _P_Add_BMIState extends State<P_Add_BMI> {
  String _selectedDate = '';

  String _dateCount = '';

  String _range = '';

  String _rangeCount = '';


  TextEditingController vitalTypeController=TextEditingController();

  TextEditingController vitalValueController=TextEditingController();

  TextEditingController vitalDateController=TextEditingController();

  ////////////////////////////////


  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
        // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();

        //vitalDateController=_selectedDate ;

        Fluttertoast.showToast(
            msg: _selectedDate,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );


      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  /////////////////////////////










  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [




            Padding(
              padding: const EdgeInsets.fromLTRB(31, 54, 30, 15),//all(8.0),
              child: Row(
                children: [

                  Icon(Icons.arrow_back)

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(31, 0, 30, 52),//all(8.0),
              child: Row(
                children: [

                  Text("Add BMI",

                    style: TextStyle(
                        fontSize: 16
                    ),

                  )

                ],
              ),
            ),


            const SizedBox(height: 12),


            Padding(
              padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),//all(8.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: vitalTypeController,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.name,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    hintText: 'Height',
                    // enabled: controller.formOpacity == 1 ? true : false,
                    focusColor: primaryColor,
                  ),
                  // onSaved: (String? value) {
                  //   controller.name = value ?? '';
                  //   controller.refreshSignupButtonColor();
                  // },
                  // onChanged: (String? value) {
                  //   controller.name = value ?? '';
                  //   controller.refreshSignupButtonColor();
                  // },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'name is required';
                  //     goodToGo=false;
                  //
                  //   }else{
                  //     goodToGo=true;
                  //   }
                  // return null;
                  // },
                ),
              ),
            ),
            const SizedBox(height: 20),

            ///////////////////////////////////////////



            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),
              //all(8.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: vitalValueController,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    hintText: 'Weight ',
                    // enabled: controller.formOpacity == 1 ? true : false,
                    focusColor: primaryColor,
                  ),
                  // onSaved: (String? value) {
                  //   controller.name = value ?? '';
                  //   controller.refreshSignupButtonColor();
                  // },
                  // onChanged: (String? value) {
                  //   controller.name = value ?? '';
                  //   controller.refreshSignupButtonColor();
                  // },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'name is required';
                  //     goodToGo=false;
                  //
                  //   }else{
                  //     goodToGo=true;
                  //   }
                  // return null;
                  // },
                ),
              ),
            ),
            const SizedBox(height: 20),






            /////////////////////////////////////////

            Padding(
              padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),
              //all(8.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: vitalDateController,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.datetime,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2.0),




                    ),
                    hintText: 'Date ',
                    // enabled: controller.formOpacity == 1 ? true : false,
                    focusColor: primaryColor,
                  ),
                  // onSaved: (String? value) {
                  //   controller.name = value ?? '';
                  //   controller.refreshSignupButtonColor();
                  // },
                  // onChanged: (String? value) {
                  //   controller.name = value ?? '';
                  //   controller.refreshSignupButtonColor();
                  // },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'name is required';
                  //     goodToGo=false;
                  //
                  //   }else{
                  //     goodToGo=true;
                  //   }
                  // return null;
                  // },
                ),
              ),
            ),
            const SizedBox(height: 20),





            ///////////////////////////////////////







            const SizedBox(height: 12),
            /*Padding(
              padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),//all(8.0),
              child: SizedBox(
                height: 300,

                child:  SfDateRangePicker(
                          onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.single,
                        initialSelectedRange: PickerDateRange(
                            DateTime.now().subtract(const Duration(days: 4)),
                            DateTime.now().add(const Duration(days: 3))),
                      ),

                // child: TextFormField(
                //   controller: vitalDateController,
                //   cursorColor: primaryColor,
                //   keyboardType: TextInputType.datetime,
                //   textAlignVertical: TextAlignVertical.bottom,
                //   decoration: InputDecoration(
                //     border: const OutlineInputBorder(
                //       borderSide: BorderSide(color: primaryColor, width: 2.0),
                //     ),
                //     enabledBorder: const OutlineInputBorder(
                //       borderSide: BorderSide(color: primaryColor, width: 1.0),
                //     ),
                //     focusedBorder:const OutlineInputBorder(
                //       borderSide: BorderSide(color: primaryColor, width: 2.0),
                //
                //       ////////////////////////////
                //
                //
                //
                //       // SfDateRangePicker(
                //       //   onSelectionChanged: _onSelectionChanged,
                //       //   selectionMode: DateRangePickerSelectionMode.range,
                //       //   initialSelectedRange: PickerDateRange(
                //       //       DateTime.now().subtract(const Duration(days: 4)),
                //       //       DateTime.now().add(const Duration(days: 3))),
                //       // ),
                //
                //
                //
                //
                //       ////////////////////////////
                //
                //
                //
                //
                //     ),
                //     hintText: 'Date',
                //     // enabled: controller.formOpacity == 1 ? true : false,
                //     focusColor: primaryColor,
                //   ),
                //   // onSaved: (String? value) {
                //   //   controller.name = value ?? '';
                //   //   controller.refreshSignupButtonColor();
                //   // },
                //   // onChanged: (String? value) {
                //   //   controller.name = value ?? '';
                //   //   controller.refreshSignupButtonColor();
                //   // },
                //   // validator: (value) {
                //   //   if (value == null || value.isEmpty) {
                //   //     return 'name is required';
                //   //     goodToGo=false;
                //   //
                //   //   }else{
                //   //     goodToGo=true;
                //   //   }
                //   // return null;
                //   // },
                // ),
              ),
            ),
            const SizedBox(height: 20),*/





            ////////////////////////////////////






          ],
        ),
      ),
    );
  }
}
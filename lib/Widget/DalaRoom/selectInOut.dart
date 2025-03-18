import 'package:book_hotel/Core/Constant/color.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Controller/DataRoom/dataRoom_Controllrt.dart';
import 'btnRoomTraveler.dart';

class SelectInOut extends StatelessWidget {
  final String? title;
  final int? numTravelers;
  final String? img;
  final DateTime? date;
  final double width;
  final int typeDate1OrTravelers2;
  final double PL;
  final double PR;
  final Color color;

  SelectInOut({
    Key? key,
    required this.title,
    required this.date,
    required this.width,
    this.numTravelers,
    required this.typeDate1OrTravelers2,
    required this.color,
    this.img,
    required this.PL,
    required this.PR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataRoom_Controller dataRoom_Controller =
        Get.put(DataRoom_Controller());

    return InkWell(
      child: Container(
          margin: EdgeInsets.only(left: PL, right: PR),
          decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(10)),
          width: width,
          child: ListTile(
              leading: Image.asset(img!, height: 30, color: color),
              title: Text(
                "$title",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 13, color: ColorApp.blackdark),
              ),
              subtitle: typeDate1OrTravelers2 == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          DateFormat('MM/dd/yyyy').format(date!),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontSize: 10, color: ColorApp.primaryColor),
                        ),
                      ],
                    )
                  : Text("$numTravelers",
                      style: TextStyle(color: color.withOpacity(0.8))))),
      onTap: () {
        Get.bottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            isScrollControlled: false,
            backgroundColor: Colors.white,
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2050),
                  selectedDayHighlightColor: ColorApp.primaryColor,
                  centerAlignModePicker: true,
                  calendarType: CalendarDatePicker2Type.range,
                  dayBorderRadius: BorderRadius.circular(5),
                  dayTextStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 13, color: ColorApp.blacklight),
                  yearTextStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 13, color: ColorApp.blacklight)),
              value: dataRoom_Controller.ListDatevalue,
              onValueChanged: (dates) {
                dataRoom_Controller.rfsh();
                dataRoom_Controller.ListDatevalue = dates;

                dataRoom_Controller.checkin =
                    dataRoom_Controller.ListDatevalue.first!;
                dataRoom_Controller.checkout =
                    dataRoom_Controller.ListDatevalue.last!;
                dataRoom_Controller.daysDifference == null
                    ? 0
                    : dataRoom_Controller.daysDifference = dataRoom_Controller
                        .checkout
                        .difference(dataRoom_Controller.checkin)
                        .inDays;

                print(
                    "00000000000000${dataRoom_Controller.ListDatevalue.first}");
                print(
                    "00000000000000${dataRoom_Controller.ListDatevalue.last}");
              },
            ));
      },
    );
  }
}

//اريد حفظ السعر بضربه ب

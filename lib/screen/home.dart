import 'package:cupertino_picker_module/widget/bottomwavy_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? date;
  String? time;
  String? dateTime;
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedDateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(60)),
                    gradient: LinearGradient(colors: [
                      Colors.blue.shade600,
                      Colors.blue.shade400,
                      Colors.blue.shade300
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black,
                          child: Text(
                            'CP',
                            style: TextStyle(color: Colors.deepOrange.shade700),
                            textScaleFactor: 2.5,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Cupertino',
                              style: TextStyle(fontSize: 40),
                            ),
                            Text(
                              'Picker',
                              style: TextStyle(fontSize: 40),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: CustomPaint(
                    size: Size(
                        MediaQuery.of(context).size.width,
                        (MediaQuery.of(context).size.width * 0.3402777777777778)
                            .toDouble()),
                    painter: BottomWaveShapePainter(),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await pickDate(context);
                          selectedDate != null
                              ? setState(() {
                                  date = selectedDate!.day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '/' +
                                      selectedDate!.month
                                          .toString()
                                          .padLeft(2, '0') +
                                      '/' +
                                      selectedDate!.year.toString();
                                })
                              : date;
                        },
                        child: SizedBox(
                          height: 65,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.8 -
                                        10,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 25),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(60),
                                        ),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.8),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x336E87D2),
                                            blurRadius: 5,
                                            offset: Offset(1, 5),
                                          ),
                                        ]),
                                    child: Row(
                                      children: [
                                        Text(
                                          date ?? 'Select a date',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: date == null
                                                  ? Colors.grey
                                                  : Colors.black),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              selectedDate != null
                                  ? Positioned(
                                      top: 2,
                                      left: 25,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: const Text(
                                          'Date',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await pickTime(context);
                          selectedTime != null
                              ? setState(() {
                                  time = (selectedTime!.hour > 12
                                          ? (selectedTime!.hour - 12)
                                              .toString()
                                              .padLeft(2, '0')
                                          : selectedTime!.hour
                                              .toString()
                                              .padLeft(2, '0')) +
                                      ':' +
                                      selectedTime!.minute
                                          .toString()
                                          .padLeft(2, '0') +
                                      ' ' +
                                      (selectedTime!.hour >= 12 ? 'PM' : 'AM');
                                })
                              : time;
                        },
                        child: SizedBox(
                          height: 65,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.8 -
                                        10,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 25),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(60),
                                        ),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.8),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x336E87D2),
                                            blurRadius: 4,
                                            offset: Offset(2, 5),
                                          ),
                                        ]),
                                    child: Row(
                                      children: [
                                        Text(
                                          time ?? 'Select Time',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: time == null
                                                  ? Colors.grey
                                                  : Colors.black),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          size: 17,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              selectedTime != null
                                  ? Positioned(
                                      top: 2,
                                      left: 25,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: const Text(
                                          'Time',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await pickDateTime(
                            context,
                          );
                          selectedDateTime != null
                              ? setState(() {
                                  dateTime = selectedDateTime!.day
                                          .toString()
                                          .padLeft(2, '0') +
                                      '/' +
                                      selectedDateTime!.month
                                          .toString()
                                          .padLeft(2, '0') +
                                      '/' +
                                      selectedDateTime!.year.toString() +
                                      '  ' +
                                      (selectedDateTime!.hour > 12
                                          ? (selectedDateTime!.hour - 12)
                                              .toString()
                                              .padLeft(2, '0')
                                          : selectedDateTime!.hour
                                              .toString()
                                              .padLeft(2, '0')) +
                                      ':' +
                                      selectedDateTime!.minute
                                          .toString()
                                          .padLeft(2, '0') +
                                      ' ' +
                                      (selectedDateTime!.hour >= 12
                                          ? 'PM'
                                          : 'AM');
                                })
                              : dateTime;
                        },
                        child: SizedBox(
                          height: 65,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                            0.8 -
                                        10,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 25),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(60),
                                        ),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.8),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x336E87D2),
                                            blurRadius: 4,
                                            offset: Offset(2, 5),
                                          ),
                                        ]),
                                    child: Row(
                                      children: [
                                        Text(
                                          dateTime ?? 'Select Date and Time',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: dateTime == null
                                                  ? Colors.grey
                                                  : Colors.black),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              selectedDate != null
                                  ? Positioned(
                                      top: 2,
                                      left: 25,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: const Text(
                                          'Date Time',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  pickTime(context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.35,
              horizontal: MediaQuery.of(context).size.width * 0.2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 3),
                ],
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (value) {
                  if (value != selectedDateTime) {
                    setState(() {
                      selectedTime = value;
                    });
                  }
                },
                initialDateTime: selectedTime ?? DateTime.now(),
              ),
            ),
          );
        });
  }

  pickDate(context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.35,
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              // height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 3),
                ],
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  if (value != selectedDate) {
                    setState(() {
                      selectedDate = value;
                    });
                  }
                },
                initialDateTime: DateTime(2021),
                minuteInterval: 15,
              ),
            ),
          );
        });
  }

  pickDateTime(context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.35,
              horizontal: MediaQuery.of(context).size.width * 0.08,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 3),
                ],
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                onDateTimeChanged: (value) {
                  if (value != selectedDateTime) {
                    setState(() {
                      selectedDateTime = value;
                    });
                  }
                },
                initialDateTime: selectedDateTime ?? DateTime.now(),
                //minuteInterval: 15,
              ),
            ),
          );
        });
  }
}

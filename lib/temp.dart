// // ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
// import 'package:flutter/material.dart';
//
// import '../Constraints/constants.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import 'AttendanceDetails.dart';
//
// class CalendarScreen extends StatefulWidget {
//   const CalendarScreen({Key? key}) : super(key: key);
//   void initState() {}
//
//   @override
//   State<CalendarScreen> createState() => _CalendarScreenState();
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   // DateTime selectedDate = DateTime.now();
//   // DateTime initialDate = DateTime.now();
//
//   List dates = [
//     {"date": DateTime.utc(2022, 4, 29), "color": "blue"},
//     {"date": DateTime.utc(2022, 4, 30), "color": "red"},
//     {"date": DateTime.utc(2022, 4, 28), "color": "green"},
//   ];
//
//   CalendarFormat format = CalendarFormat.month;
//
//   // DateTime selectedDay = DateTime.utc(2022, 4, 29);
//   DateTime focusedDay = DateTime.now();
//
//   DateTime selectedDay1 = DateTime.now();
//   DateTime focusedDay1 = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back_rounded,
//               color: kPrimaryPurpleColor,
//               size: 25.0,
//             ),
//             onPressed: () {
//               // print(map2);
//               // dates.map((e) => print(e));
//               // if (kDebugMode) {
//               //   print('dates');
//               // }
//               // print(dates[2]["date"]);
//             },
//           ),
//         ),
//         body: NotificationListener<OverscrollIndicatorNotification>(
//           onNotification: (OverscrollIndicatorNotification overscroll) {
//             // ignore: deprecated_member_use
//             overscroll.disallowGlow();
//             return false;
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "My Attendance",
//                     style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: kPrimaryPurpleColor),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                       height: MediaQuery.of(context).size.height * 0.5,
//                       width: MediaQuery.of(context).size.width * 1,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       child: TableCalendar(
//                         //calendarBuilders: ,
//                         // holidayPredicate:_holidays,
//                         focusedDay: dates[1]["date"],
//                         //focusedDay: dates[0]["date"],
//                         firstDay: DateTime(1990),
//                         lastDay: DateTime(2030),
//                         calendarFormat: format,
//                         // eventLoader: ,
//                         // onFormatChanged: (CalendarFormat _format) {
//                         //   setState(() {
//                         //     format = _format;
//                         //   });
//                         // },
//                         daysOfWeekVisible: true,
//                         onDaySelected: (DateTime selectDay, DateTime focusDay) {
//                           setState(() {
//                             dates[1]["date"] = selectDay;
//                             focusedDay = focusDay;
//                           });
//                           // Navigator.of(context).push(MaterialPageRoute(
//                           //     builder: (context) => AttendanceDetails()));
//                         },
//                         selectedDayPredicate: (DateTime date) {
//                           return isSameDay(dates[1]["date"], date);
//                         },
//
//                         calendarStyle: CalendarStyle(
//                           isTodayHighlighted: true,
//                           // weekendDecoration: BoxDecoration(
//                           //   color: Colors.pink.shade100,
//                           //   shape: BoxShape.circle,
//                           // ),
//                           selectedDecoration: BoxDecoration(
//                               color: Colors.green.shade50,
//                               shape: BoxShape.circle),
//                           selectedTextStyle:
//                           TextStyle(color: Colors.green.shade600),
//                           todayDecoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             shape: BoxShape.circle,
//                           ),
//                           todayTextStyle:
//                           TextStyle(color: Colors.grey.shade600),
//                           holidayDecoration: BoxDecoration(
//                             color: Color.fromARGB(255, 209, 7, 78),
//                             shape: BoxShape.circle,
//                           ),
//                           holidayTextStyle:
//                           TextStyle(color: Colors.pink.shade600),
//                         ),
//                         headerStyle: HeaderStyle(
//                           formatButtonVisible: false,
//                           formatButtonShowsNext: true,
//                         ),
//                       )),
//                   // RaisedButton(
//                   //   onPressed: () {
//                   //     Navigator.of(context).push(MaterialPageRoute(
//                   //         builder: (context) => TableEventsExample()));
//                   //   },
//                   //   child: Text("Next"),
//                   // ),
//
//                   // Calendar 2
//
//                   Container(
//                       height: MediaQuery.of(context).size.height * 0.5,
//                       width: MediaQuery.of(context).size.width * 1,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                       ),
//                       child: TableCalendar(
//                         focusedDay: selectedDay1,
//                         firstDay: DateTime(1990),
//                         lastDay: DateTime(2030),
//                         calendarFormat: format,
//                         daysOfWeekVisible: true,
//                         onDaySelected: (DateTime selectDay, DateTime focusDay) {
//                           setState(() {
//                             selectedDay1 = selectDay;
//                             focusedDay1 = focusDay;
//                           });
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => AttendanceDetails()));
//                         },
//                         selectedDayPredicate: (DateTime date) {
//                           return isSameDay(selectedDay1, date);
//                         },
//                         calendarStyle: CalendarStyle(
//                           isTodayHighlighted: true,
//                           todayDecoration: BoxDecoration(
//                               color: Colors.transparent,
//                               shape: BoxShape.circle),
//                           todayTextStyle:
//                           TextStyle(color: Colors.yellow.shade600),
//                           selectedDecoration: BoxDecoration(
//                             color: Colors.red.shade50,
//                             shape: BoxShape.circle,
//                           ),
//                           selectedTextStyle:
//                           TextStyle(color: Colors.red.shade600),
//                           holidayDecoration: BoxDecoration(
//                             color: Colors.pink.shade100,
//                             shape: BoxShape.circle,
//                           ),
//                           holidayTextStyle:
//                           TextStyle(color: Colors.pink.shade600),
//                         ),
//                         headerStyle: HeaderStyle(
//                           formatButtonVisible: false,
//                           formatButtonShowsNext: true,
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
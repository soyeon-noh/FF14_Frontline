import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  const MainCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
         child: TableCalendar(
           firstDay: DateTime.utc(2010, 10, 16),
           lastDay: DateTime.utc(2030, 3, 14),
           focusedDay: DateTime.now(),

           headerStyle: HeaderStyle(
             formatButtonVisible: false,
             titleCentered: true,
             leftChevronVisible: true,
             rightChevronVisible: true,

             leftChevronIcon: const Icon(
               Icons.chevron_left,
               color: Colors.white,
             ),
             rightChevronIcon: const Icon(
               Icons.chevron_right,
               color: Colors.white,
             ),
           ),

           locale: 'ko-KR',
           daysOfWeekHeight: 30,

           calendarStyle: CalendarStyle(
             outsideDaysVisible : false,
             weekendTextStyle : const TextStyle(color: const Color.fromRGBO(180, 180, 180, 1.0)),
           )
             
             

         ),
        ),
        Container(
          child: Text("봉인된 바위섬")
        )
      ],
    );
  }
}

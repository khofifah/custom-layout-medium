import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController calendarController = CalendarController();

  @override
  void dispose() {
    calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Calendar'),
      ),
      body: TableCalendar(
        calendarController: calendarController,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableGestures: AvailableGestures.verticalSwipe,
        // availableCalendarFormats: {
        //   CalendarFormat.month: 'bulan',
        //   CalendarFormat.week: 'minggu',
        // },
        // initialSelectedDay: DateTime(2020, 12, 1),
        // initialCalendarFormat: CalendarFormat.twoWeeks,
        calendarStyle: CalendarStyle(
          weekendStyle: TextStyle(color: Colors.blue),
          holidayStyle: TextStyle(color: Colors.blue),
          weekdayStyle: TextStyle(color: Colors.orange),
          todayStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          // todayColor: Colors.yellow,
          selectedColor: Colors.yellow,
        ),
        headerStyle: HeaderStyle(
          centerHeaderTitle: false,
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
          leftChevronIcon: Icon(Icons.home),
          rightChevronIcon: Icon(Icons.home),
          headerPadding: EdgeInsets.all(10),
          headerMargin: EdgeInsets.all(10),
          titleTextStyle: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

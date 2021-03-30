import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController calendarController = CalendarController();
  List dataEvents;
  DateTime dateEvent;
  var events = {
    DateTime(2021, 02, 22): ['lala', 'lili'],
    DateTime(2021, 02, 23): ['lulu', 'lele'],
  };

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
      body: Column(
        children: [
          TableCalendar(
            events: events,
            calendarController: calendarController,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableGestures: AvailableGestures.verticalSwipe,
            // availableCalendarFormats: {
            //   CalendarFormat.month: 'bulan',
            //   CalendarFormat.week: 'minggu',
            // },
            // initialSelectedDay: DateTime(2020, 12, 1),

            initialCalendarFormat: CalendarFormat.month,
            // headerVisible: false,
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
            onDaySelected: (date, events, holidays) {
              setState(() {
                dataEvents = events;
                dateEvent = date;
              });
            },
          ),
          dataEvents == null || dataEvents.length == 0
              ? SizedBox()
              : Column(
                  children: dataEvents.map(
                    (e) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(e),
                      );
                    },
                  ).toList(),
                ),
        ],
      ),
    );
  }
}

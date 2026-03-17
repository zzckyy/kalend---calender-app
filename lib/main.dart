import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const kalendUI());
}

class kalendUI extends StatefulWidget {
  const kalendUI({super.key});

  @override
  State<kalendUI> createState() => _kalendUIState();
}

class _kalendUIState extends State<kalendUI> {
  DateTime nowadays = DateTime.now();
  DateTime? _selectedDay;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalend',
      theme: ThemeData(primarySwatch: Colors.blue),

      home: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   // title: const Text('Kalend'),
        // ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: TableCalendar(
                    focusedDay: nowadays,
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        nowadays = focusedDay;
                      });
                    },

                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // untuk nambah event tanggal
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

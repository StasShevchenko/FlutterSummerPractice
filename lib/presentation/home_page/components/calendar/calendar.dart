import 'package:flutter/material.dart';
import 'package:flutter_summer_practice/presentation/home_page/components/calendar/active_calendar_day.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../theme/app_colors.dart';

class Calendar extends StatelessWidget {
  final String startTime;
  final String endTime;
  final bool isActive;

  const Calendar(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('MM/dd/yyyy');
    DateTime startDate = dateFormat.parse(startTime).toUtc();
    DateTime endDate = dateFormat.parse(endTime).toUtc();
    return TableCalendar(
      daysOfWeekHeight: 32,
      locale: 'ru',
      headerStyle: const HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 22)),
      calendarStyle:
          const CalendarStyle(defaultTextStyle: TextStyle(color: Colors.black)),
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarBuilders: CalendarBuilders(todayBuilder: (context, day, _) {
        if (day.compareTo(startDate) >= 0 &&
            day.compareTo(endDate.add(const Duration(days: 1))) <= 0) {
          return ActiveCalendarDay(dayNumber: day.day.toString());
        }
      }, defaultBuilder: (context, day, focusedDay) {
        if (day.compareTo(startDate) >= 0 &&
            day.compareTo(endDate.add(const Duration(days: 1))) <= 0) {
          return ActiveCalendarDay(dayNumber: day.day.toString());
        }
      }),
    );
  }
}

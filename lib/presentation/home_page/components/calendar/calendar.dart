import 'dart:ffi';

import 'package:flutter/material.dart';
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
    DateTime startDate = dateFormat.parse(startTime);
    DateTime endDate = dateFormat.parse(endTime);

    return TableCalendar(
      locale: 'ru',
      headerStyle: HeaderStyle(titleCentered: true, formatButtonVisible: false),
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarBuilders: CalendarBuilders(todayBuilder: (context, day, _) {
        if (day.compareTo(startDate) >= 0 &&
            day.compareTo(endDate.add(const Duration(days: 1))) <= 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryAccentRed,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }
      }, defaultBuilder: (context, day, focusedDay) {
        if (day.compareTo(startDate) >= 0 &&
            day.compareTo(endDate.add(const Duration(days: 1))) <= 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryAccentRed,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}

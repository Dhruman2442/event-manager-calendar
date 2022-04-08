import 'package:calendar/events/data_source.dart';
import 'package:calendar/events/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart'
    show CalendarAppointmentDetails, CalendarView, SfCalendar;
import 'package:syncfusion_flutter_core/theme.dart'
    show SfCalendarTheme, SfCalendarThemeData;

class TasksWidget extends StatefulWidget {
  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOffSelectedDate;
    if (selectedEvents.isEmpty) {
      return const Center(
        child: Text(
          'No Events Found',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      );
    }
    return SfCalendarTheme(
      data: SfCalendarThemeData(
          timeTextStyle: const TextStyle(fontSize: 16, color: Colors.black)),
      child: SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        selectionDecoration: const BoxDecoration(color: Colors.transparent),
        todayHighlightColor: Colors.black,
      ),
    );
  }

  //The appointmentbuilder here defines each event and how the task-widget represents it
  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final event = details.appointments.first;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: Colors.red.shade100,

        // color: event.backgroundColor.withOPactiy(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          event.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

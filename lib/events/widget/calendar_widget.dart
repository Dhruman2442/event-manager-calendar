import 'package:calendar/events/provider/event_provider.dart';
import 'package:calendar/events/widget/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../data_source.dart';

class calendarwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return SfCalendar(
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      initialDisplayDate: DateTime.now(),
      cellBorderColor: Colors.teal,
      appointmentBuilder: appointmentBuilder,
      //on long pressing a particular date with and event added, there will be a bottom pop up on the screen showing us the vent on a particular time.
      //The bas will be represented  as per the time perspective.
      onLongPress: (details) {
        // As per the shown here the Event Provider is used for replicating the presented data so that a particular event can be formed.
        final provider = Provider.of<EventProvider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(
            context: context, builder: (context) => TasksWidget());
      },
    );
  }

  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final event = details.appointments.first;
    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: Colors.lightGreen.shade100,

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

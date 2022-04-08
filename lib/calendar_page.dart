import 'package:calendar/events/provider/event_provider.dart';
import 'package:calendar/events/widget/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'events/add_event_page.dart';

class calendar_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "BuddyExpense",
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text(
              "Calendar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
          ),
          floatingActionButton: floatactions_add_event(),
          body: calendarwidget(),
        ),
      ),
    );
  }
}

//The floating icon button will help in  adding any kind of event onto the calendar, as it redirects onto the adding event page.
class floatactions_add_event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => add_event())),
      backgroundColor: Colors.white,
      child: const Icon(Icons.add),
      foregroundColor: Colors.black,
    );
  }
}

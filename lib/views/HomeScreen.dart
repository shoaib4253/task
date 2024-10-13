import 'package:api_learning/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/CustomDrawer.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Full screen grey background
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        // Make the entire content scrollable
        child: Column(
          children: [
            SizedBox(height: 16),
            _buildCalendarHeader(), // Separate Calendar header section
            SizedBox(height: 16),
            _buildCalendarCard(), // Separate Calendar widget inside a card
            SizedBox(height: 16),
            _buildSchedule(), // New Schedule section added here
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // This widget will only handle the "Calendar" text and the row below it
  Widget _buildCalendarHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Calendar",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          'Month',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Week',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.grey[400],
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Day',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      // Add button functionality here
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Wrapping only the calendar in a card
  Widget _buildCalendarCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.white, // Setting the background color to white
        elevation: 2, // Adding elevation to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildCalendar(), // This holds the calendar widget separately
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2023, 12, 31),
      focusedDay: DateTime.utc(2021, 6, 15),
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(fontSize: 16, color: Colors.grey),
        weekendStyle: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        defaultDecoration: BoxDecoration(
          color: Colors.transparent, // Transparent background for default days
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        todayDecoration: BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        markerDecoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        markersMaxCount: 1,
        defaultTextStyle: TextStyle(fontSize: 16, color: Colors.black),
        weekendTextStyle: TextStyle(fontSize: 16, color: Colors.black),
        markersAlignment: Alignment.bottomCenter,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return Center(
            child: Container(
              width: 40, // Width of the container
              height: 40, // Height of the container
              decoration: BoxDecoration(
                color: Colors.transparent, // Transparent by default
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Center(
                child: Text('${day.day}', style: TextStyle(fontSize: 16)),
              ),
            ),
          );
        },
        selectedBuilder: (context, day, focusedDay) {
          return Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Center(
                child: Text('${day.day}',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          return Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              child: Center(
                child: Text('${day.day}',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          );
        },
        markerBuilder: (context, day, events) {
          return events.isNotEmpty
              ? Positioned(
                  bottom: 6,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : SizedBox();
        },
      ),
      selectedDayPredicate: (day) {
        return isSameDay(day, DateTime.utc(2021, 6, 15));
      },
      eventLoader: (day) {
        if ([
          DateTime.utc(2021, 6, 15),
          DateTime.utc(2021, 6, 20),
          DateTime.utc(2021, 6, 25)
        ].contains(day)) {
          return [1];
        }
        return [];
      },
    );
  }

  // New method to build the schedule section
  Widget _buildSchedule() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Upcoming ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TimeSlotCard(
            time: "07:00",
            title: "Brandbook and Guidebook",
            type: "Design",
            startTime: "07:00",
            participants: [
              'assets/images/avatar1.svg',
              'assets/images/avatar2.svg',
              'assets/images/avatar3.svg',
              'assets/images/avatar4.svg',
              'assets/images/avatar5.svg',
            ],
            taskColor: Colors.orange,
          ),
          SizedBox(height: 8),
          CurrentTimeIndicator(time: "08:00"),
          SizedBox(height: 8),
          TimeSlotCard(
            time: "08:31",
            title: "App Development",
            type: "Coding",
            startTime: "08:34",
            participants: [
              'assets/images/avatar1.svg',
              'assets/images/avatar2.svg',
              'assets/images/avatar3.svg',
            ],
            taskColor: Colors.green,
          ),
          SizedBox(height: 8),
          TimeSlotCard(
            time: "10:00",
            title: "Landing Page",
            type: "Meeting",
            startTime: "10:00",
            participants: [
              'assets/images/avatar2.svg',
              'assets/images/avatar3.svg',
              'assets/images/avatar4.svg',
              'assets/images/avatar5.svg',
            ],
            taskColor: Colors.purple,
          ),
          SizedBox(height: 8),
          TimeSlotCard(
            time: "11:30",
            title: 'Project "Rocket"',
            type: "Meeting",
            startTime: "11:30",
            participants: [
              'assets/images/avatar3.svg',
              'assets/images/avatar4.svg',
            ],
            taskColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class TimeSlotCard extends StatelessWidget {
  final String time;
  final String title;
  final String type;
  final String startTime;
  final List<String> participants;
  final Color taskColor;

  TimeSlotCard({
    required this.time,
    required this.title,
    required this.type,
    required this.startTime,
    required this.participants,
    required this.taskColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time text on the left
        Text(time, style: TextStyle(fontSize: 16, color: Colors.grey)),
        SizedBox(width: 16),

        // Main content container
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Task color stripe
                Container(
                  width: 6, // Set the width of the stripe
                  height: 90, // Adjust height as needed
                  color: taskColor,
                  margin: EdgeInsets.only(right: 16), // Spacing to the right
                ),
                // Right side content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Type and Start Time
                      Row(
                        children: [
                          Text(
                            type,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.timelapse, size: 16),
                          SizedBox(width: 8),
                          Text(
                            startTime,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Participants
                      Row(
                        children: participants
                            .map((participant) => Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CircleAvatar(
                                    radius: 16,
                                    child: SvgPicture.asset(
                                      participant,
                                      height: 32, // Adjust height as needed
                                      width: 32, // Adjust width as needed
                                      fit: BoxFit
                                          .cover, // Fit the SVG to the circle
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CurrentTimeIndicator extends StatelessWidget {
  final String time;

  CurrentTimeIndicator({required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(time, style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 2,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({Key key}) : super(key: key);

  @override
  _CalenderWidgetState createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTimeRange calendarSelectedDay;

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 100, 10, 450),
        child: FlutterFlowCalendar(
          color: FlutterFlowTheme.of(context).primaryColor,
          weekFormat: true,
          weekStartsMonday: false,
          onChange: (DateTimeRange newSelectedDate) {
            setState(() => calendarSelectedDay = newSelectedDate);
          },
          titleStyle: TextStyle(),
          dayOfWeekStyle: TextStyle(),
          dateStyle: TextStyle(),
          selectedDateStyle: TextStyle(),
          inactiveDateStyle: TextStyle(),
        ),
      ),
    );
  }
}

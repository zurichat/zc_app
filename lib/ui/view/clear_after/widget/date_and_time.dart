import 'package:flutter/material.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({Key? key}) : super(key: key);

  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController dateController = TextEditingController(text: 'Today');
  TextEditingController timeController = TextEditingController(text: '2:00 PM');

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        dateController.text = '${picked.toLocal()}'.split(' ')[0];
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime)
      setState(() {
        timeController.text = '${picked.format(context)}';
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: const InputDecoration(
            labelText: 'Date',
            suffix: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        TextField(
          controller: timeController,
          onTap: () => _selectTime(context),
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'Time',
            suffix: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
      ],
    );
  }
}

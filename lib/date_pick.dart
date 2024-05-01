import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Selected Date: ${_selectedDate.toString()}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          IconButton(
            onPressed: () => _selectDate(context),
            icon: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

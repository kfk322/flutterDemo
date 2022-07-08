import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateFormatPage extends StatefulWidget {
  const DateFormatPage({Key? key}) : super(key: key);

  @override
  State<DateFormatPage> createState() => _DateFormatPageState();
}

class _DateFormatPageState extends State<DateFormatPage> {
  DateTime _nowDate = DateTime(2022, 05, 20);
  DateTime _nowDate2 = DateTime(2022, 05, 20);
  TimeOfDay _nowTime = TimeOfDay(hour: 13, minute: 55);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(formatDate(now, [yyyy, '-', mm, '-', dd]));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Date Format Page")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2018, 5, 20),
                    maxTime: DateTime(2023, 5, 20), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  setState(() {
                    _nowDate2 = date;
                  });
                }, currentTime: DateTime.now(), locale: LocaleType.zh);
              },
              child: Text(
                  "${_nowDate2.year} - ${_nowDate2.month} - ${_nowDate2.day}"),
            ),
            Divider(),
            InkWell(
                onTap: () async {
                  TimeOfDay? timeNow = await showTimePicker(
                      context: context, initialTime: _nowTime);
                  setState(() {
                    _nowTime = timeNow!;
                  });
                },
                child: Text('${_nowTime.format(context)}')),
            InkWell(
              onTap: () async {
                DateTime? result = await showDatePicker(
                    context: context,
                    initialDate: _nowDate,
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2023));

                setState(() {
                  _nowDate = result!;
                });
              },
              //.then((value) => print(value)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${_nowDate.year} / ${_nowDate.month} / ${_nowDate.day}'),
                ],
              ),
            )
          ],
        ),
      );
}

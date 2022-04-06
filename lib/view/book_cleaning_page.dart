import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carbon_footprint/view/home_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect/multiselect.dart';

import '../helper/extension.dart';
import '../helper/themes.dart';
import '../model/date_time_model.dart';
import 'common_bottom_navigation_bar.dart';

class BookCleaningPage extends StatefulWidget {
  const BookCleaningPage({Key? key}) : super(key: key);
  @override
  State<BookCleaningPage> createState() => _BookCleaningPageState();
}

class _BookCleaningPageState extends State<BookCleaningPage> {
  final List<String> _locationList = [
    "Bathroom-GF",
    "Bathroom-1F",
    "Room-1",
    "Room-2",
    "Room-3",
    "Reception-1",
    "Reception-2",
    "Reception-3"
  ];
  String? _selectedLocation;
  final List<String> _routineList = [
    "Custom",
    "Daily",
    "Weekly",
  ];
  String? _selectedRoutine;
  List<DateTimeModel>? _customDates;
  TimeOfDay? _selectedTime;
  List<String> _selectedWeek = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Book a cleaning',
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        resizeToAvoidBottomInset: false,
        body: _mainView());
  }

  _mainView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            DropdownSearch<String>(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Location",
                labelStyle: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w500),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                border: const OutlineInputBorder(),
              ),
              searchFieldProps: TextFieldProps(
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(),
                ),
              ),
              selectedItem: _selectedLocation,
              mode: Mode.DIALOG,
              // showSelectedItem: false,
              items: _locationList,
              itemAsString: (String? location) => (location ?? ''),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedLocation = value;
                  });
                }
              },
              showSearchBox: true,
              validator: (value) {
                if (value == null) {
                  return "Please select location";
                }
                return null;
              },
              filterFn: (instance, filter) {
                if (instance.toLowerCase().contains(filter.toLowerCase())) {
                  debugPrint(filter);
                  return true;
                } else {
                  return false;
                }
              },
              popupItemBuilder: (context, String location, bool isSelected) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownMenuItem<String>(
                    value: location,
                    child: Text(
                      location,
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField<String>(
              // Initial Value
              value: _selectedRoutine,
              decoration: InputDecoration(
                labelText: "Cleaning Routine",
                labelStyle: GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w500),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                border: const OutlineInputBorder(),
              ),
              // Down Arrow Icon
              icon: const Icon(Icons.arrow_drop_down_sharp),

              // Array list of items
              items: _routineList.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRoutine = newValue!;
                });
              },
            ),
            if (_selectedRoutine == _routineList[0])
              const SizedBox(
                height: 15,
              ),
            if (_selectedRoutine == _routineList[0])
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width(context), 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.green)),
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    _selectDate();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_circle_outline_rounded,
                            color: Colors.green),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add date",
                          style: GoogleFonts.montserrat(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )),
            if (_selectedRoutine == _routineList[2])
              DropDownMultiSelect(
                onChanged: (List<String> values) {
                  setState(() {
                    _selectedWeek = values;
                  });
                },
                options: const [
                  'Sunday',
                  'Monday',
                  'Tuesday',
                  'Thursday',
                  'Friday',
                  'Saturday'
                ],
                selectedValues: _selectedWeek,
                whenEmpty: 'Select Day',
              ),
            if (_selectedRoutine == _routineList[1])
              const SizedBox(
                height: 15,
              ),
            if (_selectedRoutine == _routineList[1] ||
                _selectedRoutine == _routineList[2])
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width(context), 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.grey)),
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  onPressed: () {
                    _selectTime();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          _selectedTime == null
                              ? "Set Time"
                              : Themes.timeToString(tod: _selectedTime!),
                          style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )),
            if (_selectedRoutine == _routineList[0] && _customDates != null)
              ListView.separated(
                padding: const EdgeInsets.only(top: 15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _customDates?.length ?? 0,
                itemBuilder: (context, index) {
                  return _cardView(dateTimeModel: _customDates![index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            const SizedBox(
              height: 15,
            ),
            _submitButton()
          ],
        ),
      ),
    );
  }

  Widget _cardView({required DateTimeModel dateTimeModel}) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      // color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.date_range),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  Themes.dateToString(date: dateTimeModel.date!),
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.access_time),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  Themes.timeToString(tod: dateTimeModel.time!),
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.red)),
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                onPressed: () {
                  setState(() {
                    _customDates!.remove(dateTimeModel);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete, color: Colors.red),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Remove",
                        style: GoogleFonts.montserrat(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      _selectTime(dateTime: picked);
    }
  }

  _selectTime({DateTime? dateTime}) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        if (dateTime != null) {
          DateTimeModel dateTimeModel = DateTimeModel();
          dateTimeModel.date = dateTime;
          dateTimeModel.time = timeOfDay;
          _customDates ??= [];
          _customDates?.add(dateTimeModel);
        } else {
          _selectedTime = timeOfDay;
        }
      });
    }
  }

  Widget _submitButton() {
    return DecoratedBox(
      // width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 15),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)])),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width(context), 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            primary: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.TOPSLIDE,
            title: "Success",
            desc: "You have successfully booked a cleaning",
            btnOkOnPress: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const CommonBottomNavigationBar(),
                    settings:
                        const RouteSettings(name: 'CommonBottomNavigationBar'),
                  ),
                  (route) => false);
            },
          ).show();
        },
        child: Text(
          'Submit',
          style: GoogleFonts.montserrat(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}

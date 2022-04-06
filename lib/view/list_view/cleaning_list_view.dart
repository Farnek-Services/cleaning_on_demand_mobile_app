import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carbon_footprint/helper/my_colors.dart';
import 'package:carbon_footprint/model/cleaning_list_model.dart';

class CleaningListView extends StatelessWidget {
  final CleaningListModel cleaningListModel;
  const CleaningListView({Key? key, required this.cleaningListModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location Type: " + cleaningListModel.location,
              style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: MyColors.appColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Cleaning Routine: " + cleaningListModel.cleaningRoutine,
              style: GoogleFonts.montserrat(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
            if (cleaningListModel.cleaningDate.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.today_rounded),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      cleaningListModel.cleaningDate,
                      style: GoogleFonts.montserrat(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            if (cleaningListModel.cleaningDay.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.today_rounded),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      cleaningListModel.cleaningDay,
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            if (cleaningListModel.cleaningTime.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.timer),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      cleaningListModel.cleaningTime,
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Status: " + cleaningListModel.status,
              style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: cleaningListModel.color),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Raised date: " + cleaningListModel.raisedDate,
              style: GoogleFonts.montserrat(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

class CleaningListModel {
  final String location;
  final String cleaningRoutine;
  final String raisedDate;
  final String cleaningDay;
  final String cleaningDate;
  final String cleaningTime;
  final String status;
  final Color color;

  CleaningListModel(
      {required this.color,
      required this.status,
      required this.location,
      required this.cleaningRoutine,
      required this.raisedDate,
      required this.cleaningDay,
      required this.cleaningDate,
      required this.cleaningTime});
}

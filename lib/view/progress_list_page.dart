import 'package:flutter/material.dart';
import 'package:carbon_footprint/helper/common_views.dart';
import 'package:carbon_footprint/model/cleaning_list_model.dart';
import 'list_view/cleaning_list_view.dart';

class ProgressListPage extends StatefulWidget {
  final String title;
  final int type;
  const ProgressListPage({Key? key, required this.title, required this.type})
      : super(key: key);
  @override
  _ProgressListPageState createState() => _ProgressListPageState();
}

class _ProgressListPageState extends State<ProgressListPage> {
  // List<AuditCompletedCheckListModel>? _auditCompletedList;
  // bool _loader = true;
  late List<CleaningListModel> _cleaningList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _callGetAuditCompletedList();
    // });
    if (widget.type == 0) {
      _cleaningList = [
        CleaningListModel(
            color: Colors.red,
            status: "Pending",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Pending",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Pending",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
      ];
    } else if (widget.type == 1) {
      _cleaningList = [
        CleaningListModel(
            color: Colors.red,
            status: "Pending",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.green,
            status: "Accepted",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "In Progress",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Pending",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.green,
            status: "Accepted",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "In Progress",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Pending",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.green,
            status: "Accepted",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "In Progress",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Pending",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.green,
            status: "Accepted",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "In Progress",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
      ];
    } else if (widget.type == 2) {
      _cleaningList = [
        CleaningListModel(
            color: Colors.green,
            status: "Completed",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Cancelled",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "Skipped",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
        CleaningListModel(
            color: Colors.green,
            status: "Completed",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Cancelled",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "Skipped",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
        CleaningListModel(
            color: Colors.green,
            status: "Completed",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Cancelled",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "Skipped",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
        CleaningListModel(
            color: Colors.green,
            status: "Completed",
            location: "Bathroom 1",
            cleaningRoutine: "Custom",
            raisedDate: "12/09/2021",
            cleaningDay: "",
            cleaningDate: "20/09/2021",
            cleaningTime: "08:00 AM"),
        CleaningListModel(
            color: Colors.red,
            status: "Cancelled",
            location: "Reception 1",
            cleaningRoutine: "Daily",
            raisedDate: "10/09/2021",
            cleaningDay: "",
            cleaningDate: "",
            cleaningTime: "07:00 AM"),
        CleaningListModel(
            color: Colors.blue,
            status: "Skipped",
            location: "Meeting Room 1",
            cleaningRoutine: "Weekly",
            raisedDate: "13/09/2021",
            cleaningDay: "Sunday,Tuesday,Wednesday",
            cleaningDate: "",
            cleaningTime: "10:00 AM"),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: (_cleaningList.isEmpty
          ? const EmptyView(
              msg: "List not available",
            )
          : _mainView),
    );
  }

  // Widget _loaderView(){
  //   return  Shimmer.fromColors(
  //       baseColor: Colors.grey.shade400,
  //       highlightColor: Colors.grey.shade200,
  //       enabled: true,
  //       child:ListView.separated(
  //           padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
  //           itemBuilder: (context, index) {
  //             return AuditCompletedListView(
  //               auditCompletedCheckListModel: null,
  //             );
  //           },
  //           separatorBuilder: (context, index) {
  //             return SizedBox(height: 5,);
  //           },
  //           itemCount: 10));
  // }

  Widget get _mainView => ListView.separated(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      itemBuilder: (context, index) {
        CleaningListModel cleaningListModel = _cleaningList[index];
        return CleaningListView(cleaningListModel: cleaningListModel);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 5,
        );
      },
      itemCount: _cleaningList.length);

  // _callGetAuditCompletedList() {
  //   // Themes.showDialogLoader(context);
  //   _loader = true;
  //   ApiService.getAuditCompletedCheckList().then((apiResponse) {
  //     // Themes.hideDialogLoader();
  //     _loader = false;
  //     if (apiResponse.apiResponseModel != null &&
  //         apiResponse.apiResponseModel!.response != null) {
  //       bool status = apiResponse.apiResponseModel!.response!.status;
  //       if (status) {
  //         Map<String, dynamic>? resultJson =
  //             apiResponse.apiResponseModel!.result;
  //         if (resultJson != null) {
  //           setState(() {
  //             _auditCompletedList = (resultJson['audit_checklist'] as List)
  //                 .map((e) => AuditCompletedCheckListModel.fromJson(e))
  //                 .toList();
  //           });
  //         }
  //       } else {
  //         setState(() {
  //         });
  //         String? message = apiResponse.apiResponseModel!.response?.message;
  //         Themes.showSnackBar(context: context, msg: message);
  //       }
  //     } else {
  //       setState(() {
  //       });
  //       Themes.showSnackBar(context: context, msg: apiResponse.error);
  //     }
  //   });
  // }
}

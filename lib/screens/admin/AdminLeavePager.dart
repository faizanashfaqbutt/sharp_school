import 'package:flutter/material.dart';
import 'package:sharpschool/screens/admin/Bloc/LeaveListBloc.dart';
import 'package:sharpschool/utils/modal/LeaveAdmin.dart';
import 'package:sharpschool/utils/widget/LeaveRowLayout.dart';
// ignore: must_be_immutable
class AdminLeavePage extends StatefulWidget {

  String url;
  String endPoint;

  AdminLeavePage(this.url,this.endPoint);

  @override
  _AdminLeavePageState createState() => _AdminLeavePageState();
}

class _AdminLeavePageState extends State<AdminLeavePage> {

  StuffLeaveListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = StuffLeaveListBloc(widget.url, widget.endPoint);
    bloc.getStaffLeaveList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: StreamBuilder<LeaveAdminList>(
        stream: bloc.getStaffLeaveSubject.stream,
        builder: (context,snap){
          if(snap.hasData){
           if(snap.error != null){
             return _buildErrorWidget(snap.error.toString());
           }
           return Container(
             child: ListView.builder(
               itemCount: snap.data.leaves.length,
               itemBuilder: (context,index){
                 return LeaveRowLayout(snap.data.leaves[index]);
               },
             ),
           );
          }else if(snap.hasError){
            return _buildErrorWidget(snap.error);
          }else{
           return  _buildLoadingWidget();
          }
        },
      ),
    );
  }
  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API..."), CircularProgressIndicator()],
        ));
  }

  Widget _buildErrorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error occured: $error"),
          ],
        ));
  }
}

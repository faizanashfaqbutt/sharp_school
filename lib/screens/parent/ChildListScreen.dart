import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/apis/Apis.dart';
import 'package:sharpschool/utils/modal/Child.dart';
import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/ChildRow.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChildListScreen extends StatefulWidget {

  @override
  _ChildListScreenState createState() => _ChildListScreenState();
}

class _ChildListScreenState extends State<ChildListScreen> {
  Future<ChildList> childs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Utils.getStringValue('id').then((value) {
      setState(() {
        print(value);

       childs = getAllStudent(value);
//         childs = getAllStudent(7.toString());

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'Child List'),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: FutureBuilder<ChildList>(
          future: childs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.students.length,
                itemBuilder: (context, index) {
                  return ChildRow(snapshot.data.students[index]);
                },
              );
            } else {
              return Center(child: Text("loading..."));
            }
          },
        ),
      ),
    );
  }

  Future<ChildList> getAllStudent(String id) async {
    String token;
    await Utils.getStringValue('token').then((value){
      token = value;
    });

     final response = await http.get(InfixApi.getParentChildren(id.toString(),'getParentChildren',token));

   if (response.statusCode == 200) {

     var jsonData = jsonDecode(response.body);

     return ChildList.fromJson(jsonData);
   } else {
     throw Exception('Failed to load');
   }
    // return ChildList.fromJson([{}]);
  }
}

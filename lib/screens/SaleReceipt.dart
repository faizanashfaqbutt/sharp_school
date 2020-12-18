import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharpschool/utils/Utils.dart';
import 'package:sharpschool/utils/modal/Fee.dart';
import 'package:sharpschool/utils/modal/SaleReceipt.dart';
import 'package:sharpschool/utils/server/FeesService.dart';
import 'package:sharpschool/utils/server/SaleService.dart';
import 'package:sharpschool/utils/widget/Fees_row_layout.dart';
import 'package:sharpschool/utils/widget/AppBarWidget.dart';
import 'package:sharpschool/utils/widget/Sale_row_layout.dart';
// ignore: must_be_immutable
class SaleReceipt extends StatefulWidget {
  String id;

  SaleReceipt({this.id});

  @override
  _SaleReceiptState createState() => _SaleReceiptState(id:id);
}
Future<String> getFutureId(String id) async {
  return id;
}
class _SaleReceiptState extends State<SaleReceipt> {
  String id;
  _SaleReceiptState({this.id});
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: AppBarWidget.header(context, 'Sale Receipt'),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Grand Total',
                      style:  Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold,
                          color:Colors.black),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0,bottom: 20.0),
              child: Container(
                child:FutureBuilder(
                  future: getFutureId(id),
                  builder: (context,id){
                    if(id.hasData){
                      return Container(
                        child: FutureBuilder(
                          future: SaleService(int.parse(widget.id!= null ? widget.id : id.data)).fetchTotalSale(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<String>> totalSnapshot){

                            if(totalSnapshot.hasData){
                              return Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Amount',
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.headline5
                                              .copyWith(fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          totalSnapshot.data[0],
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.headline6.copyWith(
                                              fontSize: 18,
                                              color:Colors.black54
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Paid',
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.headline5
                                              .copyWith(fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          totalSnapshot.data[1],
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.headline6.copyWith(
                                              fontSize: 18,
                                              color:Colors.black54
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Balance',
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.headline5
                                              .copyWith(fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          totalSnapshot.data[2],
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.headline6.copyWith(
                                              fontSize: 18,
                                              color:Colors.black54
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              );
                            }else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      );
                    }else {
                      return Container(
                        child: Text('...'),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              height: 15.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfff3e5f5).withOpacity(0.5), Colors.white]),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: getFutureId(id),
                  builder: (context, snapId) {
                    if (snapId.hasData) {
                      return Container(
                        child: FutureBuilder(
                          future:
                              SaleService(int.parse(widget.id!= null ? widget.id : snapId.data)).fetchSale(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<SaleReceiptClass>> saleSnapshot) {
                            if (saleSnapshot.hasData) {
                              return ListView.builder(
                                  itemCount: saleSnapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return SaleRow(saleSnapshot.data[index],widget.id!= null ? widget.id : snapId.data);
                                  });
                            } else {
                              return Text(
                                'Loading...',
                                style: Theme.of(context).textTheme.headline,
                              );
                            }
                          },
                        ),
                      );
                    } else {
                      return Container(
                        child: Text('Loading...'),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
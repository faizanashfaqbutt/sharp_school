import 'package:flutter/material.dart';

//import 'package:sharpschool/paymentGateway/PaymentHome.dart';
import 'package:sharpschool/utils/modal/Fee.dart';
import 'package:sharpschool/utils/modal/SaleReceipt.dart';
import 'package:sharpschool/utils/modal/SaleReceiptDetail.dart';
import 'ScaleRoute.dart';

// ignore: must_be_immutable
class SaleRow extends StatelessWidget {
  SaleReceiptClass saleRceipt;
  String id;

  SaleRow(this.saleRceipt, this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  saleRceipt.billNo,
                  style: Theme.of(context).textTheme.headline,
                  maxLines: 1,
                ),
              ),
              Container(
                width: 80.0,
                child: GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: Text(
                    'View',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.bold,

                        color:Theme.of(context).primaryColor ,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Due Date',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        saleRceipt.billDate,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Amount',
                        maxLines: 1,
                        style:Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        saleRceipt.totalAmount,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)
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
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        saleRceipt.totalPaid,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)
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
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        saleRceipt.balance,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Status',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      getStatus(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.purple, Colors.deepPurple]),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        //List<SaleReceiptDetail> srd=saleRceipt.saleDetail;
        return
          SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                      children: saleRceipt.saleDetail.map((SaleReceiptDetail SRD) {
                        return Row(

                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 5,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  SRD.itemName ,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5
                                                      .copyWith(fontWeight: FontWeight.w500),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        'Rate',
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith(fontWeight: FontWeight.w500),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        "200",
                                                        maxLines: 1,
                                                        style: Theme.of(context).textTheme.headline5.copyWith(
                                                            color: Colors.black54,
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.w500)
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        'Discount',
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith(fontWeight: FontWeight.w500),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        "10",
                                                        maxLines: 1,
                                                        style: Theme.of(context).textTheme.headline5.copyWith(
                                                            color: Colors.black54,
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.w500)
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(
                                                        'QTY',
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith(fontWeight: FontWeight.w500),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      Text(
                                                        "2",
                                                        maxLines: 1,
                                                        style: Theme.of(context).textTheme.headline5.copyWith(
                                                            color: Colors.black54,
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.w500)
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          int.parse("22") > 0
                                              ? GestureDetector(
                                            onTap: () {
//                          Navigator.push(
//                                  context, ScaleRoute(page: PaymentHome(fee,id)))
//                              .then((result) {
//                            Navigator.of(context).pop();
//                          });
                                            },
//                        child: Container(
//                          margin: EdgeInsets.only(top: 16.0, right: 16.0),
//                          decoration: BoxDecoration(
//                            color: Colors.blueAccent,
//                            borderRadius: BorderRadius.circular(10),
//                          ),
//                          alignment: Alignment.bottomRight,
//                          child: Padding(
//                            padding: const EdgeInsets.all(16.0),
//                            child: Center(
//                                child: Text(
//                              'Payment',
//                              style: Theme.of(context).textTheme.title.copyWith(
//                                  color: Colors.white, fontSize: 16.0),
//                            )),
//                          ),
//                        ),
                                          )
                                              : Text(''),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }).toList()
                  )
                ],
              )
          );



//        return Column(
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(0),
//              child: Container(
//                height: MediaQuery.of(context).size.height / 3,
//                width: MediaQuery.of(context).size.width,
//                color: Colors.white,
//                child: Padding(
//                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
//                  child: Column(
//                    children: <Widget>[
//                      Row(
//                        children: <Widget>[
//                          Expanded(
//                            child: Text(
//                              "title",
//                              style: Theme.of(context).textTheme.headline,
//                              maxLines: 1,
//                            ),
//                          ),
//                        ],
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(top: 20.0),
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    'Amount',
//                                    maxLines: 1,
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .display1
//                                        .copyWith(fontWeight: FontWeight.w500),
//                                  ),
//                                  SizedBox(
//                                    height: 10.0,
//                                  ),
//                                  Text(
//                                    "amount",
//                                    maxLines: 1,
//                                    style: Theme.of(context).textTheme.display1,
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Expanded(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    'Discount',
//                                    maxLines: 1,
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .display1
//                                        .copyWith(fontWeight: FontWeight.w500),
//                                  ),
//                                  SizedBox(
//                                    height: 10.0,
//                                  ),
//                                  Text(
//                                    "discount",
//                                    maxLines: 1,
//                                    style: Theme.of(context).textTheme.display1,
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Expanded(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    'Fine',
//                                    maxLines: 1,
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .display1
//                                        .copyWith(fontWeight: FontWeight.w500),
//                                  ),
//                                  SizedBox(
//                                    height: 10.0,
//                                  ),
//                                  Text(
//                                    "fine",
//                                    maxLines: 1,
//                                    style: Theme.of(context).textTheme.display1,
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Expanded(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    'Paid',
//                                    maxLines: 1,
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .display1
//                                        .copyWith(fontWeight: FontWeight.w500),
//                                  ),
//                                  SizedBox(
//                                    height: 10.0,
//                                  ),
//                                  Text(
//                                    "paid",
//                                    maxLines: 1,
//                                    style: Theme.of(context).textTheme.display1,
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Expanded(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: <Widget>[
//                                  Text(
//                                    'Balance',
//                                    maxLines: 1,
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .display1
//                                        .copyWith(fontWeight: FontWeight.w500),
//                                  ),
//                                  SizedBox(
//                                    height: 10.0,
//                                  ),
//                                  Text(
//                                    "balance",
//                                    textAlign: TextAlign.center,
//                                    maxLines: 1,
//                                    style: Theme.of(context).textTheme.display1,
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      int.parse("balanace") > 0 ?
//                      GestureDetector(
//                        onTap: () {
////                          Navigator.push(
////                                  context, ScaleRoute(page: PaymentHome(fee,id)))
////                              .then((result) {
////                            Navigator.of(context).pop();
////                          });
//                        },
////                        child: Container(
////                          margin: EdgeInsets.only(top: 16.0, right: 16.0),
////                          decoration: BoxDecoration(
////                            color: Colors.blueAccent,
////                            borderRadius: BorderRadius.circular(10),
////                          ),
////                          alignment: Alignment.bottomRight,
////                          child: Padding(
////                            padding: const EdgeInsets.all(16.0),
////                            child: Center(
////                                child: Text(
////                              'Payment',
////                              style: Theme.of(context).textTheme.title.copyWith(
////                                  color: Colors.white, fontSize: 16.0),
////                            )),
////                          ),
////                        ),
//                      ):Text(''),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ],
//        );
      },
    );
  }

  Widget getStatus(BuildContext context) {
    if (int.parse(saleRceipt.balance) == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.greenAccent),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            'paid',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      );
    } else if (int.parse(saleRceipt.totalPaid) > 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.amberAccent),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            'partial',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      );
    } else if (int.parse(saleRceipt.balance) ==
            int.parse(saleRceipt.totalAmount) ||
        int.parse(saleRceipt.balance) < 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            'unpaid',
            textAlign: TextAlign.center,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}

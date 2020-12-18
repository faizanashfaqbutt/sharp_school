import 'SaleReceiptDetail.dart';

class SaleReceiptClass{

  String billNo;
  String billDate;
  String totalAmount;
  String totalPaid;
  String balance;
  List<SaleReceiptDetail> saleDetail;


  SaleReceiptClass(this.billNo, this.billDate, this.totalAmount, this.totalPaid,this.balance,this.saleDetail);
  
}
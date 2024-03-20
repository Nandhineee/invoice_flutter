// import 'package:invoice/data/datasources/local/invoiceDataSource.dart';
// import 'package:invoice/domain/models/invoice_list.dart';
// import 'package:invoice/domain/repositories/invoiceRepository.dart';
// class ItemRepositoryImpl extends ItemRepositoryImpl {




  // final InvoiceDataSource invoiceDataSource;
  //
  // InvoiceRepositoryImpl(this.invoiceDataSource);
  //
  //
  //
  //
  //
  //
  // @override
  // Future<bool> invoice(Invoice invoice) async {
  //   print(invoice);
  //
  //   bool? result = await invoiceDataSource.insertInvoiceData( invoice);
  //
  //   if (result!) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }


//


import 'package:invoice/data/datasources/local/invoiceDataSource.dart';
import 'package:invoice/domain/models/item.dart';
import 'package:invoice/domain/repositories/itemRepository.dart';

class ItemRepositoryImpl extends ItemRepository{

  final InvoiceDataSource invoiceDataSource;

  ItemRepositoryImpl(this.invoiceDataSource);
  @override
   Future<bool> item(Item item) async{

    print("$item repo");

      bool? result = await invoiceDataSource.insertItemData(item);

      if (result!) {
        return true;
      } else {
        return false;
       }

  }


  Future<List<Item>?> getItem() async {
    List<Item>? result= await invoiceDataSource.getItem();
    if(result!.isNotEmpty) {
      print("$result  impl");
      return result;

    }
    return null;

  }
}





import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/data/datasources/local/invoiceDataSource.dart';
import 'package:invoice/data/repositories/invoiceRepositoryImpl.dart';
import 'package:invoice/domain/models/invoice_list.dart';
import 'package:invoice/domain/repositories/invoiceRepository.dart';

final invoiceDataSourceProvider= Provider((ref) => InvoiceDataSource());




final invoiceRepositoryProvider=Provider<InvoiceRepository>((ref) {
  final invoiceDetailsDataSource=ref.read(invoiceDataSourceProvider);
  return InvoiceRepositoryImpl(invoiceDetailsDataSource);
});


final invoiceDetailsProvider = StateNotifierProvider((ref) {
  InvoiceRepository invoiceRepository=ref.read(invoiceRepositoryProvider);
  return InvoiceDetailsNotifier(invoiceRepository);
});

class InvoiceDetailsNotifier extends StateNotifier<List<Invoice>>{
  final InvoiceRepository invoiceRepository;
  InvoiceDetailsNotifier( this.invoiceRepository):super([]);




  Future<void> createInvoice(Invoice invoice) async {
    bool result = await invoiceRepository.invoice(invoice);
  }

  Future<void> getInvoice()async {
    state = (await invoiceRepository.getInvoice())!;

  }



  getInvoices(){
    return state;
  }

  List<Invoice> getPaidInvoices(bool paid) {
    List<Invoice> filteredPaidInvoices = invoice.where((invoice) => invoice.paid == true).toList();
    return filteredPaidInvoices;
  }

  List<Invoice> getUnPaidInvoices(bool paid) {
    List<Invoice> filteredUnpaidInvoices = invoice.where((invoice) => invoice.paid == false).toList();
    return filteredUnpaidInvoices;
  }


  // Future<void> deleteById(String inId) async{
  //   await invoiceRepository.deleteInvoice(inId);
  //   print("$inId  provider");
  // }

  Future<void> deleteById(String inId) async {
    await invoiceRepository.deleteInvoice(inId);
    // Fetch the updated list of invoices after deletion
    await getInvoice();
  }




// Future<void> getInvoice(String id) async {
//   try {
//     Invoice invoice = await invoiceRepository.getInvoiceById(id);
//     // Here you can decide what to do with the invoice, e.g., print its details
//     print(invoice.toString());
//     // If you want to update the state based on this action, you can do so here
//     // For example, if getting an invoice is considered a "success" operation
//     state = true;
//   } catch (e) {
//     print(e);
//     // Handle errors, possibly setting state to false to indicate failure
//     state = false;
//   }
// }

}
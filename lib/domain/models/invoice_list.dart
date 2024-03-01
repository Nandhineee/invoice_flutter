import 'package:flutter/material.dart';
import 'package:invoice/domain/models/dateTieFormat.dart';
import 'package:invoice/domain/models/item.dart';

class Invoice {
  String invoiceId;
  String invoiceName;
  String price;
  bool paid;
  DateTime? createdDate;
  DateTime? DueDate;
  String dueTerms;
  String businessName;
  String businessEmailAddress;
  num? businessPhone;
  String businessBillingAddress;
  String businessWebsite;
  String clientName;
  String clientEmailAddress;
  num clientPhone;
  String clientBillingAddress;
  String clientShippingAddress;
  String discount;
  String tax;
  String shipping;
  List<Item> items;

  Invoice(
    this.invoiceId,
    this.invoiceName,
    this.price,
    this.paid,
    this.createdDate,
    this.DueDate,
    this.dueTerms,
    this.businessName,
    this.businessEmailAddress,
    this.businessPhone,
    this.businessBillingAddress,
    this.businessWebsite,
    this.clientName,
    this.clientEmailAddress,
    this.clientBillingAddress,
    this.clientPhone,
    this.clientShippingAddress,
    this.discount,
    this.shipping,
    this.tax,
    this.items,
  ); // Initialize items list as empty by default
}

List<Invoice> invoice = [
  Invoice(
      'INV456',
      'Project Launch Invoice',
      '8999',
      false,
      DateTime(2024, 2, 1),
      DateTime(2024, 3, 1),
      // Due one month after creation
      'Net 30 Days',
      'Creative Solutions Inc.',
      'contact@creativesolutions.com',
      1122334455,
      '456 Innovation Drive, Tech Park',
      'www.creativesolutions.com',
      'Future Ventures',
      'info@futureventures.com',
      '789 Venture Blvd, Startup City',
      2233445566,
      '789 Venture Blvd, Startup City',
      '0',
      // Discount
      '20',
      // Shipping
      '15',
      [
        Item('ITM001', 'Website Development', 1, 3000, 2, 1),
        Item('ITM002', 'Market Research', 1, 1500, 9, 4),
      ]),
  Invoice(
      'INV789',
      'Consulting & Hardware Invoice',
      '6734',
      false,
      DateTime(2024, 5, 1),
      DateTime(2024, 6, 1),
      // Due one month after creation
      'Net 30 Days',
      'NextGen Innovations',
      'sales@nextgeninnovations.com',
      5566778899,
      '1010 Future Lane, Innovation City',
      'www.nextgeninnovations.com',
      'Tech Startups Inc.',
      'purchase@techstartups.com',
      '1234 Startup Street, Entrepreneur Town',
      9988776655,
      '1234 Startup Street, Entrepreneur Town',
      '0',
      // Discount
      '30',
      // Shipping
      '10',
      [
        Item('ITM001', 'Website Development', 1, 3000, 2, 1),
        Item('ITM002', 'Market Research', 1, 1500, 9, 4),
      ]),
  Invoice(
      'INV003',
      // New invoice number
      'Web Hosting & Cybersecurity Invoice',
      '8901',
      // New customer ID
      false,
      // Payment status
      DateTime(2024, 7, 15),
      // Creation date set to July 15, 2024
      DateTime(2024, 8, 15),
      // Due one month after creation, on August 15, 2024
      'Net 30 Days',
      // Payment terms
      'CyberTech Solutions',
      // Your company name
      'support@cybertechsolutions.com',
      // Your company email
      1234567890,
      // Your company phone
      '500 Digital Way, Cyber City',
      // Your company address
      'www.cybertechsolutions.com',
      // Your company website
      'Global Enterprises Ltd.',
      // Customer name
      'procurement@globalenterprises.com',
      // Customer email
      '6789 Enterprise Avenue, Commerce City',
      // Customer address
      9876543210,
      // Customer phone
      '6789 Enterprise Avenue, Commerce City',
      // Customer shipping address
      '100',
      // Discount applied, assuming a $100 discount
      '50',
      // Shipping, assuming a shipping cost of $50
      '12',
      // Tax rate of 12%

      [
        Item('ITM001', 'Website Development', 1, 3000, 2, 1),
        Item('ITM002', 'Market Research', 1, 1500, 9, 4),
      ]),
];

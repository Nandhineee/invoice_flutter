const String itemTableName='item';
const String itemInvoiceId='invoiceId';
const String itemId='id';
const String itemName='name';
const String itemPrice='price';
const String itemQuantity='quantity';
const String itemDiscount='discount';
const String itemTax='tax';




class Item {
  String invoiceId;
  num id;
  String name;
  num price;
  num quantity;
  num discount;
  num tax;

  Item(this.invoiceId,this.id, this.name, this.quantity,
      this.price,this.discount,this.tax);
  // fromJson constructor
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      json['invoiceId'] ,
      json['id'] ,
      json['name']  .toString(),
      json['quantity'] ,
      json['price'] ,
      json['discount'] ,
      json['tax'] ,
    );
  }

  // Method to convert an Item instance into a map structure.
  Map<String, dynamic> toJson() {
    return {
      'invoiceId':invoiceId,
      // 'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'discount': discount,
      'tax': tax,
    };
  }

}

List<Item> item = [
  Item(
    "INV456",
     1,
    'Laptop',
     10,
     999.99,
    50,
    0.2,
  ),
  Item(
    'INV789',
     2,
     'Smartphone',
    5,
    599.99,
    30,
    0.15,

  )
];



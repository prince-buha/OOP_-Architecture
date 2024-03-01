  import 'dart:io';

class Product {
  int id;
  String name;
  int price;
  int quantity;
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});
  factory Product.mapfrom(Map<String, dynamic> data) {
    return Product(
        id: data['id'],
        name: data['name'],
        price: data['price'],
        quantity: data['quantity']);
  }
}

double totalbill = 0;
List<Map<String, dynamic>> allProducts = [
  {'id': 1, 'name': 'Laptop', 'price': 80000, 'quantity': 0},
  {'id': 2, 'name': 'Computer', 'price': 60000, 'quantity': 0},
  {'id': 3, 'name': 'watch', 'price': 5000, 'quantity': 0},
  {'id': 4, 'name': 'phone', 'price': 20000, 'quantity': 0},
  {'id': 5, 'name': 'TV', 'price': 32000, 'quantity': 0},
  {'id': 6, 'name': 'AC', 'price': 25000, 'quantity': 0},
  {'id': 7, 'name': 'cooler', 'price': 15000, 'quantity': 0},
];
List<Product> products = <Product>[];
List<Product> addtocart = <Product>[];

void main() {
  Product res;
  int choice;
  int quantity;
  String buyingProductName;
  allProducts.forEach((element) {
    res = Product.mapfrom(element);
    products.add(res);
  });
  products.forEach((element) {
    print("Id :- ${element.id}");
    print("Name :- ${element.name}");
    print("Price :- ${element.price}");
  });
  do {
    print("\n1. Buy Product.");
    print("2. Update Product.");
    print("3. Remove Product.");
    print("4. View Cart.");
    print("5. Make Bill.");
    print("0. Exit.");

    stdout.write("Enter your choice : ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print("Enter product name : ");
        buyingProductName = stdin.readLineSync()!;
        products.forEach((element) {
          if (element.name == buyingProductName) {
            addtocart.add(element);
          }
        });
        print("How mane quantity you want to buy : ");
        quantity = int.parse(stdin.readLineSync()!);
        int i;
        for (i = 0; i < quantity; i++) {
          addtocart.forEach((element) {
            element.quantity++;
          });
        }
        break;
      case 2:
        print("Enter old product name : ");
        String oldName = stdin.readLineSync()!;
        print("Enter updated name : ");
        String updatedName = stdin.readLineSync()!;
        addtocart.forEach((element) {
          if (element.name == oldName) {
            element == updatedName;
          }
        });
        break;
      case 3:
        print("Enter index number : ");
        int removeIndex = int.parse(stdin.readLineSync()!);
        addtocart.removeAt(removeIndex - 1);
        break;
      case 4:
        print("Your products is :- ");
        addtocart.forEach((element) {
          print("Id :- ${element.id}");
          print("Name :- ${element.name}");
          print("Price :- ${element.price}");
          print("Quantity :- ${element.quantity}");
        });
        break;
      case 5:
        double dissPrice = 0;
        addtocart.forEach((element) {
          totalbill = totalbill + element.price;
          totalbill = totalbill * element.quantity;
          if (totalbill >= 500 && totalbill < 1500) {
            dissPrice = totalbill - (totalbill * 0.10);
          } else if (totalbill >= 11500 && totalbill < 3500) {
            dissPrice = totalbill - (totalbill * 0.20);
          } else if (totalbill >= 3500 && totalbill < 6500) {
            dissPrice = totalbill - (totalbill * 0.25);
          } else if (totalbill >= 6500) {
            dissPrice = totalbill - (totalbill * 0.30);
          }
          print("====================================");
          print("Total bill :- $totalbill");
          print("Bill With Disscount :- $dissPrice");
          print("====================================");
        });
        break;
      case 0:
        break;
      default:
        print("Invalid choice....");
        break;
    }
  } while (choice != 0);
}

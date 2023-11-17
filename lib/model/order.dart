class OrderItem {
  final String imageUrl;
  final int quantity;
  final double amount;
  final String title;

  OrderItem(
      {required this.imageUrl,
      required this.quantity,
      required this.amount,
      required this.title});

  static List<OrderItem> orders = [
    OrderItem(
        imageUrl: "assets/images/chicken_biryani.jpg",
        quantity: 2,
        amount: 5500,
        title: "Chicken Biryani"),
    OrderItem(
        imageUrl: "assets/images/butter_chicken.jpg",
        quantity: 1,
        amount: 10500,
        title: "Butter chicken"),
    OrderItem(
        imageUrl: "assets/images/naan.jpg",
        quantity: 5,
        amount: 2000,
        title: "Naan bread"),
  ];
}

class Order {
  final String formattedDate;
  final String orderId;
  final String orderType;
  final List<OrderItem> orderItems;

  Order({
    required this.formattedDate,
    required this.orderId,
    required this.orderType,
    required this.orderItems,
  });

  static Order order = Order(
      formattedDate: "Wed, Nov 15,2023",
      orderId: "#235555",
      orderType: "Instant",
      orderItems: OrderItem.orders);
}

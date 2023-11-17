class Order {
  final String imageUrl;
  final int quantity;
  final double amount;
  final String title;

  Order(
      {required this.imageUrl,
      required this.quantity,
      required this.amount,
      required this.title});

  static List<Order> orders = [
    Order(
        imageUrl: "assets/images/chicken_biryani.jpg",
        quantity: 2,
        amount: 5500,
        title: "Chicken Biryani"),
    Order(
        imageUrl: "assets/images/butter_chicken.jpg",
        quantity: 1,
        amount: 10500,
        title: "Butter chicken"),
    Order(
        imageUrl: "assets/images/naan.jpg",
        quantity: 5,
        amount: 2000,
        title: "Naan bread"),
  ];
}

class BookingModel {
  String id;
  String status;
  String room;
  String customerName;
  String phone;
  String email;
  String date;
  String paymentType;
  String paymentStatus;
  int days;
  String arrivalDate;
  String lastCheckout;
  String amount;
  String reservationType;
  String customer;

  BookingModel({
    required this.id,
    required this.status,
    required this.room,
    required this.customerName,
    required this.phone,
    required this.email,
    required this.date,
    required this.paymentType,
    required this.paymentStatus,
    required this.days,
    required this.arrivalDate,
    required this.lastCheckout,
    required this.amount,
    required this.reservationType,
    required this.customer,
  });
}

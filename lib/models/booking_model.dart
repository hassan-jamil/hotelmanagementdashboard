class BookingModel {
  final String id;
  final String status;
  final String room;
  final String customerName;
  final String phone;
  final String email;
  final String date;
  final String paymentType;
  final String paymentStatus;
  final String days;
  final String arrivalDate;
  final String lastCheckout;

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
  });
}

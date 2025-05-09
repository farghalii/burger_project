import 'dart:ffi';

class Burgerinfo {
  final String burgerImage;
  final String burgerTitle;
  final String burgerName;
  final String burgerInfo;
  final String burgerRate;
  final double burgerPrice;
  Burgerinfo(
      {required this.burgerPrice,
      required this.burgerRate,
      required this.burgerTitle,
      required this.burgerName,
      required this.burgerInfo,
      required this.burgerImage});
}

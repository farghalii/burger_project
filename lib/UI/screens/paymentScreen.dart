
import 'package:flutter/material.dart';

import '../../core/models/burgerInfo.dart';
import '../../core/utils/appAssets.dart';
import '../../core/utils/appColors.dart';
import '../widgets/custom_paymet_method.dart';
import 'homeScreen.dart';

class Paymentscreen extends StatefulWidget {
  static const String routeName = '/payment screen';
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  String selectedMethod = '';

  final double taxes = 0.3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final burgerinfo = ModalRoute.of(context)!.settings.arguments as Burgerinfo;
    final String totalPrice =
        (burgerinfo.burgerPrice + taxes).toStringAsFixed(2);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order summary',
              style: TextStyle(
                  color: Appcolors.brownColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 8),
              child: Row(
                children: [
                  Text(
                    'Order',
                    style: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  Spacer(),
                  Text(
                    burgerinfo.burgerPrice.toString(),
                    style: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Taxes',
                    style: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                  Spacer(),
                  Text(
                    '\$$taxes',
                    style: TextStyle(
                        color: Color(0xff7D7D7D),
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xffF0F0F0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                        color: Appcolors.brownColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    '\$$totalPrice',
                    style: TextStyle(
                        color: Appcolors.brownColor,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Estimated delivery time:',
                  style: TextStyle(
                      color: Appcolors.brownColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  '15 - 30mins',
                  style: TextStyle(
                      color: Appcolors.brownColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Text(
              'Payment methods',
              style: TextStyle(
                  color: Appcolors.brownColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            CustomPaymetMethod(
              color: Appcolors.brownColor,
              image: Appassets.masterCard,
              text: 'Credit card',
              groupValue: selectedMethod,
              value: 'paypal',
              onChanged: (val) {
                setState(() {
                  selectedMethod = val!;
                });
              },
            ),
            CustomPaymetMethod(
              color: Color(0xffF3F4F6),
              image: Appassets.visaImage,
              text: 'Debit card',
              textColor: Appcolors.brownColor,
              groupValue: selectedMethod,
              value: 'visa',
              onChanged: (val) {
                setState(() {
                  selectedMethod = val!;
                });
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: TextStyle(
                          color: Color(0xff808080),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$$totalPrice',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * .5, size.height * .07),
                        backgroundColor: Appcolors.brownColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      if (selectedMethod.isEmpty) {
                        showAlertDialog(context);
                      } else {
                        showSuccessPopup(context);
                      }
                    },
                    child: Text(
                      "Pay Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Appcolors.brownColor, size: 50),
              const SizedBox(height: 16),
              const Text(
                'Warning!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.brownColor),
              ),
              const SizedBox(height: 16),
              const Text(
                '''You should choose a payment method''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Appcolors.brownColor,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * .4,
                          MediaQuery.of(context).size.height * .06),
                      backgroundColor: Appcolors.brownColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  )),
            ],
          ),
        );
      },
    );
  }

  void showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle,
                  color: Appcolors.redColor, size: 50),
              const SizedBox(height: 16),
              const Text(
                'Success!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.redColor),
              ),
              const SizedBox(height: 16),
              const Text(
                '''Your payment was successful''',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * .4,
                          MediaQuery.of(context).size.height * .06),
                      backgroundColor: Appcolors.redColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, HomeScreen.routeName),
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  )),
            ],
          ),
        );
      },
    );
  }
}

import 'package:burger_project/UI/screens/paymentScreen.dart';
import 'package:flutter/material.dart';

import '../../core/models/burgerInfo.dart';
import '../../core/utils/appColors.dart';
import 'homeScreen.dart';

class Orderscreen extends StatefulWidget {
  static final String routeName = '/order screen';

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  int counter = 1;
  int value = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final burgerinfo = ModalRoute.of(context)!.settings.arguments as Burgerinfo;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(burgerinfo.burgerImage),
                ),
                Row(
                  children: [
                    Text('${burgerinfo.burgerTitle} ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.brownColor)),
                    Text(burgerinfo.burgerName,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.brownColor))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffFF9633),
                    ),
                    Text(
                      burgerinfo.burgerRate,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    burgerinfo.burgerInfo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6A6A6A),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spicy',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.brownColor,
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.red,
                            inactiveTrackColor: Colors.grey,
                            trackHeight: 6.0,
                            thumbColor: Appcolors.redColor,
                            overlayColor: Colors.red,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 10),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 20),
                          ),
                          child: SizedBox(
                            width: size.width * .5,
                            child: Slider(
                                max: 20,
                                min: 0,
                                value: value.toDouble(),
                                onChanged: (double newValue) {
                                  value = newValue.round();
                                  setState(() {});
                                }),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Mild',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1CC019),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .3,
                            ),
                            Text(
                              'Hot',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.redColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(size.width * .29, size.height * .06),
                            backgroundColor: Appcolors.redColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {},
                        child: Text(
                          '\$${burgerinfo.burgerPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width * .5, size.height * .07),
                            backgroundColor: Appcolors.brownColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, Paymentscreen.routeName,
                            arguments: burgerinfo),
                        child: Text(
                          "ORDER NOW",
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
        ),
      ),
    );
  }
}

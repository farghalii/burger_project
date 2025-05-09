import 'package:flutter/material.dart';

class CustomPaymetMethod extends StatelessWidget {
  final Color color;
  final String image;
  final String text;
  final Color? textColor;
  const CustomPaymetMethod(
      {super.key,
      required this.color,
      required this.image,
      required this.text,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .08,
          child: ListTile(
            contentPadding: EdgeInsets.only(top: 10, left: 10),
            leading: Image(
              image: AssetImage(image),
              height: MediaQuery.of(context).size.height * .05,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

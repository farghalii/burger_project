import 'package:burger_project/UI/screens/orderScreen.dart';
import 'package:burger_project/core/models/burgerInfo.dart';
import 'package:burger_project/core/utils/appAssets.dart';
import 'package:burger_project/core/utils/appColors.dart';
import 'package:flutter/material.dart';

class Hometab extends StatelessWidget {
  List<Burgerinfo> burgerinfo = [
    Burgerinfo(
        burgerTitle: 'Cheeseburger',
        burgerName: "Wendy's Burger",
        burgerInfo:
            '''The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.''',
        burgerImage: Appassets.cheeseBurger,
        burgerRate: '4.9',
        burgerPrice: 8.24),
    Burgerinfo(
        burgerTitle: 'Hamburger',
        burgerName: "Veggie Burger",
        burgerInfo:
            '''Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ''',
        burgerImage: Appassets.hamburger_veggie_Burger,
        burgerRate: '4.8',
        burgerPrice: 9.99),
    Burgerinfo(
        burgerTitle: 'Hamburger',
        burgerName: 'Chicken Burger',
        burgerInfo:
            '''Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!''',
        burgerImage: Appassets.hamburger_chicken,
        burgerRate: '4.6',
        burgerPrice: 12.48),
    Burgerinfo(
        burgerTitle: 'Hamburger ',
        burgerName: 'Fried Chicken ',
        burgerInfo:
            '''Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.''',
        burgerImage: Appassets.hamburger_fried_chicken,
        burgerRate: '4.5',
        burgerPrice: 26.99),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Foodgo',
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: 'Lobster',
                            color: Appcolors.brownColor),
                      ),
                      Text(
                        'Order your favourite food!',
                        style: TextStyle(
                            color: Color(0xff6A6A6A),
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(Appassets.profieImage),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.search_rounded,
                        color: Appcolors.brownColor,
                        size: 35,
                      ),
                    ),
                    labelText: 'Search',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.brownColor,
                    ),
                    enabledBorder: customBorder(),
                    focusedBorder: customBorder(),
                    errorBorder: customBorder(color: Appcolors.redColor),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22.0,
                    mainAxisSpacing: 30.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: burgerinfo.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Orderscreen.routeName,
                          arguments: burgerinfo[index]);
                    },
                    child: Card(
                      elevation: 10,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(burgerinfo[index].burgerImage),
                              width: size.width * .5,
                              height: size.height * .13,
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Text(burgerinfo[index].burgerTitle,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.brownColor)),
                            Text(burgerinfo[index].burgerName,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Appcolors.brownColor)),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFF9633),
                                ),
                                Text(
                                  burgerinfo[index].burgerRate,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Appcolors.brownColor),
                                ),
                                SizedBox(
                                  width: size.width * .17,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(Icons.favorite_border_outlined,
                                      color: Appcolors.brownColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder customBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Appcolors.brownColor),
    );
  }
}

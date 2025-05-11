import 'package:flutter/material.dart';
import '../../core/models/burgerInfo.dart';
import '../../core/utils/appColors.dart';

class Favtab extends StatefulWidget {
  const Favtab({super.key});

  @override
  State<Favtab> createState() => _FavtabState();
}

class _FavtabState extends State<Favtab> {
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final favorites = FavoriteManager.favoriteBurgers;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Appcolors.redColor,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffEF2A39),
      ),
      backgroundColor: Colors.white,
      body: favorites.isEmpty
          ? Center(
        child: Text(
          "No favorites yet!",
          style: TextStyle(
            fontSize: 18,
            color: Appcolors.brownColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 22.0,
            mainAxisSpacing: 30.0,
            childAspectRatio: 0.7,
          ),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final burger = favorites[index];
            return Card(
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(burger.burgerImage),
                      width: size.width * .5,
                      height: size.height * .13,
                    ),
                    SizedBox(height: size.height * .02),
                    Text(burger.burgerTitle,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.brownColor)),
                    Text(burger.burgerName,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Appcolors.brownColor)),
                    SizedBox(height: size.height * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFF9633),
                        ),
                        Text(
                          burger.burgerRate,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Appcolors.brownColor),
                        ),
                        SizedBox(width: size.width * .17),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              FavoriteManager.toggleFavorite(burger);
                            });
                          },
                          child: Icon(
                            FavoriteManager.isFavorite(burger)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: FavoriteManager.isFavorite(burger)
                                ? Colors.red
                                : Appcolors.brownColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}

class FavoriteManager {
  static final List<Burgerinfo> favoriteBurgers = [];
  static bool isFavorite(Burgerinfo burger) =>
      favoriteBurgers.any((item) => item.burgerName == burger.burgerName);

  static void toggleFavorite(Burgerinfo burger) {
    if (isFavorite(burger)) {
      favoriteBurgers
          .removeWhere((item) => item.burgerName == burger.burgerName);
    } else {
      favoriteBurgers.add(burger);
    }
  }
}

import 'package:cookiestore_1/cookie_detail.dart';
import 'package:flutter/material.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFAF8),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(right: 15),
            height: MediaQuery.of(context).size.height - 50,
            width: MediaQuery.of(context).size.width - 30,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: [
                buildCard('Cookie mint', '\$3.99', 'assets/img/cookiemint.jpg',
                    false, false, context),
                buildCard('Cookie cream', '\$5.99',
                    'assets/img/cookiecream.jpg', true, false, context),
                buildCard('Cookie classic', '\$1.99',
                    'assets/img/cookieclassic.jpg', false, true, context),
                buildCard('Cookie choco', '\$2.99',
                    'assets/img/cookiechoco.jpg', false, false, context)
              ],
            ),
          ),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget buildCard(String name, String price, String imgPath, bool added,
      bool isFavourite, context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 5, 5, 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CookieDetail(
                  assetpath: imgPath, cookieprice: price, cookiename: name)));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5),
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    isFavourite
                        ? const Icon(Icons.favorite, color: Color(0xffEF7532))
                        : const Icon(
                            Icons.favorite_border,
                            color: Color(0xffEF7532),
                          )
                  ]),
                ),
                Hero(
                    tag: imgPath,
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          imgPath,
                        ),
                        fit: BoxFit.contain,
                      )),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(
                        0xffCC8053,
                      )),
                ),
                Text(name, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1,
                    color: const Color(0xffEBEBEB),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!added) ...[
                        const Icon(
                          Icons.shopping_basket,
                          size: 20,
                          color: Color(0xffD17E50),
                        ),
                        Text(
                          'Add to cart',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 15, color: const Color(0xffD17E50)),
                        )
                      ],
                      if (added) ...[
                        const Icon(Icons.remove_circle_outline,
                            color: Color(0xFFD17E50), size: 20),
                        const Text('3',
                            style: TextStyle(
                                color: Color(0xFFD17E50),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        const Icon(Icons.add_circle_outline,
                            color: Color(0xFFD17E50), size: 20),
                      ]
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

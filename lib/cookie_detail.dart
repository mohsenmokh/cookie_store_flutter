import 'package:cookiestore_1/bottom_bar.dart';
import 'package:flutter/material.dart';

class CookieDetail extends StatelessWidget {
  final String cookieprice;
  final String cookiename;
  final String assetpath;
  const CookieDetail(
      {super.key,
      required this.cookieprice,
      required this.cookiename,
      required this.assetpath});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Color(0xFF545D68),
              )),
          const SizedBox(
            width: 24,
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Pickup',
          style: themeData.textTheme.titleMedium,
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 28),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Cookie',
            style: themeData.textTheme.titleLarge!
                .copyWith(fontSize: 40, color: const Color(0xffF17532)),
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Hero(
            tag: assetpath,
            child: Image.asset(
              assetpath,
              height: 150,
              width: 100,
              fit: BoxFit.contain,
            )),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(cookieprice,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: const Color(0xFFF17532), fontSize: 22)),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: Text(cookiename,
              style: themeData.textTheme.titleMedium!.copyWith(
                  color: const Color(0xFF575E67),
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 20.0),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                'Cold, creamy ice cream sandwiched between delicious deluxe cookies. Pick your favorite deluxe cookies and ice cream flavor.',
                textAlign: TextAlign.center,
                style: themeData.textTheme.bodyMedium!
                    .copyWith(color: const Color(0xFFB4B8B9), fontSize: 17)),
          ),
        ),
        const SizedBox(height: 20.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: const Color(0xFFF17532)),
                child: Center(
                    child: Text(
                  'Add to cart',
                  style: themeData.textTheme.bodyMedium!
                      .copyWith(color: Colors.white),
                ))))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xffF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
    );
  }
}

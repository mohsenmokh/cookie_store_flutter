import 'package:cookiestore_1/bottom_bar.dart';
import 'package:cookiestore_1/cookie_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.varelaTextTheme(const TextTheme(
              titleMedium: TextStyle(fontSize: 20),
              titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              bodyMedium:
                  TextStyle(fontSize: 15, fontWeight: FontWeight.bold)))),
      home: const MyHomePageState(),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({super.key});

  @override
  State<MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 16),
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              'Categories',
              style: themeData.textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelColor: const Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: const EdgeInsets.only(
              right: 45,
            ),
            unselectedLabelColor: const Color(0xffCDCDCD),
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(
                child: Text('Cookies', style: TextStyle(fontSize: 20)),
              ),
              Tab(
                child: Text(
                  'Cookie cake',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Tab(
                child: Text('Ice cream',
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
            ],
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: TabBarView(
                controller: tabController,
                children: const [
                  CookiePage(),
                  CookiePage(),
                  CookiePage(),
                ],
              ))
        ],
      ),
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

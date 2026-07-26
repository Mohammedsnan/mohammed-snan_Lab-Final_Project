import 'package:flutter/material.dart';
import 'BedroomsProducts/IndexPage.dart';
import 'LivingroomsProducts/IndexPage2.dart';
import 'Foodrooms/IndexPage3.dart';
import 'IntersroomPage/IndexPage4.dart';
import 'buyPage/CartPage.dart';
import 'SettingsPage.dart';
import 'package:myhome/LoginPages/Loginhere.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void _bedrooms() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Indexpage()));
  }

  void _Livingrooms() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Indexpage2()));
  }

  void _Foodrooms() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Indexpage3()));
  }

  void _Intersroom() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Indexpage4()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //------------------------------------------------------------------------------
      appBar: AppBar(
        title: Text('MyHome',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 207, 162, 74),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Cartpage()));
            },
            icon: Icon(Icons.shopping_cart_outlined,
                color: Colors.black, size: 25),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: Image.asset("images/class.png").image,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mohanad Alnahdi & Mohamed Cnan',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Sign in'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginhere()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cartpage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Shop'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settingspage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.more),
              title: Text('More'),
              onTap: () {},
            ),
          ],
        ),
      ),
      //------------------------------------------------------------------------------

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // ======== عرض المنتجات كـ GridView ========
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // عمودين
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // نسبة الطول للعرض
                ),
                itemCount: 8, // عدد المنتجات
                itemBuilder: (context, index) {
                  return _buildProductCard(index);
                },
              ),

              SizedBox(height: 20),

              // ======== صورة العرض مع نسبة الخصم ========
              Stack(
                children: [
                  Image.asset(
                    "images/open.png",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 207, 162, 74),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '50% OFF',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ======== دالة بناء بطاقة المنتج ========
  Widget _buildProductCard(int index) {
    // بيانات وهمية للمنتجات
    List<String> names = [
      'طقم غرفة نوم فاخر',
      'كنبة زاوية مودرن',
      'طاولة طعام خشبية',
      'مرآة مدخل أنيقة',
      'كرسي مكتب مريح',
      'طاولة جانبية',
      'سجادة صوف ناعمة',
      'مصباح أرضي ديكور',
    ];

    List<String> prices = [
      '150 OMR',
      '250 OMR',
      '120 OMR',
      '80 OMR',
      '95 OMR',
      '65 OMR',
      '110 OMR',
      '45 OMR',
    ];

    List<String> oldPrices = [
      '200 OMR',
      '320 OMR',
      '160 OMR',
      '110 OMR',
      '130 OMR',
      '85 OMR',
      '150 OMR',
      '65 OMR',
    ];

    List<IconData> icons = [
      Icons.bedroom_parent_outlined,
      Icons.living_outlined,
      Icons.table_restaurant_outlined,
      Icons.meeting_room_outlined,
      Icons.chair_outlined,
      Icons.table_restaurant_outlined,
      Icons.brush_outlined,
      Icons.lightbulb_outlined,
    ];

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة المنتج (أيقونة مؤقتة)
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Icon(
                icons[index % icons.length],
                size: 60,
                color: Color.fromARGB(255, 207, 162, 74),
              ),
            ),
          ),
          // تفاصيل المنتج
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    names[index % names.length],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        prices[index % prices.length],
                        style: TextStyle(
                          color: Color.fromARGB(255, 207, 162, 74),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        oldPrices[index % oldPrices.length],
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  // زر الإضافة
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Color.fromARGB(255, 207, 162, 74),
                      child: Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
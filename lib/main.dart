import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DanggenMarket Clone Coding',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            actionsIconTheme: IconThemeData(
              color: Colors.black,
              size: 28,
            ),
            elevation: 0.1),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(fontSize: 10),
          unselectedLabelStyle: TextStyle(fontSize: 10),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: const DanggenHome(),
    );
  }
}

class DanggenHome extends StatefulWidget {
  const DanggenHome({Key? key}) : super(key: key);

  @override
  State<DanggenHome> createState() => _DanggenHomeState();
}

class _DanggenHomeState extends State<DanggenHome> {
  int _index = 0;
  String _location = 'seocho';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: DropdownButton(
            underline: const SizedBox.shrink(),
            onChanged: (String? location) => setState(() {
              _location = location ?? _location;
            }),
            value: _location,
            items: const [
              DropdownMenuItem(
                  value: 'seocho',
                  child: Text(
                    '서초동',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              DropdownMenuItem(value: 'samsung', child: Text('삼성동', style: TextStyle(fontWeight: FontWeight.bold))),
              DropdownMenuItem(
                  value: 'add_location', child: Text('내 동네 설정', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        actions: const [
          AppBarActionItem(icons: Icons.search),
          AppBarActionItem(icons: Icons.list),
          AppBarActionItem(icons: Icons.notifications_none_outlined),
        ],
      ),
      body: const DanggenHomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _index = index;
        }),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(_index == 0 ? Icons.home : Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(_index == 1 ? Icons.assignment : Icons.assignment_outlined), label: '동네생활'),
          BottomNavigationBarItem(
              icon: Icon(_index == 2 ? Icons.location_on : Icons.location_on_outlined), label: '내 근처'),
          BottomNavigationBarItem(icon: Icon(_index == 3 ? Icons.chat : Icons.chat_outlined), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(_index == 4 ? Icons.person : Icons.person_outline), label: '나의 당근'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}

class AppBarActionItem extends StatelessWidget {
  const AppBarActionItem({
    Key? key,
    required this.icons,
  }) : super(key: key);

  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(icons),
    );
  }
}

const goods = [
  {
    'image': 'https://picsum.photos/200',
    'title': '상품 1',
    'location': '양재동',
    'updateAgo': '끌올 10초 전',
    'price': 10000,
    'commentCount': 8,
    'likeCount': 10
  },
  {
    'image': 'https://picsum.photos/200',
    'title': '상품 1',
    'location': '양재동',
    'updateAgo': '끌올 10초 전',
    'price': 10000,
    'commentCount': 8,
    'likeCount': 10
  },
  {
    'image': 'https://picsum.photos/200',
    'title': '상품 1',
    'location': '양재동',
    'updateAgo': '끌올 10초 전',
    'price': 10000,
    'commentCount': 8,
    'likeCount': 10
  },
  {
    'image': 'https://picsum.photos/200',
    'title': '상품 1',
    'location': '양재동',
    'updateAgo': '끌올 10초 전',
    'price': 10000,
    'commentCount': 8,
    'likeCount': 10
  },
  {
    'image': 'https://picsum.photos/200',
    'title': '상품 1',
    'location': '양재동',
    'updateAgo': '끌올 10초 전',
    'price': 10000,
    'commentCount': 8,
    'likeCount': 10
  },
  {
    'image': 'https://picsum.photos/200',
    'title': '상품 1',
    'location': '양재동',
    'updateAgo': '끌올 10초 전',
    'price': 10000,
    'commentCount': 8,
    'likeCount': 10
  },
];

class DanggenHomeBody extends StatelessWidget {
  const DanggenHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> goodsItems = goods.map((e) => DanggenGoodsItem(goodsInfo: e)).toList();

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        children: [const Notification(), ...goodsItems],
      ),
    ));
  }
}

class Notification extends StatelessWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(text: '새소식 ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '중고거래 "거래 희망 장소" 추가 안내 📍'),
              ],
              style: TextStyle(color: Colors.black),
            ),
          ),
          const Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}

class DanggenGoodsItem extends StatelessWidget {
  const DanggenGoodsItem({Key? key, required this.goodsInfo}) : super(key: key);

  final Map<String, dynamic> goodsInfo;

  @override
  Widget build(BuildContext context) {
    NumberFormat priceFormat = NumberFormat.currency(locale: "ko_KR", symbol: '');

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              goodsInfo['image'],
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goodsInfo['title'],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${goodsInfo['location']}-${goodsInfo['updateAgo']}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${priceFormat.format(goodsInfo['price'])}원',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.chat, size: 14, color: Colors.grey),
                    const SizedBox(width: 2),
                    Text(
                      '${goodsInfo['commentCount']}',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.favorite_border, size: 14, color: Colors.grey),
                    Text(
                      '${goodsInfo['likeCount']}',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

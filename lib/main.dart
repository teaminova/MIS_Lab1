import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xEE6C4D)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '213004 Tea Minova'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Map<String, dynamic>> clothingItems = const [
    {
      'name': 'Belt',
      'image': 'https://5.imimg.com/data5/LS/SH/MY-65469753/t0xd-carmer-mens-light-blue-denim-belt_500x500_0-250x250.jpg',
      'description': 'A belt is a versatile accessory designed to secure or enhance the fit of clothing around the waist. Typically made from materials such as leather, fabric, or synthetic fibers, belts come in various styles, colors, and sizes to suit both functional and fashion purposes.',
      'price': '500 MKD',
    },
    {
      'name': 'Jacket',
      'image': 'https://www.target.com.au/medias/static_content/product/images/large/84/17/A468417.jpg',
      'description': 'A jacket is a versatile outerwear garment designed to provide warmth, protection, and style. Typically extending to the waist or hips, jackets are crafted from various materials such as leather, denim, wool, or synthetic fabrics, catering to different weather conditions and fashion preferences.',
      'price': '3000 MKD',
    },
    {
      'name': 'Jeans',
      'image': 'https://ae01.alicdn.com/kf/HTB1N17yHVXXXXbvXpXXq6xXFXXXd/hole-denim-jeans-acid-washed-jeans-men-disel-men-brand-SJ180.jpg',
      'description': 'Jeans are a classic and durable type of pants made from denim or denim-like fabric, known for their versatility and casual appeal. Originally designed as workwear, jeans have evolved into a fashion staple suitable for a wide range of occasions.',
      'price': '1500 MKD',
    },
    {
      'name': 'Dress',
      'image': 'https://i.pinimg.com/originals/8e/12/c0/8e12c0b508abf182577f48c3dbcd9722.png',
      'description': 'A dress is a one-piece garment typically worn by women, designed to cover the body from the shoulders down to various lengths, ranging from mini to maxi. Dresses come in a wide variety of styles, from casual to formal, and are made from a variety of fabrics such as cotton, silk, linen, and synthetic blends.',
      'price': '2800 MKD',
    },
    {
      'name': 'Coat',
      'image': 'https://i.pinimg.com/originals/70/a9/fa/70a9faa00d99d60f20f3698d234face3.jpg',
      'description': 'A coat is a long outerwear garment designed to provide warmth, protection, and elegance, especially during colder seasons. Typically extending below the waist and often to the thighs or knees, coats are made from materials such as wool, cashmere, tweed, or synthetic blends, ensuring durability and insulation.',
      'price': '2000 MKD',
    },
    {
      'name': 'Socks',
      'image': 'https://resources.mandmdirect.com/Images/_default/h/s/3/hs30058_1_cloudzoom.jpg',
      'description': 'Socks are a type of footwear designed to cover and protect the feet, typically made from materials like cotton, wool, polyester, or a blend of fabrics for comfort, warmth, and moisture absorption. They come in various lengths, including ankle, crew, and knee-high, and are worn under shoes to provide cushioning and prevent friction.',
      'price': '300 MKD',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F6D7A),
        title: Text(widget.title),
        foregroundColor: const Color(0xFFEAEAEA),
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            color: const Color(0xFFC0D6DF),
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(item['image']),
              title: Text(item['name']),
              subtitle: Text(item['price']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF4F6D7A),
          title: Text(item['name']),
          foregroundColor: const Color(0xFFEAEAEA),
      ),
      backgroundColor: const Color(0xFFEAEAEA),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 250,
                child: Image.network(
                  item['image'],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ${item['price']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text(
              item['description'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

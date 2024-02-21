import 'package:ecommerce_ui/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  int currentIndex = 0;
  List items = [
    {
      "image": "images/image1.png",
      "title": "shoe",
      "rating": "4/5",
      "price": 500
    },
    {
      "image": "images/image2.png",
      "title": "Woman Sandal",
      "rating": "4.5/5",
      "price": 300
    },
    {
      "image": "images/image3.png",
      "title": "Man Sandal",
      "rating": "5/5",
      "price": 600
    },
    {
      "image": "images/image4.png",
      "title": "Hoodie",
      "rating": "4.5/5",
      "price": 200
    },
    {
      "image": "images/image5.png",
      "title": "Boy outfit",
      "rating": "5/5",
      "price": 1500
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey,
      endDrawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(size: 35),
          iconSize: 30,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          selectedItemColor: Colors.orange,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.home_outlined)),
            BottomNavigationBarItem(
                label: "Shop", icon: Icon(Icons.shopping_bag_outlined)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.person_2_outlined)),
          ]),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Form(
                      child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Search",
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIconColor: Colors.black,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ),
                        )),
                  ))),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      scaffoldStateKey.currentState!.openEndDrawer();
                    },
                    icon: const Image(
                      image: AssetImage(
                        "images/icon.png",
                      ),
                    )),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              "Categories",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    CircularCategory(
                      icon: Icons.man,
                    ),
                    TextUnder(text: "Men")
                  ],
                ),
                Column(
                  children: [
                    CircularCategory(
                      icon: Icons.woman,
                    ),
                    TextUnder(text: "Women")
                  ],
                ),
                Column(
                  children: [
                    CircularCategory(
                      icon: Icons.electrical_services,
                    ),
                    TextUnder(text: "Electrical")
                  ],
                ),
                Column(
                  children: [
                    CircularCategory(
                      icon: Icons.child_care,
                    ),
                    TextUnder(text: "Children")
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text(
              "Best Selling",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 290),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return CardBestSelling(
                imagePath: items[index]["image"],
                title: items[index]["title"],
                rating: items[index]["rating"],
                price: items[index]["price"],
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Details(data: items[index]),
                  ));
                },
              );
            },
          ),
          SizedBox(
            height: 100,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(items.length, (index) {
                  return Card(
                    child: ListTile(
                      title: Text(items[index]["title"]),
                      subtitle: Text("${items[index]["price"]}"),
                    ),
                  );
                })
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class CardBestSelling extends StatelessWidget {
  String imagePath;
  String title;
  String rating;
  int price;
  Function() onTap;
  CardBestSelling(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.rating,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              color: Colors.grey[200],
              child: Image(
                fit: BoxFit.fill,
                height: 150,
                image: AssetImage(imagePath),
              ),
            ),
            ListTile(
              title: Text(title),
              titleTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              subtitle: Text(rating),
            ),
            Text(
              "$price" r"$",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class TextUnder extends StatelessWidget {
  String text;
  TextUnder({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}

class CircularCategory extends StatelessWidget {
  IconData icon;
  CircularCategory({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.all(10),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(200)),
          child: Icon(
            icon,
            size: 50,
          )),
    );
  }
}

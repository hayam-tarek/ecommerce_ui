import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final data;
  const Details({super.key, this.data});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  GlobalKey<ScaffoldState> scaffoldStateKey = GlobalKey();
  String? color;
  Color? colorSize;
  int currentIndex = 0;
  _DetailsState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      key: scaffoldStateKey,
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(size: 35),
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
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                    child: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    "images/logo.png",
                    fit: BoxFit.scaleDown,
                    scale: 10,
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        scaffoldStateKey.currentState!.openEndDrawer();
                      },
                      icon: Image(
                        image: AssetImage(
                          "images/icon.png",
                        ),
                      )),
                )
              ],
            ),
            Container(
              height: 200,
              color: Colors.grey[200],
              child: Image.asset(widget.data["image"]),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Text(
                "${widget.data["title"]}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: Text(
                "Rating: " + "${widget.data["rating"]}",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              child: Text(
                "${widget.data["price"]}" + r"$",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    "Color:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RadioListTile(
                    activeColor: Colors.black,
                    value: "black",
                    title: Text("Black"),
                    groupValue: color,
                    onChanged: (value) {
                      setState(() {
                        color = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RadioListTile(
                    activeColor: Colors.black,
                    value: "red",
                    title: Text("Red"),
                    groupValue: color,
                    onChanged: (value) {
                      setState(() {
                        color = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    "Size:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(child: Text("37")),
                Expanded(child: Text("38")),
                Expanded(child: Text("39")),
                Expanded(child: Text("40")),
              ],
            ),
            Container(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 100),
              child: MaterialButton(
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {},
                child: Text(
                  "Add to chart",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // InkWell sizeCheck(String size) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         if (colorSize == null)
  //           colorSize = Colors.grey;
  //         else {
  //           colorSize = null;
  //         }
  //       });
  //     },
  //     child: Container(
  //         alignment: Alignment.center,
  //         decoration: BoxDecoration(
  //             color: colorSize,
  //             border: Border.all(width: 1),
  //             borderRadius: BorderRadius.circular(200)),
  //         child: Text(size)),
  //   );
  // }
}

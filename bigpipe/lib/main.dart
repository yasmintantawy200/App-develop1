
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen1(),
      routes: {},
    );
  }
}

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  List<String> upperImage = [];

  List<String> lowerImage = [

  ];

 void getUpperList() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      List<String> images = [
        "assets/v1.png",
        "assets/v2.jpg",
        "assets/v3.jpg",
        "assets/v4.jpg",
        "assets/v5.jpg",
        "assets/v6.jpg",
        "assets/v7.jpg",
        "assets/v8.jpg",
        "assets/v9.jpg",

      ];
      upperImage = images;
      setState(() {});
    });

  }
  void getLowerList() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      List<String> images = [
        "assets/h2.jpg",
        "assets/h3.jpg",
        "assets/h1.jpg",
        "assets/h4.jpg",
        "assets/h5.jpg",

      ];
      lowerImage = images;
      setState(() {});
    });

  }

  @override
  void initState() {

    super.initState();
    getUpperList();
    getLowerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: upperImage.isNotEmpty
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          UpperImageItem(imageUrl: upperImage[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      itemCount: upperImage.length)
                  : const UpperListWaiting(),
            ),
           lowerImage.isNotEmpty? ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) {
                return LowerImageItem(
                  imageUrl: lowerImage[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 20,
              ),
              itemCount: lowerImage.length,
            ):const LowerWaitingItem(),
          ],
        ),
      ),
    );
  }
}

class UpperImageItem extends StatelessWidget {
  const UpperImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(
                imageUrl,
              ),
              fit: BoxFit.cover)),
    );
  }
}

class LowerImageItem extends StatelessWidget {
  const LowerImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(
                imageUrl,
              ),
              fit: BoxFit.cover)),
    );
  }
}
class UpperListWaiting extends StatelessWidget {
  const UpperListWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              ),
        ),

        itemCount: 5, separatorBuilder: (BuildContext context, int index) =>
    const SizedBox(
      width: 20,
    ),);
  }
}
class LowerWaitingItem extends StatelessWidget {
  const LowerWaitingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,


        itemBuilder: (context, index) => Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        itemCount: 5, separatorBuilder: (BuildContext context, int index) =>
      const SizedBox(
        height: 20,
      ),),
    );
  }
}







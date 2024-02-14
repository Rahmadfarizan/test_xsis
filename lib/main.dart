import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_xsis/details_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => GestureDetector(
          onTap: (){
            Navigator.push(context,  MaterialPageRoute(
            builder: (context) => DetailScreen(),
          ));
          },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              'No. ${imgList.indexOf(item)} image',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.menu),
        title: const Text("Netplix"),
        actions: [
          Container(
              padding: const EdgeInsets.only(right: 12),
              child: const Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(),
                items: imageSliders,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Lastest",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 100,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                imgList[i],
                              ))),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Action",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  for (int i = 0; i < 5; i++)
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        imgList[i],
                        width: MediaQuery.of(context).size.width / 2 - 15,
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

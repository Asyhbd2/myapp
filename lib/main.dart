import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 211, 177, 53),
        title: Text('Pasteleria "La Cereza" '),
        titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
            page: 1,
            image:
                'https://raw.githubusercontent.com/Asyhbd2/Imagenes-para-API-Flutter-6J/main/cheesecake.jpg',
            title: 'Cheesecake Oreo',
            description:
                'Una suave tarta de queso con base de galleta Oreo, perfecta para los amantes del chocolate y la cremosidad.',
          ),
          makePage(
            page: 2,
            image:
                'https://raw.githubusercontent.com/Asyhbd2/Imagenes-para-API-Flutter-6J/main/pastel.jpg',
            title: 'Pastel Clásico',
            description:
                'Esponjoso, dulce y perfecto para cualquier celebración. Un pastel tradicional con cobertura suave.',
          ),
          makePage(
            page: 3,
            image:
                'https://raw.githubusercontent.com/Asyhbd2/Imagenes-para-API-Flutter-6J/main/cupcake.jpg',
            title: 'Cupcake de Vainilla',
            description:
                'Delicioso cupcake con betún cremoso, ideal para acompañar con café o como postre individual.',
          ),
          makePage(
            page: 4,
            image:
                'https://raw.githubusercontent.com/Asyhbd2/Imagenes-para-API-Flutter-6J/main/conchas.jpg',
            title: 'Conchas',
            description:
                'Pan dulce tradicional con una capa crujiente y sabor incomparable, perfecto para el desayuno.',
          ),
        ],
      ),
    );
  }

  Widget makePage({
    required String image,
    required String title,
    required String description,
    required int page,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withAlpha((.9 * 255).round()),
              Colors.black.withAlpha((.2 * 255).round()),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  FadeInUp(
                    child: Text(
                      '$page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '/$totalPage',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      child: Row(
                        children: <Widget>[
                          for (int i = 0; i < 4; i++)
                            Container(
                              margin: EdgeInsets.only(right: 3),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                            ),
                          Icon(Icons.star, color: Colors.grey, size: 15),
                          SizedBox(width: 5),
                          Text('4.0', style: TextStyle(color: Colors.white70)),
                          Text(
                            '(2300)',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Colors.white.withAlpha((.7 * 255).round()),
                            height: 1.9,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeInUp(
                      child: Text(
                        'VER MÁS',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

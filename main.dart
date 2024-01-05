import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation Menu'),
      ),
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 1000),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50.0,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: <Widget>[
                _buildMenuItem('Item 1', Colors.amberAccent),
                _buildMenuItem('Item 2', Colors.blueAccent),
                _buildMenuItem('Item 3', Colors.greenAccent),
                _buildMenuItem('Item 4', Color(0xFFA7A7A7)),
                _buildMenuItem('Item 5', Colors.amberAccent),
                _buildMenuItem('Item 6', Colors.blueAccent),
                _buildMenuItem('Item 7', Colors.greenAccent),
                _buildMenuItem('Item 8', Color(0xFFA7A7A7)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(15),
          child: Card(
            color: color,
            elevation: 10,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

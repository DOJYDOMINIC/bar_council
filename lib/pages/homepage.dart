import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('New'),
            floating: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Center(
                child: CircleAvatar(
                  radius: 50,
                  // backgroundImage: NetworkImage('https://example.com/your_image.jpg'), // Replace with your image URL
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                color: Colors.blue, // Change color as needed
              ),
              height: 900, // Set the desired height
            ),
          ),
        ],
      ),
    );
  }
}

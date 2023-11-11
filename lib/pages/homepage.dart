import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    double top = MediaQuery.of(context).padding.top;
    double bottom = MediaQuery.of(context).padding.bottom;
    double left = MediaQuery.of(context).padding.left;
    double right = MediaQuery.of(context).padding.right;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10,),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.message,size: 30,)),
            )
          ],
            floating: true,
            expandedHeight: 160,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              background: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/man.png'), // Replace with your image URL
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('User Name',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

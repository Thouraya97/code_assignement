import 'package:code_assignement/View/Widgets/statusList.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pet Shop',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        child: sList(),
        height: 150,
      ),

      /*floatingActionButton: FloatingActionButton(onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PetsStatus(title: this.title)));,),*/
    );
  }
}

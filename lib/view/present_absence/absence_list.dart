import 'package:flutter/material.dart';

class PAList extends StatelessWidget {
  const PAList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('(က)စာရင်း'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        ]
      ),
    );
  }
}
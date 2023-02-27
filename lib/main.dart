import 'dart:math';

import 'package:flutter/material.dart';
import 'package:value_notifier_example_2/with_value_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: ({
        '/0': (context)=>WithValueNotifier(),
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var cont = _getContainer();
  var rot = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/0');
                },
                child: Text('push me'),
              ),
              Transform.rotate(
                angle: rot * pi / 180,
                child: _getContainer(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            rot += 30;
            if (rot >= 180) {
              rot = 0;
            }
          });
        },
        child: const Icon(Icons.rotate_right),
      ),
    );
  }
}

Container _getContainer() {
  return Container(
    height: 300,
    width: 300,
    color: Colors.blue,
  );
}

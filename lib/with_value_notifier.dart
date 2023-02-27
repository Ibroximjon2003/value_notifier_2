import 'dart:math';

import 'package:flutter/material.dart';

class WithValueNotifier extends StatelessWidget {
  const WithValueNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rot = ValueNotifier(0);
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          builder: (context, value, child) {
            return  Transform.rotate(
              angle: value * (pi / 180),
              child: child,
            );
          },
          valueListenable: rot,
          child: _getContainer(),

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          rot.value += 30;
          if(rot.value >= 180){
            rot.value = 0;
          }
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
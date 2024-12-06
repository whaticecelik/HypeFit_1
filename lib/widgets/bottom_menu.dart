import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: (){
              context.go("/home");
            }, icon: Icon(CupertinoIcons.home), 
          ),
          IconButton(
            onPressed: (){
              context.go("/stats");
            }, icon: Icon(CupertinoIcons.graph_circle), 
          ),
          IconButton(
            onPressed: (){
              context.go("/favs");
            }, icon: Icon(CupertinoIcons.star), 
          ),
          IconButton(
            onPressed: (){
              context.go("/profile");
            }, icon: Icon(CupertinoIcons.person), 
          ),
        ],
        ),
    );
  }
}


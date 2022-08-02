import 'package:flutter/material.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10,
      decoration: BoxDecoration(
        border: new Border(
          bottom: new BorderSide(color: Colors.white24),
        ),
      ),

      child: ListTile(
          contentPadding: EdgeInsets.only(left: 40),
          leading: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        title: Text(name, style: TextStyle(fontSize: 20, color: Colors.white)),
        onTap: onPressed,
      ),
    );
  }
}

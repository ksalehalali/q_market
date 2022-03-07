import 'package:flutter/material.dart';

class DepartmentShapeTile extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? assetPath;

  const DepartmentShapeTile({Key? key, this.color, this.title, this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 62,
          width: 62,
          padding:  EdgeInsets.all(1),
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: Image.asset(
              this.assetPath!,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(this.title!,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
      ],
    );
  }
}
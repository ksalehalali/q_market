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
          height: 75,
          width: 75,
          padding:  EdgeInsets.all(1),
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
            child: Image.asset(
              this.assetPath!,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(this.title!,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,)
      ],
    );
  }
}
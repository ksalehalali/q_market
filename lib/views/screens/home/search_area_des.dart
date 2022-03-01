import 'package:flutter/material.dart';

class SearchAreaDesign extends StatefulWidget {
  const SearchAreaDesign({Key? key}) : super(key: key);

  @override
  _SearchAreaDesignState createState() => _SearchAreaDesignState();
}

class _SearchAreaDesignState extends State<SearchAreaDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Container(
          height: 34,
          // width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.blue[50]),
          child: Center(
            child: Row(
              children: const <Widget>[
                SizedBox(width: 10.0,),

                Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.grey,
                ),
                Text('What are you looking for?',
                    style: TextStyle(fontSize: 12,color: Colors.grey,letterSpacing: 1)),
                SizedBox(width: 10.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
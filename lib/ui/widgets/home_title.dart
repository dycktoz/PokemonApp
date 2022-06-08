import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(right: 34, top: 32, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: 40,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_rounded,
                        size: 40,
                      ))
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerLeft,
            child: Text('Pókedex',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50)),
          ),
        ],
      ),
    );
  }
}

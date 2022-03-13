import 'package:flutter/material.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding* 2.5),
      height: size.height * 0.25,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.25 - 27,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)
              )
            )
          ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,10),
              blurRadius: 50,
              color: kPrimaryColor.withOpacity(0.23)
            )
          ]
        ),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: "Rechercher",
            hintStyle: TextStyle(
              color: kPrimaryColor.withOpacity(0.5)
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: Icon(
            Icons.search_rounded,
            color: kPrimaryColor,
            size: 25.0,
          ),
          ),
        ),
      ),
      
    )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SecondLayer extends StatelessWidget {
  const SecondLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return                       Positioned(
      top: -17, // جعل العنصر يخرج جزئيًا
      child: Row(
        children: [
          Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xff205781))),
            child: Center(child: Text("chapter 1")),
          ),
        ],
      ),
    );

  }
}

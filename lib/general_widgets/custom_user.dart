import 'package:flutter/material.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({Key? key, this.image, this.text}) : super(key: key);
  final text;
  final image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            // color: Color(0xFFC4C4C4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ))),
          ),
          const SizedBox(height: 8),
          SizedBox(height: 17, child: Text(text))
        ],
      ),
    );
  }
}

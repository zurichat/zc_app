import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({Key? key, this.image, this.text}) : super(key: key);
  final text;
  final image;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      builder: () => InkWell(
        onTap: () {},
        child: Container(
          width: 48.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          image,
                        ))),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                  height: 32.h,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
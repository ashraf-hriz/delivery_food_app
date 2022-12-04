import 'package:design_test_app/core/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 155,

      child: Row(
        children: [
          SvgPicture.asset(AppIcons.logoIcon,height: 50,),
          const SizedBox(width: 10),
          buildLocationSearchTextBox(),
        ],
      ),
    );
  }

  buildLocationSearchTextBox(){
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon:  Icon(Icons.search,color: Theme.of(Get.context!).colorScheme.primary,),
          hintText: 'Enter Your Location',
          contentPadding: const EdgeInsets.only(left: 20,bottom: 5,right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

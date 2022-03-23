import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObsecure;
  final String hintText;
  final TextInputType textInputType;
  final Widget prefixIcon;

  const CustomTextField({
    Key? key,
    required this.textEditingController,
    this.isObsecure = false,
    required this.hintText,
    required this.textInputType,
    required this.prefixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context,color:Colors.transparent),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
             color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          
          onChanged: (value) {},
          style:
              Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10.sp),
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 12.sp,color: Theme.of(context).colorScheme.surface),
            hintText: hintText,
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
           
          ),
          keyboardType: textInputType,
          obscureText: isObsecure,
        ),
      ),
    );
  }
}

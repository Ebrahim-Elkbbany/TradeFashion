import 'package:flutter/material.dart';
import 'package:trade_fashion/constants.dart';
import 'package:trade_fashion/core/utils/styles.dart';

Widget customRadioListTile({required onChanged,required groupValue,required value, required title,color=Colors.black}){
  return RadioListTile(
    activeColor: kPrimaryColor,
    contentPadding: EdgeInsetsDirectional.zero,
    controlAffinity: ListTileControlAffinity.trailing,
    value: value,
    groupValue: groupValue,
    title:Text(title,style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w500,color:color)),
    onChanged: onChanged,
  );
}
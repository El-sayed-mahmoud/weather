import 'package:flutter/material.dart';

class DialogsHelper{
  final BuildContext context;
  final String message;
  final String? title;

  DialogsHelper({required this.context, required this.message, this.title});


  Future successDialog() async {}
  Future deleteDialog({required warningMessage,required Function() confirmDelete,Function()? cancel}) async{}
  Future editDialog() async{}
  Future errorDialog({Function()? onTapOk,}) async{}
}

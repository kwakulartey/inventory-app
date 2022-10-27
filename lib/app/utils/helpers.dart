import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void showSnackBar({required String message}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

Timestamp? timestampFromJson(dynamic val) =>
    val == null ? null : val as Timestamp?;
FieldValue timestampToJson(Timestamp? val) => FieldValue.serverTimestamp();

String parseTimestamp(Timestamp? val) {
  if (val != null) {
    return DateFormat.yMEd()
        .add_jms()
        .format(val.toDate()); //DateFormat.yMMMd().format(val.toDate());
  }
  return '';
}

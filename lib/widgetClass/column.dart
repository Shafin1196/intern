import 'package:flutter/material.dart';
Widget text(String title) {
  return Text(
    title,
    style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  );
}

Widget textFormField({
  required TextEditingController controller,
  required String hintText,
  required String? Function(String?) validator,
  bool isPassword = false,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 15),
      border: fieldBorder(),
      enabledBorder: fieldBorder(),
      focusedBorder: fieldBorder(),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    ),
    validator: validator,
  );
}
OutlineInputBorder fieldBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
    borderRadius: BorderRadius.circular(12),
  );
}
class OnBoardColumn {
  Widget customColumn(
      {required final imgPath,
        required final title,
        required final body,
        bool transform = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        transform
            ? Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(-1.0, 1.0),
          child: Image.asset(imgPath),
        )
            : Image.asset(imgPath),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade600),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            body,
            maxLines: 4,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

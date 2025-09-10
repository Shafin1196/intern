import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/homeWidgets/parcel_column.dart';

class ParcelTypeOverlay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width / 8), // To balance the close button
                Expanded(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ParcelColumn(),
            const SizedBox(height: 20),
            SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            height: 47,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

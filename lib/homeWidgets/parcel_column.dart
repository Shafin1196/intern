import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
Widget buttonTile({required String title, required String subtitle, required IconData icon, required VoidCallback onTap}){
  return InkWell(
          onTap: onTap,
          child: Card(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.grey.shade300,
              width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8,top:6,bottom:6),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(icon,color: Colors.green,),
                ),
                title: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text(subtitle,style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        );
}
class ParcelColumn extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buttonTile(title: 'Homemade food ', subtitle: 'Home-cooked meals', icon: Icons.restaurant_menu_outlined, onTap: () {
          //assign later
        }),
        buttonTile(title: 'Clothes', subtitle: 'Folded or packed securely', icon: Icons.checkroom_outlined, onTap: () {
          //assign later
        }),
        buttonTile(title: 'Documents ', subtitle: 'No passport or bank cheques', icon: Icons.document_scanner_outlined, onTap: () {
          //assign later
        }),
        buttonTile(title: 'Gifts', subtitle: 'Flowers,cards,chocolates and others', icon: Icons.card_giftcard_outlined, onTap: () {
          //assign later
        }),
        buttonTile(title: 'Cosmetics', subtitle: 'Makeup, skincare, or hygiene products.', icon: Icons.shopify_outlined, onTap: () {
          //assign later
        }),
        buttonTile(title: 'Medicine', subtitle: 'Prescription or over the counter medicines', icon: Icons.medical_services_outlined, onTap: () {
          //assign later
        }),
        buttonTile(title: 'Accessories ', subtitle: 'Watches, jewelry, bags, shoes etc,', icon: Icons.shopping_bag_outlined, onTap: () {
          //assign later
        }),
        buttonTile(title: 'Electronics', subtitle: 'Stationery, small tools, or household items', icon: Icons.electrical_services_outlined, onTap: () {
          //assign later
        }),
        
        
      ],
    );
  }
}
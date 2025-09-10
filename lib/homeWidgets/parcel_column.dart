import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
Widget buttonTile(String title,String subtitle,Icons icon,Function()? onTap){
  return InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
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
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            //handle later
          },
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
                  child: Icon(Icons.restaurant_menu_outlined,color: Colors.green,),
                ),
                title: Text('Homemade food ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                subtitle: Text('Home-cooked meals',style: TextStyle(fontSize: 14,color: Colors.grey.shade500),),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intern/homeScreens/detail_page1.dart';
import 'package:intern/homeWidgets/slideBanner.dart';
import 'package:intern/models/parcel.dart';
import 'package:intern/providers/orderHistory.dart';
import 'package:intern/providers/parcel_providers.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String address = "Null";
  @override
  void initState() {
    super.initState();
    // getAddressOnInit();
  }

//   void getAddressOnInit() async {
//   try {
//     String getAdd = await getAddress();
//     setState(() {
//       address = getAdd;
//     });
//   } catch (e) {
//     setState(() {
//       address = 'Null';
//     });
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi sazzad!",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 25,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Riyadh, Saudi Arabia",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            //fuction will assign later
                          },
                          icon: Icon(
                            Icons.notifications_none,
                            size: 30,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width - 50,
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      color: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Track your Parcel",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Please enter your order id",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 100,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Order id",
                                suffixIcon: Container(
                                  width: 36,
                                  height: 36,
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.green.shade100,
                                    child:
                                        Icon(Icons.search_outlined, size: 20),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SlidingBanner(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 50,
                    child: OutlinedButton(
                      onPressed: () {
                        ref
                            .read(parcelProvider.notifier)
                            .setParcel(Parcel.empty());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => DetailPage1()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.green.shade700),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("assets/images/box.png",
                              height: 40, width: 40),
                          SizedBox(width: 8),
                          Text("Create new shipment",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text("Recent Orders",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer(builder: (context, ref, child) {
                    final orderAsync = ref.watch(orderHistoryProvider);
                    return orderAsync.when(
                      data: (orderHistory) => ListView.builder(
                        itemCount: orderHistory.data.orders.length,
                        itemBuilder: (context, index) {
                          final order = orderHistory.data.orders[index];
                          final delivered = orderHistory.data.orders[index]
                              .deliveryInfo.timestamps.deliveredAt;
                          final dateTime = DateTime.parse(delivered);
                          final formatted = DateFormat('d MMMM, yyyy hh:mm a')
                              .format(dateTime);
                          return SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 50,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.grey, width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ListTile(
                                  title: Text(order.receiversName),
                                  subtitle: Text(order.destinationAddress),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.calendar_today,
                                          size: 16, color: Colors.grey),
                                      Text(formatted,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      loading: () => SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.green,
                        )),
                      ),
                      error: (err, stack) => Text('Error: $err'),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Selected item
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 6),
                    Text("Home", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // Unselected items
              IconButton(
                onPressed: () {
                  //fuction will assign later
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  //fuction will assign later
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  //fuction will assign later
                },
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ],
          ),
        ));
  }
}

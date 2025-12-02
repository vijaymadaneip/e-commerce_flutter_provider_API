import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api/screens/Address/addressScreen.dart';
import 'package:flutter_api/screens/NavigationMenuScreens/cartScreen.dart';
import 'package:flutter_api/screens/order/myorderScreen.dart';
import 'package:flutter_api/screens/profile/editprofileScree.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   // width: 380,
            //   height: 150,
            //   decoration: BoxDecoration(
            //     // color: Colors.amber,
            //     borderRadius: BorderRadius.only(
            //       bottomRight: Radius.circular(120),
            //       bottomLeft: Radius.circular(120),
            //     ),
            //     // shape: BoxShape.circle,
            //     border: Border.all(width: 2),
            //   ),
            // ),
            Center(
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: Color.fromRGBO(8, 87, 160, 1),
                  border: Border.all(width: 4),
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/Profile/profile.png",
                    fit: BoxFit.cover, // fills the circle perfectly
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Name",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "User Email",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => editProfileScreen(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    "assets/Profile/editicon.png",
                    fit: BoxFit.cover, // fills the circle perfectly
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              "Account Setting",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Column(
                children: [
                  //Address
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => addressScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/Profile/home.png",
                          fit: BoxFit.cover, // fills the circle perfectly
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Addresses",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Set shopping delivery addresses",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Cart
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => cartScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/Profile/cart.png",
                          fit: BoxFit.cover, // fills the circle perfectly
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Cart",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Add, remove products and move to checkout",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Order
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Myorderscreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/Profile/order.png",
                          fit: BoxFit.cover, // fills the circle perfectly
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Orders",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "In-progress and Completed Orders",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Exit From the App"),
                      content: const Text("You want to exit from app ?"),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            //exit
                            SystemNavigator.pop();
                          },
                          child: const Text("Exit"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "Exit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
          
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey.shade300,
              ),
            ),


            const SizedBox(height: 20),

            Text(
              "User Name",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),



            const SizedBox(height: 5),

            Text(
              "email id",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),


            const SizedBox(height: 20),

            

            
            Divider(),

            ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Change Password"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text("My Orders"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                // logout logic
              },
            ),
          ],
        ),
      ),
*/

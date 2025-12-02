import 'package:flutter/material.dart';
import 'package:flutter_api/screens/profile/changeNameScreen.dart';

class editProfileScreen extends StatefulWidget {
  const editProfileScreen({super.key});

  @override
  State<editProfileScreen> createState() => _editProfileScreenState();
}

class _editProfileScreenState extends State<editProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 40),
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsetsGeometry.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 20),
                  Divider(thickness: 2),
                  const SizedBox(height: 20),
                  Text(
                    "Account Setting",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  //Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "UserName",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            // color: Colors.blueGrey,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => changeNameScree(),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  //User Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "User Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "abcdefg@gmail.com",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            // color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Divider(thickness: 2),
                  const SizedBox(height: 20),
                  Text(
                    "Profile Settings",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  //User Id
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "User ID",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "1234432100",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                  const SizedBox(height: 20),

                  //email
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "abcdefg@gmail.com",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //phone number
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "124567890",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                  const SizedBox(height: 20),

                  //Gender
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "gender",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Divider(thickness: 2),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Close Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 20),
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
*/


//Gender
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Gender",
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w700,
            //         color: Colors.blueGrey,
            //       ),
            //     ),
            //     Text(
            //       "gender",
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400,
            //         // color: Colors.blueGrey,
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {},
            //       icon: Icon(Icons.arrow_forward_ios),
            //     ),
            //   ],
            // ),
import 'package:flutter/material.dart';
import 'package:flutter_api/screens/Address/addNewAddress.dart';

class addressScreen extends StatefulWidget {
  const addressScreen({super.key});

  @override
  State<addressScreen> createState() => _addressScreenState();
}

class _addressScreenState extends State<addressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
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
                  "Addresses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Name
                          Row(
                            children: [
                              Text(
                                "Name of user",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //Contact Number
                          Row(
                            children: [
                              Icon(Icons.call),
                              const SizedBox(width: 10),
                              Text(
                                "+91 1231231230",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  // color: Color.fromRGBO(8, 87, 160, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          //Address of user
                          Row(
                            children: [
                              Icon(Icons.person),
                              const SizedBox(width: 10),
                              Text(
                                "House no, City, State, Country, PinCode",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  // color: Color.fromRGBO(8, 87, 160, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Color.fromRGBO(8, 87, 160, 1),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>addNewAddress()));
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      // floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text("Add New Address")),
    );
  }
}

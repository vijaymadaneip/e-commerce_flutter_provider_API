import 'package:flutter/material.dart';

class addNewAddress extends StatefulWidget {
  const addNewAddress({super.key});

  @override
  State<addNewAddress> createState() => _addNewAddressState();
}

class _addNewAddressState extends State<addNewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
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
                  "Add New Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Column(
                children: [
                  //NAME
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Name",
                      hintText: " Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  //PHONE NUMBER
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      labelText: "Phone Number",
                      hintText: " Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Phone Number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  //Street and Postal Code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Street
                      Container(
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.add_road),
                            labelText: "Street",
                            hintText: " Street",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Street";
                            }
                            return null;
                          },
                        ),
                      ),

                      //Postal Code
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.local_post_office),
                            labelText: "Postal Code",
                            hintText: " Postal Code",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Postal Code";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //City and State
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //State
                      Container(
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            labelText: "City",
                            hintText: " City",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter City";
                            }
                            return null;
                          },
                        ),
                      ),
                      //State
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            labelText: "State",
                            hintText: "State",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter State";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //Country
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.pin_drop),
                      labelText: "Country",
                      hintText: " Country",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Country";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(8, 87, 160, 1.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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

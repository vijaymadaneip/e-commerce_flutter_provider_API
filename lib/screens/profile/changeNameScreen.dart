import 'package:flutter/material.dart';

class changeNameScree extends StatefulWidget {
  const changeNameScree({super.key});

  @override
  State<changeNameScree> createState() => _changeNameScreeState();
}

class _changeNameScreeState extends State<changeNameScree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(14),
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
                  "Change Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Update your name to keep your profile accurate and personalized",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     border: Border.all(width: 2)
            //   ),
            //   child: Row(
            //     children: [
            //       Icon(Icons.person)
            //     ],
            //   ),
            // )
            // TextFormField(
            //   decoration: InputDecoration(
            //     icon: Icon(Icons.person),
            //     labelText: "title",
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(width: 2, color: Colors.grey),
            //     ),
            //   ),
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return "Please Enter title";
            //     }
            //     return null;
            //   },
            // ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Name",
                hintText: "First Name",
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
                  return "Please Enter First Name";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: "Name",
                hintText: "Last Name",
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
                  return "Please Enter Last Name";
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
            // TextFormField(

            //   decoration:  InputDecoration(
            //     hintText: "Name",
            //     labelText: "Enter the Name",
            //     icon: Icon(Icons.person),
            //     enabledBorder: OutlineInputBorder(
            //       // borderRadius: BorderRadius.circular(15),
            //       borderSide: BorderSide(
            //         color: Colors.grey,
            //         width: 2
            //       )
            //     )
            //   ),

            // )
          ],
        ),
      ),
    );
  }
}

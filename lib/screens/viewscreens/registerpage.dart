import 'package:flutter/material.dart';
import 'package:mechinetest/screens/viewscreens/homepage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});



  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? selectedPaymentOption;
  String? selectedLocation;
  int maleCount = 2;
  int femaleCount = 2;

  int MaleCount = 0;
  int FemaleCount = 0;

  void _incrementMaleCount() {
    setState(() {
      maleCount++;
    });
  }

  void _decrementMaleCount() {
    setState(() {
      if (maleCount > 0) {
        maleCount--;
      }
    });
  }

  void _incrementFemaleCount() {
    setState(() {
      femaleCount++;
    });
  }

  void _decrementFemaleCount() {
    setState(() {
      if (femaleCount > 0) {
        femaleCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor: Colors.white,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 280),
              child: Text("Register", style: TextStyle(fontSize: 25)),
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Name",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Enter your full Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Whatsapp number",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Enter your whatsapp number',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Address",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Enter your Address',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 310),
              child: Text(
                "Location",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                ),
                hint: Text('Choose your Location', style: TextStyle(color: Colors.grey)),
                value: selectedLocation,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                },
                items: <String>['Vadakara', 'Nadakkavu'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 310),
              child: Text(
                "Branch",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Select the Branch',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.green[600]),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Text(
                "Treatments",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "1. Couple combo package i...",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Image.asset(
                        "assets/images/cross.png",
                        width: 45,
                        height: 45,
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Male: ", style: TextStyle(fontSize: 20, color: Colors.green[600])),
                          SizedBox(width: 4),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text("$maleCount", style: TextStyle(fontSize: 20, color: Colors.green[600])),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                          Text("Female: ", style: TextStyle(fontSize: 20, color: Colors.green[600])),
                          SizedBox(width: 4),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text("$femaleCount", style: TextStyle(fontSize: 20, color: Colors.green[600])),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, size: 22, color: Colors.green[600]),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Update Counts'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Male:'),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              maleCount = int.parse(value);
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: '$maleCount',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Text('Female:'),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              femaleCount = int.parse(value);
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: '$femaleCount',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        maleCount = maleCount;
                                        femaleCount = femaleCount;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
    ),
          ],
        ),
      ),

            SizedBox(height: 15),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: "+ Add Treatments",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.green[100],
                  filled: true,
                ),
              ),
            ),




            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 270),
              child: Text(
                "Total Amount",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text(
                "Discount Amount",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Payment option",
                style: TextStyle(fontSize: 18),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPaymentOptionRadio('Cash'),
                SizedBox(width:MediaQuery.of(context).size.width * 0.09,),
                buildPaymentOptionRadio('Card'),
                SizedBox(width:MediaQuery.of(context).size.width * 0.09,),
                buildPaymentOptionRadio('UPI'),
              ],
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text(
                "Advance Amount",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text(
                "Balance Amount",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text(
                "Treatment date",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.date_range, color: Colors.green[600]),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Treatment time",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Hour',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.green[600]),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width * 0.09,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Minutes',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.green[600]),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Treatment field
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 270),
                    child: Text(
                      "Treatment",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Choose preferred treatment',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.green[600]),
                          onPressed: () {
                            // Logic to fetch and display dropdown details
                          },
                        ),
                      ],
                    ),
                  ),

                  // Add Patients field
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      "Add Patients",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Male count field
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Male",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              shape: CircleBorder(),
                              onPressed: _decrementMaleCount,
                              backgroundColor: Colors.green[600],
                              child: Icon(Icons.remove, color: Colors.white),
                              mini: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '$maleCount',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              shape: CircleBorder(),
                              onPressed: _incrementMaleCount,
                              backgroundColor: Colors.green[600],
                              child: Icon(Icons.add, color: Colors.white),
                              mini: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Female count field
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Female",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              shape: CircleBorder(),
                              onPressed: _decrementFemaleCount,
                              backgroundColor: Colors.green[600],
                              child: Icon(Icons.remove, color: Colors.white),
                              mini: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '$femaleCount',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 40,
                            height: 40,
                            child: FloatingActionButton(
                              shape: CircleBorder(),
                              onPressed: _incrementFemaleCount,
                              backgroundColor: Colors.green[600],
                              child: Icon(Icons.add, color: Colors.white),
                              mini: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),






            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.05,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),


            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),




          ],
    ),
    ),
    );

  }

  Widget buildPaymentOptionRadio(String title) {
    return Row(
        children: [
        Radio<String>(
        value: title,
        groupValue: selectedPaymentOption,
          onChanged: (String? value) {
            setState(() {
              selectedPaymentOption = value;
            });
          },
        ),
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ],
    );
  }
}


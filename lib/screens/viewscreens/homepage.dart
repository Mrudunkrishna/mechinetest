import 'package:flutter/material.dart';
import 'package:mechinetest/screens/viewscreens/registerpage.dart';
import 'package:mechinetest/screens/controller/homecontrolers/apiservice.dart';
import 'package:mechinetest/screens/controller/homecontrolers/modelclass.dart';
import 'package:mechinetest/screens/controller/homecontrolers/patientprovider.dart';
import 'package:mechinetest/screens/viewscreens/loginview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Patient> _patientList = [];
  bool _isLoading = false;
  late APIService _apiService;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _apiService = APIService();
    _fetchPatientList();
  }

  Future<void> _fetchPatientList() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Patient> patients = await _apiService.fetchPatientList();
      setState(() {
        _patientList = patients.cast<Patient>();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
      print('Error fetching patient list: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_add_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.69,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Search for treatments',
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.05,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<PatientProvider>(context,listen: false).getPatientList();
                },
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
           Row(children: [
             SizedBox(
               width: MediaQuery.of(context).size.width*0.03,
             ),
             Text(
               'Sort:',
               style: TextStyle(fontSize: 18),
             ),
             SizedBox(
               width: MediaQuery.of(context).size.width*0.6,
             ),
             Container(
               width: 95,
               padding: EdgeInsets.all(12),
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.black),
                 borderRadius: BorderRadius.circular(30),
               ),
               child: Row(
                 children: [

                   Text('Date', style: TextStyle(fontSize: 16),),
                   SizedBox(width: 10),
                   Icon(Icons.keyboard_arrow_down_rounded),
                 ],
               ),)
           ],),

         Divider(color: Colors.grey,),

          SizedBox(height: 20),

          Consumer<PatientProvider>(
            builder: (context, value, child) {
              return  FutureBuilder<Map>(
                future: value.getPatientList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!["patient"].isEmpty) {
                    return Center(child: Text('No patients found.'));
                  } else {
                    var patients = snapshot.data!["patient"];
                    return SizedBox(
                      height: 500,width: 380,
                      child: ListView.builder(
                        itemCount: patients.length,
                        itemBuilder: (context, index) {
                          var patient = patients[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Container(
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Patient Name: ${patient["name"]}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Phone: ${patient["phone"]}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Address: ${patient["address"]}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              );
            },
          ),


          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Registerpage(),));
                },
                child: Text('Register',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }

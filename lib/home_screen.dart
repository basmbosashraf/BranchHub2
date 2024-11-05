
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/coponents/prefs_class.dart';
import 'package:task1/coponents/text_cont..dart';
late  int branchCounter ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late String fetchedDataString = '';


  @override
  void initState() {
    super.initState();
    SharedPreferenceHelper().loadSavedInput();
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF005EAA),
          toolbarHeight: MediaQuery.of(context).size.height * 0.10,
          title: Text(
            'Branch / Store / Cashier',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          actions: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.white),
                  onPressed: () {
                    branchCounter++;
                  },
                ),
                IconButton(
                  icon: Icon(Icons.save, color: Colors.white),
                  onPressed: () {
                    SharedPreferenceHelper().saveInput(branchCounter as String, context);
                  },
                ),
              ],
            ),
          ],

        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Branch',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 8),
                            Container(
                              height: 40,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'branchCounter',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Custom No.'),
                            SizedBox(height: 2),
                            CustomContainer(
                              textFieldLabel: '0',
                              containerWidth: 100,
                              containerHeight: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    _buildTextFieldSection('Arabic Name', 'مباني المؤسسة', 370),
                    _buildTextFieldSection('Arabic Description', 'W', 370),
                    _buildTextFieldSection('English Name', 'Company Branches', 370),
                    _buildTextFieldSection('English Description', '', 370),
                    _buildTextFieldSection('Note', 'any notes', 370),
                    _buildTextFieldSection('Address', 'KSA', 370),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldSection(String label, String hint, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        CustomContainer(
          textFieldLabel: hint,
          containerWidth: width,

        ),
      ],
    );
  }
}


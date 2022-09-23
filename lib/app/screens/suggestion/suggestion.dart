
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_full_app/app/screens/aut/authentication_screen.dart';
import 'package:firebase_full_app/app/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SuggestionPage extends StatelessWidget {
   SuggestionPage({Key? key}) : super(key: key);
var suggestion = '';
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('suggestion');
    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: const Color(0xffE7F1FF),
          child: SizedBox(
            width: 340,
            height: 391,
            child: Column(
              children: [
                const SizedBox(height: 19),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: const Color(0xffF3F8FF),
                  child:   SizedBox(
                    height: 287,
                    width: 313,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 15,
                        decoration: const InputDecoration(
                          hintText: "Пикирлер жана сунуштар1",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        onChanged: ((value) {
                          suggestion = value;
                        }
                      ),
                    ),
                    ),),),
              
                
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'АРТКА',
                        style: TextStyle(
                            color: Color(
                              0xff747980,
                            ),
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 108),
                    TextButton(
                      onPressed: () {    showDialog(
                          context: context,
                          builder: (ctx) => CustomDialog(
                            widget: Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset('assets/check-circle.svg')
                            ),
                            widget2: Column(
                              children: [
                                 const Text(
                                 '''   Ыраазычылык
     билдиребиз!''',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff515151)),
                                ),
                                const SizedBox(height: 20),
                                 const Text(
                                 '''   Сиздин оюңуз биз үчүн 
                маанилүү''',
                                  style: TextStyle(
                                      color: Color(0xffB6B6B6), fontSize: 16),
                                ),
                               const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             const  AuthenticationScreen()),
                                    );
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xff3473E6)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ); 
                                          users.add({'suggestion': suggestion}).then((value) => print('User added')).catchError((eror) => print('Failed to add user: $eror'));
}             ,         
                        
                
                      
                      
                      child: const Text(
                        'ЖӨНӨТҮҮ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
                ),
              
            ),
          ),
        ),
      );
    
  }
}

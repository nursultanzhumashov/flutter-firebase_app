
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                      padding: EdgeInsets.all(8.0),
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
                      onPressed: () {                      users.add({'suggestion': suggestion}).then((value) => print('User added')).catchError((eror) => print('Failed to add user: $eror'));
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

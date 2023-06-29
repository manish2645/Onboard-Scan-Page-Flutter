import 'dart:math';

import 'package:flutter/material.dart';

class SocialInvition extends StatefulWidget {
  const SocialInvition({super.key});

  @override
  State<SocialInvition> createState() => _SocialInvitionState();
}

class _SocialInvitionState extends State<SocialInvition> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 5,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: EdgeInsets.only(left:17, top: 16, bottom: 44, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Social Invitation", 
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18),
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.account_box, size: 34, color: Color.fromARGB(255,51,53,125),),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Invite Members", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),),
                    Text("Invite Meta Users", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal
                    ),)
                  ],
                )
              ],
            )
          ],
            
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ManualInvitation extends StatefulWidget {
  const ManualInvitation({super.key});

  @override
  State<ManualInvitation> createState() => _ManualInvitationState();
}

class _ManualInvitationState extends State<ManualInvitation> {
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
            Text("Manual Invitation", 
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18),
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person_add_alt_1_rounded, size: 34, color: Color.fromARGB(255,51,53,125),),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Single Invitation", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),),
                    Text("Invite by connecting your contact list", style: TextStyle(
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
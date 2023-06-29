import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboard_member_scan/widgets/BulkInvitation.dart';
import 'package:onboard_member_scan/widgets/ManualInvitation.dart';
import 'package:onboard_member_scan/widgets/SocialInvitation.dart';

import '../widgets/Copy.dart';

class MemberScan extends StatefulWidget {
  const MemberScan({super.key});

  @override
  State<MemberScan> createState() => _MemberScanState();
}

String url = "https://network-45465464.min.co/share-community";

class _MemberScanState extends State<MemberScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Onboard Member",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 19),
            child: CardWithUrl(url: url)
          ),
          Container(
            margin: const EdgeInsets.only(top: 19),
            child: const SocialInvition()
          ),
          Container(
            margin: const EdgeInsets.only(top: 19),
            child: const ManualInvitation()
          ),
          Container(
            margin: const EdgeInsets.only(top: 19),
            child: const BulkInvitation()
          ),
        ],
      ),
    );
  }
}
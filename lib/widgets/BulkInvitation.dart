import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:onboard_member_scan/widgets/ImportFile.dart';
import 'package:onboard_member_scan/widgets/Scan.dart';

class BulkInvitation extends StatefulWidget {
  const BulkInvitation({super.key});

  @override
  State<BulkInvitation> createState() => _BulkInvitationState();
}

class AnimatedListTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}


class _BulkInvitationState extends State<BulkInvitation> {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: AnimatedListTickerProvider());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.only(left:17, top: 16, bottom: 44, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Bulk Invitation", 
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18),
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text("Invite more than one people to this community by scanning their details or uploading through CSV.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs:const[
                         Tab(text: 'Scan'),
                         Tab(text: 'Import File'),
                      ],
                    ),
                    const TabBarView(
                      children: [
                        Scan(),
                        ImportFile(),
                      ]
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
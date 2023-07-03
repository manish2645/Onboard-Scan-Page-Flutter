import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:dotted_border/dotted_border.dart';

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
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
                  onTap: () {
                    //click function here
                  },
                  child: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 40, 40, 40)),
                ),
            const Text("Onboard Member",
            style: TextStyle(
              color: Color.fromARGB(255, 40, 40, 40),
              fontWeight: FontWeight.normal,
              fontFamily: 'Lato-Black',
              fontSize: 18,
            ),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: CardWithUrl(url: url)
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: const SocialInvitation()
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: const ManualInvitation()
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: const BulkInvitation()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Copy Widget 
class CardWithUrl extends StatelessWidget {
  final String url;

  CardWithUrl({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0,2),
            ),
          ],
        ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.only(left:17),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      url,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(40, 40, 40, 0.63),
                        fontFamily: 'Roboto-Black',
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: url));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Text copied')),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255,51,53,125),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0)
                    )
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/onboard_member_copy_icon.png',
                          height: 24,
                          width: 24,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                      'Copy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Social Widget
class SocialInvitation extends StatelessWidget {
  const SocialInvitation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0,2),
            ),
          ],
        ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child:Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Social Invitation",
                style: TextStyle(
                  fontFamily: 'Lato-Black',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Divider(color: Color.fromRGBO(237,238,255, 1), thickness: 1),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                         'assets/onboard_member_contact_icon.png',
                          height: 24,
                          width: 24,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Invite members",
                            style: TextStyle(
                              fontFamily: 'Roboto-Black',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "Invite Meta Users",
                            style: TextStyle(
                              color: Color.fromARGB(255, 173, 173, 173),
                              fontFamily: 'Roboto-Black',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle click event here
                    },
                    child: Image.asset(
                        'assets/onboard_member_arrow_icon.png',
                        height: 20,
                        width: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// Manual Widget
class ManualInvitation extends StatelessWidget {
  const ManualInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0,2),
            ),
          ],
        ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Manual Invitation", 
              style: TextStyle(
                  fontFamily: 'Lato-Black',
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              const Divider(color: Color.fromRGBO(237,238,255, 1), thickness: 1),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                          'assets/onboard_member_singleinvitation_icon.png',
                          height: 40,
                          width: 40,
                      ),
                      const SizedBox(width: 10.0,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Single Invitation", style: TextStyle(
                            fontFamily: 'Roboto-Black',
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                          ),),
                          Text("Invite by connecting your contact list", style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 173, 173, 173),
                            fontFamily: 'Roboto-Black',
                            fontWeight: FontWeight.normal
                          ),)
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle click event here
                    },
                    child: Image.asset(
                          'assets/onboard_member_arrow_icon.png',
                          height: 20,
                          width: 20,
                    ),
                  ),
                ],
              ),
            ],  
          ),
        ),
      ),
    );
  }
}


// Bulk Widgets

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
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0,2),
            ),
          ],
        ),
      child: SizedBox(
          height: 400,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Bulk Invitation",
                        style: TextStyle(
                          fontFamily: 'Roboto-Black',
                          fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Divider(color: Color.fromRGBO(237,238,255, 1), thickness: 1),
                      Text(
                        "Invite more than one people to this community by scanning their details or uploading through CSV.",
                        style: TextStyle(
                          color: Color.fromARGB(255, 177,179,183),
                          wordSpacing: 2,
                          fontFamily: 'Roboto-Black',
                          fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        indicatorColor: Color.fromARGB(255,51,53,125),
                        tabs: [
                          Tab(
                            child: Text(
                              "Scan",
                              style: TextStyle(
                                fontFamily: 'Roboto-Black',
                                color: Color.fromARGB(255, 51, 53, 125), fontSize: 16),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Import File",
                              style: TextStyle(
                                fontFamily: 'Roboto-Black',
                                color: Color.fromARGB(255, 51, 53, 125), fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        child: TabBarView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              verticalDirection: VerticalDirection.down,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    Image.asset(
                                      'assets/onboard_member_info_icon.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      "Scan your list of members and Upload to send invite",
                                      style: TextStyle(
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 177,179,183),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                const Scan(),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              verticalDirection: VerticalDirection.down,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    Image.asset(
                                      'assets/onboard_member_info_icon.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 9),
                                    const Text(
                                      "Upload list of members details in CSV format to invite.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Roboto-Regular',
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 177,179,183),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
                                const ImportFile(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}


// Scan 
class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255,247,247,255),
      child: SizedBox(
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: DottedBorder(
            color: const Color.fromARGB(255,181,183,255),
            dashPattern: const [5],
            strokeWidth: 2,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 196,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/scan');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255,51,53,125)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/onboard_member_scan_icon.png',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 10,),
                            const Text('Scan',
                            style: TextStyle(
                              fontFamily: 'Lato-Black',
                              fontSize: 18,
                              fontWeight: FontWeight.normal
                            ),),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    const Text("Scan Your Sheet", 
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto-Black',
                        color: Color.fromARGB(255, 110, 110, 110),
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
        
              ),
            ),
        ),
          
      ),
    );
  }
}


// Import
class ImportFile extends StatefulWidget {
  const ImportFile({super.key});

  @override
  State<ImportFile> createState() => _ImportFileState();
}

class _ImportFileState extends State<ImportFile> {
  @override
  Widget build(BuildContext context) {
      return Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color.fromARGB(255,247,247,255),
      child: SizedBox(
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: DottedBorder(
            color: const Color.fromARGB(255,181,183,255),
            dashPattern: const [5],
            strokeWidth: 2,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 196,
                      height: 38,
                      child: ElevatedButton(
                        onPressed: () {
                          // Import File functions
                          Navigator.pushNamed(context, '/camera');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255,51,53,125)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/onboard_member_csv_icon.png',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 10,),
                            const Text('Import File',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Lato-Black',
                              fontWeight: FontWeight.normal
                            ),),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    const Text("Upload Your File Here", 
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto-Black',
                        color: Color.fromARGB(255, 110, 110, 110),
                        fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
        
              ),
            ),
        ),
          
      ),
    );
  }
}


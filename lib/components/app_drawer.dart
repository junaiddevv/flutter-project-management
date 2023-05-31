import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: _scaffoldKey,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/s1.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jaydeep Hirani',
                                style: TextStyle(
                                    fontFamily: 'semi-bold', fontSize: 16),
                              ),
                              Text(
                                '@jaydeephirani12',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '9  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'medium'),
                              ),
                              TextSpan(
                                text: ' Following',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '0  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'medium'),
                              ),
                              TextSpan(
                                text: ' Followers',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    drawerField(() {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }, 'Profile', Icons.person_outline),
                    drawerField(() {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }, 'Lists', Icons.list_alt_outlined),
                    drawerField(() {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }, 'Topics', Icons.comment_outlined),
                    drawerField(() {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }, 'Bookmarks', Icons.bookmark_outline),
                    drawerField(() {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }, 'Moments', Icons.flash_on_outlined),
                    drawerField(() {
                      _scaffoldKey.currentState?.openEndDrawer();
                    }, 'Monetization', Icons.monetization_on),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                  bottom: BorderSide(color: Colors.grey.shade300),
                )),
                child: const Row(
                  children: [
                    Icon(Icons.rocket_launch_outlined),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Twitter for Professionals',
                        style: TextStyle(fontFamily: 'regular', fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: const Text(
                        'Settings and Privacy',
                        style: TextStyle(fontFamily: 'regular', fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Help Center',
                      style: TextStyle(fontFamily: 'regular', fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.lightbulb_outline),
                    Icon(Icons.qr_code)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerField(route, text, icon) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: InkWell(
      onTap: route,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: const TextStyle(fontFamily: 'regular', fontSize: 16),
            ),
          ),
        ],
      ),
    ),
  );
}

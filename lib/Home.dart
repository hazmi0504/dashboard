import 'package:dashboard/constant.dart';
import 'package:dashboard/views/event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:get/get.dart';
import 'Services/services.dart';
import 'model/Catfacts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Catfacts>? catfact;
  Catfacts? cat;
  bool isLoading = false;

  getcatfact() async {
    cat = await Services().getCatfacts();
    if (cat != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getcatfact();
  }

  @override
  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;

    return AdminScaffold(
      backgroundColor: Colors.white,
      // backgroundColor: HexColor('FEFBF6'),
      // backgroundColor: HexColor('#eeeeee'),
      // backgroundColor: Color.fromARGB(179, 243, 243, 243),
      appBar: AppBar(
          foregroundColor: Colors.blue,
          elevation: 100,
          title: const Text('Dashboard'),
          actions: [
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 5.0),
                  height: 50,
                  width: 50,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('./assets/profile.jpg'),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 40.0),
                  height: 50,
                  width: 50,
                  child: const Text('Hazmi'),
                ),
              ],
            ),
          ]),
      sideBar: SideBar(
        backgroundColor: Colors.white70,
        items: const [
          AdminMenuItem(
            title: 'User Dashboard',
            icon: Icons.dashboard,
            route: '/',
            children: [
              AdminMenuItem(
                title: 'Home',
                route: '/',
              ),
              AdminMenuItem(
                title: 'Event',
                route: '/event',
              ),
            ],
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: HexColor('#eeeeee'),
          // height: 1000,
          width: MediaQuery.of(context).size.width,
          // - 240.0,
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    child: Text(
                      "Registered Events",
                      style: titleStyle,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(Event(), routeName: '/event');
                    },
                    child: Material(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      elevation: 5,
                      child: Container(
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Container(
                                width: 500,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  child: Image.asset(
                                    './assets/profile.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                ),
                                width: 500,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        child: const Text(
                                          'Dell Charity Event',
                                          style: textTitle,
                                        ),
                                      ),
                                    ),
                                    info('Location', 'Kuala Lumpur'),
                                    info('Time', '9.00 am - 10.00 pm'),
                                    info('Participants', '1.5K / 5000 '),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    height: 50,
                    child: Text(
                      "Upcoming Events",
                      style: titleStyle,
                    ),
                  ),
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    elevation: 5,
                    child: Container(
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: 500,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Image.asset(
                                  './assets/profile.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              width: 500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: const Text(
                                        'Dell Charity Event',
                                        style: textTitle,
                                      ),
                                    ),
                                  ),
                                  info('Location', 'Kuala Lumpur'),
                                  info('Time', '9.00 am - 10.00 pm'),
                                  info('Participants', '0 / 5000 '),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 300,
                // color: Colors.red,
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (isLoading) {
                        return Container(
                          color: Colors.amber,
                          child: Center(child: Text(cat?.fact ?? "0")),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget info(String title, String content) {
  return Flexible(
    flex: 1,
    child: Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            constraints: BoxConstraints(minWidth: 80),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              title,
              style: textContentTitle,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Text(
              content,
              style: textContent,
            ),
          ),
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

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
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: '/',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Top Level',
            icon: Icons.file_copy,
            children: [
              AdminMenuItem(
                title: '   Level Item 1',
                route: '/secondLevelItem1',
              ),
              AdminMenuItem(
                title: 'Second Level Item 2',
                route: '/secondLevelItem2',
              ),
              AdminMenuItem(
                title: 'Third Level',
                children: [
                  AdminMenuItem(
                    title: 'Third Level Item 1',
                    route: '/thirdLevelItem1',
                  ),
                  AdminMenuItem(
                    title: 'Third Level Item 2',
                    route: '/thirdLevelItem2',
                  ),
                ],
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
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: 400,
        width: 400,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        //   child: FutureBuilder(
        //       future: getHttp(),
        //       builder: (BuildContext context, AsyncSnapshot snapshot) {
        //         if (snapshot.hasData) {
        //           return ListView.builder(
        //               padding: const EdgeInsets.all(8),
        //               itemCount: 2,
        //               itemBuilder: (BuildContext context, int index) {
        //                 print(snapshot.data['fact']);
        //                 return Container(
        //                   height: 50,
        //                   color: Colors.amber,
        //                   child: Center(child: Text(snapshot.data['fact'])),
        //                 );
        //               });
        //         } else {
        //           return Center(
        //             child: CircularProgressIndicator(),
        //           );
        //         }
        //       }),
        // ),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              if (isLoading) {
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(child: Text(cat?.fact ?? "0")),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      )),
    );
  }
}

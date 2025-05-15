import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:quran/ui/screen.dart';
import 'single_surah_page.dart';
import 'package:get/get.dart';
class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List versese = [];
  List allSurahs = [];
  List filteredSurahs = [];
  var surahName = '';

  Future<void> initAllSurahs() async {
    final String response =
        await rootBundle.loadString('assets/all_surahs.json');
    final data = await json.decode(response);

    setState(() {
      allSurahs = data['all_surahs'];
    });
  }

  @override
  void initState() {
    initAllSurahs();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        filteredSurahs = allSurahs;
      });
    });
    super.initState();
  }

  // This function is called whenever the text field changes
  void runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = allSurahs;
    } else {
      results = allSurahs
          .where((surah) =>
              surah["name"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              surah["transliteration"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              surah["translation"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              surah["type"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredSurahs = results;
    });
  }

  static Route createRouteWithArgs(String arg, Widget destination) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      settings: RouteSettings(
          arguments: // sending the data to output page
              arg),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor:Colors.white,
        child: ListView(
           
          children: [
            const UserAccountsDrawerHeader(
               decoration: BoxDecoration(
          color: Colors.yellow, // Change the background color of the header here
        ),
              accountName: Text("Profile"),
              accountEmail: Text("Group #6"),currentAccountPicture: CircleAvatar(
foregroundImage: AssetImage('assets/user.png'),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuranPage()));
              },
            ),
            ListTile(
              title: const Text('Feed Back'),
              onTap: () {
             Get.offAll(Screen());
              },
            ),
          ],
        ),
      ),
appBar: AppBar(
        title: Text(
          'Al Quran',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 60.2,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
      ),
        body: Center(
      child: SafeArea(
        child: ContainerPlus(
          child: Center(
              child: Column(
            children: [
              ContainerPlus(
                color: Colors.white,
                margin: const EdgeInsets.only(
                    top: 7, left: 12, right: 12, bottom: 5),
                height: 50,
                child: TextField(
                  onChanged: (value) => runFilter(value),
                  decoration: const InputDecoration(
                    hintText: 'Enter Surah Name',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                      ),
                      contentPadding: EdgeInsets.all(12),
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: filteredSurahs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            createRouteWithArgs(
                                filteredSurahs[index]['id'].toString(),
                                const SingleSurahPage()),
                          );
                        },
                        child: ContainerPlus(
                          margin: const EdgeInsets.only(
                              top: 2, left: 12, right: 12),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.yellow, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            title: Text(filteredSurahs[index]['name']),
                            subtitle:
                                Text(filteredSurahs[index]['transliteration']),
                            trailing:
                                Text(filteredSurahs[index]['translation']),
                            leading: ContainerPlus(
                              width: 35,
                              height: 35,
                              isCircle: true,
                              color: Colors.yellow,
                              child: Center(
                                  child: Text("${index + 1}".toString())),
                            ),
                          ),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 1,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    ));
  }
}

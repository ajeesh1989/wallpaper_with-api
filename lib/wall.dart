import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_app/about.dart';
import 'package:wallpaper_app/full_screen.dart';
import 'package:wallpaper_app/privacy.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({super.key});

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images = [];
  int page = 1;
  @override
  initState() {
    super.initState();
    fetchAPI();
  }

  fetchAPI() async {
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
        headers: {
          'Authorization':
              'm4HfLvERsUnMKWp80nTzUDkxibyMsCPbcijVnArVfFWOZOAUHZ6lvqGm'
        }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
    });
  }

  loadMore() async {
    setState(() {
      page = page + 1;
    });

    String url =
        'https://api.pexels.com/v1/curated?per_page=80&page=' + page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization':
          'm4HfLvERsUnMKWp80nTzUDkxibyMsCPbcijVnArVfFWOZOAUHZ6lvqGm'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pixel Perfect'),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/splash.jpg"),
                          fit: BoxFit.fill),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Welcome to Pixel Perfect',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.wallpaper_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text('About Pixel Perfect'),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const About()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.privacy_tip),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Privacy Policy'),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Back to Pixel Perfect'),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListTile(
            //     title: Row(
            //       children: const [
            //         Icon(Icons.share),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text('Share'),
            //       ],
            //     ),
            //     onTap: () {
            //       GestureDetector(
            //         child: const Text(
            //           'Share',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //         onTap: () {
            //           Share.share(
            //               'https://play.google.com/store/apps/details?id=com.');
            //         },
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 280,
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Version 0.0.1',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Developed by ',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ajeesh Das.H',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Copyright © 2023',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 8),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                  imageurl: images[index]['src']['large2x'])));
                    },
                    child: Container(
                      color: Colors.white,
                      child: Image.network(
                        images[index]['src']['tiny'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              loadMore();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Load More',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

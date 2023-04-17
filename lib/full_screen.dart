import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key, required this.imageurl});
  final String imageurl;

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setwallpaper() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  Future<void> setlockscreen() async {
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  Future<void> setbothScreen() async {
    int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        // title: const Text('Pixel Perfect'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(widget.imageurl),
              ),
            ),
            InkWell(
              onTap: () {
                setwallpaper();
                Get.snackbar(
                  'Hurray!',
                  "Homescreen wallpaper set successfully",
                  snackPosition: SnackPosition.TOP,
                );
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Set Homescreen',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
              thickness: 0.15,
            ),
            InkWell(
              onTap: () {
                setlockscreen();
                Get.snackbar('Hurray!', "Lockscreen wallpaper set successfully",
                    snackPosition: SnackPosition.TOP);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Set Lockscreen',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
              thickness: 0.15,
            ),
            InkWell(
              onTap: () {
                setbothScreen();
                Get.snackbar('Hurray!',
                    "Homescreen & Lockscreen wallpaper set successfully",
                    snackPosition: SnackPosition.TOP);
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Set Homescreen & Lockscreen',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 30,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

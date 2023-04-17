import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About Pixel Perfect',
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                textAlign: TextAlign.justify,
                "Pixel Perfect is a wallpaper app that provides high-quality wallpapers that are perfectly designed to fit the screen of your device. With a vast collection of stunning wallpapers, Pixel Perfect allows you to customize your device's home screen and lock screen with ease. The app features a user-friendly interface that makes it easy to search, preview, and download wallpapers. Additionally, Pixel Perfect offers daily wallpaper updates to keep your device looking fresh and vibrant.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                textAlign: TextAlign.justify,
                "Pixel Perfect offers a vast collection of wallpapers in various categories, including Abstract, Nature, Animals, Space, and more. This means you can find the perfect wallpaper to match your style or mood.The app provides high-quality wallpapers that are optimized for different screen sizes, including smartphones and tablets. This ensures that the wallpaper you choose looks great on your device, without any pixelation or distortion.Pixel Perfect allows you to preview wallpapers before downloading them, so you can see how they will look on your device's home screen or lock screen. You can also save your favorite wallpapers to a separate folder for quick access.The app features a simple and intuitive interface, making it easy to navigate and find the wallpaper you want. You can search for wallpapers by category or keyword, and you can also sort them by popularity or latest uploads.Pixel Perfect offers daily wallpaper updates, so you can discover new wallpapers and keep your device looking fresh and vibrant. You can also opt to receive notifications when new wallpapers are added.",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

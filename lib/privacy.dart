import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Text(
              textAlign: TextAlign.justify,
              "Pixel Perfect takes user privacy very seriously and is committed to protecting your personal information. The app only collects and uses personal data for the purpose of providing and improving the service, and will never share it with third parties without your consent.When you download and use the app, Pixel Perfect may collect certain information such as your device type, operating system, and app usage data. This information is used to improve the app and provide a better user experience.Pixel Perfect may also collect and use your personal information if you choose to sign up for an account within the app. This information may include your name, email address, and other contact information.The app uses cookies and similar technologies to collect information about your device and how you use the app. This information is used to improve the app and provide a better user experience.Pixel Perfect may also use third-party analytics tools to collect and analyze app usage data. This information is used to improve the app and provide a better user experience.The app allows you to opt-out of certain types of data collection and use by changing your device settings or disabling certain features within the app.If you have any questions or concerns about Pixel Perfect's privacy policy, you can contact the developer directly through the app's support page.",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}

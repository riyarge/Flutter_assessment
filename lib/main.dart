import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Defines the app's color theme using a seed color.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: "Flutter Demo"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(  // Centering the entire column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image centered
            const Image(image: NetworkImage("https://stryderbikes.com/cdn/shop/files/1_zeetamax_1445x.png?v=1722578266")),
            SizedBox(width:20,height:20),

            // Button centered below the image
            ElevatedButton(
              onPressed : () {_launchUrl();},
              child: const Text("Click me for video")
            ),
          ],
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://youtu.be/Mj7wh2_pbN4?si=tRefux3cUGztcpO_');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

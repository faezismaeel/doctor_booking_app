import 'package:book_your_doctor/screens/home/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var loadingPercentage = 0;
  late WebViewController webController;

  @override
  void initState() {
    webController = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
                final checkUrl = Uri.parse("https://api.whatsapp.com/send?phone=919645111786"); 
            if(checkUrl.host == Uri.parse(url).host){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_){
                  return const HomeScreen();
                })
              );
            }
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
        
          });
        },
      ))
      ..loadRequest(Uri.parse('https://sirajulhuda.com/'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(controller: webController),
          if(loadingPercentage <100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          )
        ],
      ),
    );
  }
}

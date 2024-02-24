import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String url;
  const WebViewContainer({super.key, required this.url});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://fight-score.com?embed=true'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Webview')),
      body: WebViewWidget(controller: controller),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewContainer extends StatefulWidget {
//   final String url;
//   const WebViewContainer({super.key, required this.url});

//   @override
//   State<WebViewContainer> createState() => _WebViewContainerState();
// }

// class _WebViewContainerState extends State<WebViewContainer> {
//   final controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..loadRequest(Uri.parse('https://fight-score.com?embed=true'));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Webview')),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }

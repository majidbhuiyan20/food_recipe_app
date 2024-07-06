import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Recipeview extends StatefulWidget {

  String url;
  Recipeview(this.url);
  @override
  State<Recipeview> createState() => _RecipeviewState();
}

class _RecipeviewState extends State<Recipeview> {
  late String finalUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  void initState() {

    super.initState();
    if(widget.url.toString().contains("https://"))
    {
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    }
    else
    {
      finalUrl = widget.url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Recipe App"),
      ),
      body: Container(
        child:WebView(
          initialUrl: finalUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              controller.complete(webViewController);
            });
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidgetBuilder extends StatefulWidget {
  const WebViewWidgetBuilder({super.key, required this.url});
  final String url;

  @override
  State<WebViewWidgetBuilder> createState() => _WebViewWidgetBuilderState();
}

class _WebViewWidgetBuilderState extends State<WebViewWidgetBuilder> {
  late final WebViewController _webViewController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print("Progress: $progress%");
          },
          onPageStarted: (String url) {
            print('Started loading: $url');
            isLoading = false;
            setState(() {});
          },
          onPageFinished: (String url) {
            print('Finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            print('Error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate; // السماح بالتنقل لجميع الروابط
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    var appBarWebpageTitle = FutureBuilder(
      future: _webViewController.getTitle(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data}");
        } else {
          return Text("Loading");
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 15,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.clear)),
        centerTitle: true,
        title: appBarWebpageTitle,
        actions: [
          IconButton(
              onPressed: () async {
                if (await _webViewController.canGoBack()) {
                  _webViewController.goBack();
                }
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () => _webViewController.reload(),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFFB059),
              ),
            )
          : WebViewWidget(controller: _webViewController),
    );
  }
}

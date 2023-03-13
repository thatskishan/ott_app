import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebApp extends StatefulWidget {
  final String urlPath;
  const WebApp({Key? key, required this.urlPath}) : super(key: key);

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  String data = "";
  String myUrl = "https://www.hotstar.com/in";
  bool canGoBack = false;
  bool canGoForward = false;
  String currentUrl = "";
  List history = [];
  List bookMark = [];
  double progress = 0;

  late InAppWebViewController myWeb;
  late PullToRefreshController refreshController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myUrl = widget.urlPath;
    refreshController = PullToRefreshController(
      onRefresh: () {
        setState(() {
          refreshController.endRefreshing();
        });
      },
      options: PullToRefreshOptions(
        enabled: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return WillPopScope(
      onWillPop: () async {
        if (await myWeb.canGoBack()) {
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: InAppWebView(
            onWebViewCreated: (con) {
              myWeb = con;
            },
            onProgressChanged: (controller, p) {
              setState(() {
                progress = p.toDouble();
              });
            },
            initialUrlRequest: URLRequest(
              url: Uri.parse(myUrl),
            ),
            pullToRefreshController: refreshController,
            onLoadStart: (con, c) async {
              Uri? dummy = await myWeb.getUrl();
              currentUrl = dummy!.scheme;
              currentUrl = c.toString();
              canGoBack = await myWeb.canGoBack();
              canGoForward = await myWeb.canGoForward();
              setState(() {});
            },
            onLoadStop: (InAppWebViewController controller, Uri? url) {
              currentUrl = url.toString();
              refreshController.endRefreshing();
            },
          ),
        ),
      ),
    );
  }
}

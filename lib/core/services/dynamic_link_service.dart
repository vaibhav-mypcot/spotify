import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

/// [DynamicLinkService]
class DynamicLinkService {
  /// create the link
  ///
  Future<String> createLink(String refCode) async {
    final String url = "https://com.example.spotify?ref=$refCode";
    final parameters = DynamicLinkParameters(
        androidParameters: const AndroidParameters(
            packageName: "com.example.spotify", minimumVersion: 0),
        iosParameters: const IOSParameters(
            bundleId: "com.example.spotify", minimumVersion: "0"),
        link: Uri.parse(url),
        uriPrefix: "https://spotifyclonemusicappp.page.link");

    final dynamicLink = await FirebaseDynamicLinks.instance;

    final refLink = await dynamicLink.buildShortLink(parameters);

    return refLink.shortUrl.toString();
  }

  // Init Dynamic link

  void initDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    print("here is a dynamic link/;$instanceLink");

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;

      Share.share("this is the link ${refLink.data}");
      print("this is the link ${refLink.data}");
    }
  }
  // static final DynamicLinkService _singleton = DynamicLinkService._internal();
  // DynamicLinkService._internal();
  // static DynamicLinkService get instance => _singleton;

  // Create new dynamic link
  // void createDynamicLink() async{
  //   final dynamicLinkParams = DynamicLinkParameters(
  //     link: Uri.parse("https://spotifyclonemusicapp.page.link.com"),
  //     uriPrefix: "https://spotifyclonemusicapp.page.link",
  //     androidParameters: const AndroidParameters(packageName: "com.example.spotify"),
  //     iosParameters: const IOSParameters(
  //         bundleId: "com.example.spotify",
  //       appStoreId: "123456789"
  //     ),
  //   );
  //   final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
  //   debugPrint("dynamic link: ${dynamicLink.shortUrl}");
  // }
}

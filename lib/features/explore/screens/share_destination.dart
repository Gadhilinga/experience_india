import 'package:experience_india/features/explore/models/explore_get_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import 'package:get/get.dart';
class ShareDestination {
  static const String baseUrl = 'https://yatrivo.app';

  static Future<void> share(ExploreGetAllModel destination) async {
    final name = destination.name ?? 'Amazing destination';

    final slug = name
        .toLowerCase()
        .trim()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');

    final url = Uri.parse('$baseUrl/explore/$slug').toString();

    final message =
        '''
Explore $name on Yatrivo 🇮🇳

$url
''';

    await SharePlus.instance.share(
      ShareParams(
        uri: Uri.parse(url),
        subject: 'Explore $name on Yatrivo',
      ),
    );
  }
}


class DeepLinkService extends GetxService {
  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _linkSubscription;

  Uri? initialUri;

  Future<DeepLinkService> init() async {
    // Link that opened the app when it was completely closed
    try {
      final uri = await _appLinks.getInitialLink();

      if (uri != null) {
        initialUri = uri;

        print('========== INITIAL DEEP LINK ==========');
        print('URI: $uri');
      }
    } catch (e) {
      print('Initial deep link error: $e');
    }

    // Link received while app is already running
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        print('========== DEEP LINK RECEIVED ==========');
        print('URI: $uri');

        initialUri = uri;
      },
      onError: (error) {
        print('Deep link stream error: $error');
      },
    );

    return this;
  }

  String? getExploreSlug() {
    final uri = initialUri;

    if (uri == null) {
      return null;
    }

    print('Deep link path: ${uri.path}');

    final segments = uri.pathSegments;

    if (segments.length >= 2 &&
        segments[0] == 'explore') {
      return segments[1];
    }

    return null;
  }

  void clearLink() {
    initialUri = null;
  }

  @override
  void onClose() {
    _linkSubscription?.cancel();
    super.onClose();
  }
}
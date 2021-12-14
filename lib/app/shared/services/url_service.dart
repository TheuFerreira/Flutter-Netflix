import 'package:url_launcher/url_launcher.dart';

class URLService {
  Future open(String url) async {
    await launch(url);
  }
}

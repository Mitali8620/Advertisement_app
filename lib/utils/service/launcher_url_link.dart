import 'package:url_launcher/url_launcher.dart';

class LauncherLink{
  Future<void> launcherLink({required String link}) async {
    try{
      if (await canLaunchUrl(Uri.parse(link))) {
        await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
      }
    }catch(e){
      print("e  ${e.toString()}");
    }
  }
}
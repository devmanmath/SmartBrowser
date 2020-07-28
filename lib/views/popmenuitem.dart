import 'package:smart_browser/views/home.dart';

enum NavLinks { Back, Setting, Share, Bookmark, DesktopSite }

String displayString(NavLinks link) {
  switch (link) {
    case NavLinks.Back:
      return "Back";
      break;

    case NavLinks.Setting:
      return "Setting";
      break;
    case NavLinks.Share:
      return "Share";
      break;

    case NavLinks.Bookmark:
      return "Bookmark";
      break;
    case NavLinks.DesktopSite:
      return "Desktop Site";
      break;

    default:
      return "";
  }
}

String linkUrl(NavLinks link) {
  switch (link) {
    case NavLinks.Back:
      return "https://flutter-to-fly.web.app/";
      break;

    case NavLinks.Setting:
      return "https://github.com/ptyagicodecamp";
      break;
    case NavLinks.Share:
      return "https://www.youtube.com/channel/UCO3_dbHasEnA2dr_U0EhMAA?view_as=subscriber";
      break;

    case NavLinks.Bookmark:
      return "https://flutterjobs.info/jobs/all";
      break;
    case NavLinks.Bookmark:
      return "https://youtube.com";
      break;

    default:
      return "";
  }
}

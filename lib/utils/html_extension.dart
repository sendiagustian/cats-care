import 'package:html2md/html2md.dart' as html2md;
import 'package:intl/intl.dart';

class Html2StringExtension {
  static String renderToSring(String htmlData) {
    return html2md.convert(htmlData);
  }

  static String removeTag(String htmlString) {
    return Bidi.stripHtmlIfNeeded(htmlString);
  }
}

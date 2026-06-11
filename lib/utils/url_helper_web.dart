import 'dart:html' as html;

void download(String url) {
  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download = "Abubakar_Ansari_Resume.pdf";
  anchorElement.click();
}

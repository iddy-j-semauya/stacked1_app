import 'package:stacked/stacked.dart';

import 'package:stacked1_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';



import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';

class RequestLoanViewModel extends BaseViewModel {
  // Fungua link ya fomu moja kwa moja kwenye browser au pakua file
  Future<void> downloadForm() async {
    // Tumia file URI kama ulivyoomba
    const url = 'file:///c:/id/documents/stacked.docx';
    try {
      await OpenFile.open(Uri.parse(url).toFilePath());
    } catch (e) {
      print('Could not open file: $e');
    }
  }

  void uploadData() {
    locator<NavigationService>().navigateTo('/upload-data-view');
  }
}
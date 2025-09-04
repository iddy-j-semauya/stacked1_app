import 'package:stacked1_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked1_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked1_app/ui/views/home/home_view.dart';
import 'package:stacked1_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked1_app/ui/views/upload_data/upload_data_view.dart';
import 'package:stacked1_app/ui/views/upload_data/upload_data_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/request_loan/request_loan_view.dart';
import '../ui/views/request_loan/request_loan_viewmodel.dart';
import '../ui/views/wallet/wallet_view.dart';
import '../ui/views/wallet/wallet_viewmodel.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: RequestLoanView),
    MaterialRoute(page: WalletView),
    MaterialRoute(page: UploadDataView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Factory(classType: RequestLoanViewModel),
    Factory(classType: WalletViewModel),
    Factory(classType: UploadDataViewModel),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}

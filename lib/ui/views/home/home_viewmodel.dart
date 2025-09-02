import 'package:stacked1_app/app/app.bottomsheets.dart';
import 'package:stacked1_app/app/app.dialogs.dart';
import 'package:stacked1_app/app/app.locator.dart';
import 'package:stacked1_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  //function
  void onOmbaMkopoTapped() {
    _navigationService.navigateTo(Routes.requestLoanView);
  }

  void onFanyaMalipoTapped() {
    _navigationService.navigateTo(Routes.walletView);
  }

  // Counter logic
  int _counter = 0;
  String get counterLabel => 'Counter is: $_counter';

  void incrementCounter() {
    _counter++;
    rebuildUi(); // Updates the UI
  }

  // Dialog logic
  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  // Bottom sheet logic
  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  // Bottom navigation logic
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    rebuildUi(); // Updates the UI when navigation changes
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'wallet_viewmodel.dart';

class WalletView extends StackedView<WalletViewModel> {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, WalletViewModel viewModel, Widget? child) {
    return Center(
      child: Text(
        'Wallet Page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  WalletViewModel viewModelBuilder(BuildContext context) => WalletViewModel();
}

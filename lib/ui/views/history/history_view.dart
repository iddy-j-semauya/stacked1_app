import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'history_viewmodel.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HistoryViewModel viewModel, Widget? child) {
    return Center(
      child: Text(
        'History Page',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  HistoryViewModel viewModelBuilder(BuildContext context) => HistoryViewModel();
}

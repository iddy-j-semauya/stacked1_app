import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked1_app/ui/views/request_loan/request_loan_viewmodel.dart';


class RequestLoanView extends StackedView<RequestLoanViewModel> {
  const RequestLoanView({super.key});

  @override
  Widget builder(BuildContext context, RequestLoanViewModel viewModel, Widget? child) {
    final horizontalPadding = MediaQuery.of(context).size.width > 600 ? 60.0 : 25.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Omba Mkopo', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9FAFB),
        foregroundColor: const Color(0xFF111827),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF111827)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mikopo Tunaotoa kwa mara ya kwanza:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF10B981), width: 2),
                ),
                child: const Center(
                  child: Text(
                    'TZS 60,000',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF10B981),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'Malipo yanayofuata',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    icon: Icons.file_download,
                    label: 'Pakua\nFomu',
                    onPressed: viewModel.downloadForm, // Imeunganishwa na ViewModel
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionButton(
                    icon: Icons.file_upload,
                    label: 'Pakia\nData',
                    onPressed: viewModel.uploadData, // Imeunganishwa na ViewModel
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Hapa utaunganisha View na ViewModel
  @override
  RequestLoanViewModel viewModelBuilder(BuildContext context) => RequestLoanViewModel();

  // Widget ya kusaidia
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 32,
                color: const Color(0xFF10B981),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked1_app/ui/views/upload_data/upload_data_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadDataView extends StackedView<UploadDataViewModel> {
  const UploadDataView({super.key});

  @override
  Widget builder(BuildContext context, UploadDataViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pakia Data'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF9FAFB),
        foregroundColor: const Color(0xFF111827),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => StackedService.navigatorKey?.currentState?.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jaza taarifa zako kupata mkopo',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              hint: 'Majina Matatu',
              icon: Icons.person_outline,
            ),
            _buildTextField(
              hint: 'Namba ya NIDA',
              icon: Icons.credit_card,
            ),
            _buildTextField(
              hint: 'Jina la Mtaa',
              icon: Icons.location_on_outlined,
            ),
            _buildTextField(
              hint: 'Namba ya nyumba',
              icon: Icons.home_outlined,
            ),
            _buildTextField(
              hint: 'Namba ya simu',
              icon: Icons.phone_outlined,
            ),
            const SizedBox(height: 20),

            _buildImagePickerRow(
              icon: Icons.description_outlined,
              label: 'Picha ya fomu uliyojaza',
              onTap: viewModel.onPickFormImage,
              image: viewModel.formImage,
            ),
            _buildImagePickerRow(
              icon: Icons.person_outline,
              label: 'Picha yako',
              onTap: viewModel.onPickUserImage,
              image: viewModel.userImage,
            ),
            _buildImagePickerRow(
              icon: Icons.people_outline,
              label: 'Picha ya Mdhamini',
              onTap: viewModel.onPickGuarantorImage,
              image: viewModel.guarantorImage,
            ),
            _buildImagePickerRow(
              icon: Icons.badge_outlined,
              label: 'Picha ya Kitambulisho cha kupiga kura',
              onTap: viewModel.onPickVoterIdImage,
              image: viewModel.voterIdImage,
            ),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: viewModel.onSendTapped,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Tuma'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  UploadDataViewModel viewModelBuilder(BuildContext context) => UploadDataViewModel();
}

// Helper widgets
Widget _buildTextField({required String hint, required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        prefixIcon: Icon(icon, color: const Color(0xFF6B7280)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _buildImagePickerRow({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
  required File? image,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(icon, color: const Color(0xFF6B7280)),
        const SizedBox(width: 10),
        Expanded(child: Text(label)),
        SizedBox(
          width: 100,
          child: OutlinedButton(
            onPressed: onTap,
            child: Text(image != null ? 'Imepakiwa' : 'Chagua'),
          ),
        ),
      ],
    ),
  );
}
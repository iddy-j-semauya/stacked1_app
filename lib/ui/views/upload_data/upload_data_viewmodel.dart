import 'dart:io';
import 'package:stacked/stacked.dart';
import 'package:image_picker/image_picker.dart';


class UploadDataViewModel extends BaseViewModel {
  final _imagePicker = ImagePicker();

  File? _formImage;
  File? _userImage;
  File? _guarantorImage;
  File? _voterIdImage;

  File? get formImage => _formImage;
  File? get userImage => _userImage;
  File? get guarantorImage => _guarantorImage;
  File? get voterIdImage => _voterIdImage;

  // Function ya kuchagua picha
  Future<void> pickImage(Function(File) onImageSelected) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImageSelected(File(pickedFile.path));
      notifyListeners();
    }
  }

  void onPickFormImage() => pickImage((file) => _formImage = file);
  void onPickUserImage() => pickImage((file) => _userImage = file);
  void onPickGuarantorImage() => pickImage((file) => _guarantorImage = file);
  void onPickVoterIdImage() => pickImage((file) => _voterIdImage = file);

  // Function ya kutuma data
  void onSendTapped() {
    // Kazi ya kutuma data na picha kwenye API
    print('Button ya Tuma imebonyezwa!');

    // Hapa utaongeza mantiki ya kuthibitisha na kutuma data.
    // Mfano:
    // if (_formImage != null && _userImage != null && ...) {
    //   // Call an API service to upload data.
    // } else {
    //   // Show a snackbar or dialog indicating missing fields.
    // }

    // navigate to another view
    // _navigationService.navigateTo(Routes.someConfirmationView);
  }
}
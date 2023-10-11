import 'dart:io';
import 'package:iaudiometer/utils/toaster.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Helper {
  final ImagePicker _picker = ImagePicker();

  String getFormattedDate(String dtStr) {
    var dt = DateTime.parse(dtStr).toUtc().toLocal();
    return "${dt.day.toString().padLeft(2, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.year}";
  }

  String getFormattedTime(String dtStr) {
    var dt = DateFormat("hh:mm a").format(DateTime.parse(dtStr).toLocal());
    return dt;
  }

  String getFormattedDateTimer(String dtStr) {
    var date = DateFormat('dd MMM yyyy', 'en_US').format(DateTime.parse(dtStr)).toString();
    var time = DateFormat("hh:mm a").format(DateTime.parse(dtStr).toLocal());
    return "$date\t$time";
  }

  String getFormattedFilterDate(String dtStr) {
    return DateFormat('dd MMM yyyy', 'en_US').format(DateTime.parse(dtStr)).toString();
  }

  Future<File?> pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        return File(file.path);
      }
      return null;
    } catch (err) {
      toaster.error("Error while clicking image!");
      return null;
    }
  }

  bool isMobileValidation(String phoneNumber) {
    String regexPattern = r'^[6-9][0-9]{9}$';
    var regExp = RegExp(regexPattern);
    if (phoneNumber.isEmpty) {
      return false;
    } else if (regExp.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }
}

Helper helper = Helper();




class Validator {
  
  static  String? validateMobile( String? mobileNumber) {
    if(mobileNumber == null || mobileNumber.isEmpty) {
      return 'Mobile number cannot be empty';
    }
    if (!RegExp(r'^\d{10}$').hasMatch(mobileNumber)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;

}

}

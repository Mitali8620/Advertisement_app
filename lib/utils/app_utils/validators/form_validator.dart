extension FormValidator on String {
  bool isMobileValid() {
    return this.length == 10 && RegExp(r"^[6-9]\d{9}$").hasMatch(this);
  }

  bool isCodeValid() {
    return this.length == 12 && RegExp(r'^[a-zA-Z0-9_]*$').hasMatch(this);
  }
}

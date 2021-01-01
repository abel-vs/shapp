String emptyValidator(value, String text) {
  if (value.isEmpty) {
    return text;
  }
  return null;
}
extension StringExtension on String {}

extension StringNullException on String? {
  bool toBool() => this == 'true';
}

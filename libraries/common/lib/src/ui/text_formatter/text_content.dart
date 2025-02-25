part of 'text_formatter.dart';

class TextContent {
  final String text;
  final TextStyle? style;
  final GestureRecognizer? recognizer;

  const TextContent(
    this.text, {
    this.style,
    this.recognizer,
  });
}

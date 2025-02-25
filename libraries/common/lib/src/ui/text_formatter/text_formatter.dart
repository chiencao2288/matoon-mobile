import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

part 'text_content.dart';

class TextFormatter extends StatelessWidget {
  final String text;
  final Map<String, TextContent> values;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TextFormatter({
    super.key,
    this.style,
    this.textAlign,
    required this.text,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: _splitTextToItems(
          RegExp(r'{[a-zA-Z]*}'),
          onMatch: _buildMatchText,
          onNonMatch: _buildNonMatchText,
        ),
      ),
      style: style,
      textAlign: textAlign,
    );
  }

  InlineSpan _buildMatchText(String key) {
    if (values.containsKey(key)) {
      final content = values[key]!;

      return TextSpan(
        text: content.text,
        recognizer: content.recognizer,
        style: content.style ?? style,
      );
    }

    return _buildNonMatchText(key);
  }

  InlineSpan _buildNonMatchText(String value) {
    return TextSpan(
      text: value,
      style: style,
    );
  }

  List<T> _splitTextToItems<T>(
    Pattern pattern, {
    T Function(String)? onMatch,
    T Function(String)? onNonMatch,
  }) {
    List<T> items = [];

    text.splitMapJoin(
      pattern,
      onMatch: (match) {
        if (onMatch != null) {
          items.add(
            onMatch(
              text.substring(
                match.start + 1,
                match.end - 1,
              ),
            ),
          );
        }

        return '';
      },
      onNonMatch: (value) {
        if (onNonMatch != null) {
          items.add(onNonMatch(value));
        }

        return '';
      },
    );

    return items;
  }
}

library text_link;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget that displays text with embedded links that can be tapped,
/// and provides "Read more" / "Read less" functionality.
class LinkText extends StatefulWidget {
  /// The text to display, which may contain embedded links.
  final String text;

  /// The style to apply to the non-link parts of the text.
  final TextStyle style;

  /// The style to apply to the link parts of the text.
  final TextStyle linkStyle;

  /// The maximum length of the collapsed text before truncation.
  final int lengthThreshold;

  /// The text to display for the "Read more" link.
  final String readMoreText;

  /// The text to display for the "Read less" link.
  final String readLessText;

  /// The color of the "Read more" link text.
  final Color readMoreColor;

  /// The color of the "Read less" link text.
  final Color readLessColor;

  /// The mode used to launch URLs.
  final LaunchMode mode;

  /// Creates a [LinkText] widget.
  ///
  /// The [text] parameter is required.
  /// The [style] parameter is used for non-link text and defaults to [TextStyle(color: Colors.black)].
  /// The [linkStyle] parameter is used for link text and defaults to [TextStyle(color: Colors.blue, decoration: TextDecoration.underline)].
  /// The [lengthThreshold] parameter determines the maximum length of the collapsed text and defaults to 350 characters.
  /// The [readMoreText] parameter is the text to display for the "Read more" link and defaults to 'Read more'.
  /// The [readLessText] parameter is the text to display for the "Read less" link and defaults to 'Read less'.
  /// The [readMoreColor] parameter is the color of the "Read more" link text and defaults to blue.
  /// The [readLessColor] parameter is the color of the "Read less" link text and defaults to red.
  /// The [mode] parameter specifies how URLs are launched and defaults to [LaunchMode.inAppWebView].
  const LinkText({
    required this.text,
    this.style = const TextStyle(color: Colors.black),
    this.linkStyle = const TextStyle(
        color: Colors.blue, decoration: TextDecoration.underline),
    this.lengthThreshold = 350,
    this.readMoreText = 'Read more',
    this.readLessText = 'Read less',
    this.readMoreColor = Colors.blue,
    this.readLessColor = Colors.red,
    this.mode = LaunchMode.inAppWebView,
  });

  @override
  _LinkTextState createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final collapsedText = widget.text.length <= widget.lengthThreshold
        ? widget.text
        : '${widget.text.substring(0, widget.lengthThreshold)}...';
    final expandedText = widget.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          firstCurve: Curves.ease,
          firstChild: CheckText(
            text: collapsedText,
            style: widget.style,
            linkStyle: widget.linkStyle,
            mode: widget.mode,
          ),
          secondChild: CheckText(
            text: expandedText,
            style: widget.style,
            linkStyle: widget.linkStyle,
            mode: widget.mode,
          ),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
        ),
        if (widget.text.length > widget.lengthThreshold)
          InkWell(
            child: Text(_isExpanded ? widget.readLessText : widget.readMoreText,
                style: TextStyle(
                    color: _isExpanded
                        ? widget.readLessColor
                        : widget.readMoreColor)),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
      ],
    );
  }
}

class CheckText extends StatelessWidget {
  /// The text to display, which may contain embedded links.
  final String text;

  /// The style to apply to the non-link parts of the text.
  final TextStyle style;

  /// The style to apply to the link parts of the text.
  final TextStyle linkStyle;

  /// The mode used to launch URLs.
  final LaunchMode mode;

  /// Creates a [CheckText] widget.
  ///
  /// The [text] parameter is required.
  /// The [style] parameter is used for non-link text and defaults to [TextStyle(color: Colors.black)].
  /// The [linkStyle] parameter is used for link text and defaults to [TextStyle(color: Colors.blue, decoration: TextDecoration.underline)].
  /// The [mode] parameter specifies how URLs are launched and defaults to [LaunchMode.inAppWebView].
  const CheckText({
    required this.text,
    this.style = const TextStyle(color: Colors.black),
    this.linkStyle = const TextStyle(
        color: Colors.blue, decoration: TextDecoration.underline),
    this.mode = LaunchMode.inAppWebView,
  });

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'(https?://\S+|www.\S+)', caseSensitive: false);
    final matches = regex.allMatches(text).toList();

    if (matches.isEmpty) {
      return Text(text, style: style);
    }

    final children = <InlineSpan>[];
    var currentIndex = 0;

    for (var match in matches) {
      final urlString = match.group(0);
      final nonLinkText = text.substring(currentIndex, match.start);

      if (nonLinkText.isNotEmpty) {
        children.add(TextSpan(text: nonLinkText, style: style));
      }
      if (urlString != null && urlString.isNotEmpty) {
        final url =
            urlString.startsWith('http') ? urlString : 'https://$urlString';
        children.add(
          TextSpan(
            text: urlString,
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                String link = url;
                if (url.startsWith('http://')) {
                  link = link.substring(7);
                } else if (link.startsWith('https://')) {
                  link = link.substring(8);
                } else if (link.startsWith('www.')) {
                  link = link.substring(4);
                }
                Uri uri = Uri(scheme: 'https', path: link);
                launchUrl(uri, mode: mode);
              },
          ),
        );
      }
      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      final trailingText = text.substring(currentIndex);
      if (trailingText.isNotEmpty) {
        children.add(TextSpan(text: trailingText, style: style));
      }
    }

    return RichText(text: TextSpan(children: children));
  }
}

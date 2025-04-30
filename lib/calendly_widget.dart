import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:flutter/material.dart';

class CalendlyWidget extends StatefulWidget {
  final String calendlyUrl;

  const CalendlyWidget({required this.calendlyUrl, super.key});

  @override
  State<CalendlyWidget> createState() => _CalendlyWidgetState();
}

class _CalendlyWidgetState extends State<CalendlyWidget> {
  final String viewType = 'calendly-iframe';

  @override
  void initState() {
    super.initState();

    // Register the iframe
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        final iframe = html.IFrameElement()
          ..src = '${widget.calendlyUrl}?embed_domain=localhost&embed_type=Inline'
          ..style.border = 'none'
          ..width = '100%'
          ..height = '100%';

        return iframe;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700, // Adjust as needed
      child: HtmlElementView(viewType: viewType),
    );
  }
}
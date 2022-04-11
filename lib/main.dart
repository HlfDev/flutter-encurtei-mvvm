import 'package:flutter/material.dart';

import 'package:device_preview/device_preview.dart';

import 'package:encurtei_ly/app/app.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => AppWidget(),
      ),
    );

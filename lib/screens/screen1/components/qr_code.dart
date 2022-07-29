import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeToImage extends StatelessWidget {
  const QRCodeToImage({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: text ?? 'This is a Sample QR Code',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
  }
}
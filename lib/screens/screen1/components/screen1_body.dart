import 'package:flutter/material.dart';
import 'package:pattern/components/widgets/buttons/elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../providers/qr_code_generate_provider/qr_code_generate_provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCodeGenerateProvider =
        Provider.of<QRCodeGenerateProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: qrCodeGenerateProvider.getTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Enter Name or Number to generate QR Code',
            ),
          ),
          const SizedBox(height: 8),
          KDefaultButton(
            text: 'Generate QR Code',
            onPressed: () async {
              var data = qrCodeGenerateProvider.getTextEditingController.text;
              print('vodar data: $data');
              qrCodeGenerateProvider.reload();
            },
          ),
          const SizedBox(height: 8),
          QRCodeToImage(
            text: qrCodeGenerateProvider.getTextEditingController.text,
          ),
        ],
      ),
    );
  }
}

class QRCodeToImage extends StatelessWidget {
  const QRCodeToImage({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: text ?? '',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
  }
}

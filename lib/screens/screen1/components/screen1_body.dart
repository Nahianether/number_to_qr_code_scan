import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pattern/components/widgets/buttons/elevated_button.dart';
import 'package:pattern/helpers/routes/custom_routes.dart';
import 'package:pattern/screens/screen1/components/qr_code.dart';
import 'package:pattern/screens/screen1/screen1.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../providers/qr_code_generate_provider/qr_code_generate_provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCodeGenerateProvider =
        Provider.of<QRCodeGenerateProvider>(context, listen: false);
    // qrCodeGenerateProvider.reload();
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
              print('QR code text: $data');
              // qrCodeGenerateProvider.reload();
              Navigator.pushReplacement(
                context,
                FadeRoute(
                  page: const Screen1(),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          QRCodeToImage(
            text: qrCodeGenerateProvider.getTextEditingController.text,
          ),
          const SizedBox(height: 8),
          qrCodeGenerateProvider.getTextEditingController.text.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    KDefaultButton(
                      height: 38,
                      width: 100,
                      text: 'Clear',
                      onPressed: () {
                        qrCodeGenerateProvider.getTextEditingController.clear();
                        qrCodeGenerateProvider.reload();
                      },
                    ),
                    KDefaultButton(
                      height: 38,
                      width: 100,
                      text: 'Print',
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: 'This Feature is not yet available',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      },
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

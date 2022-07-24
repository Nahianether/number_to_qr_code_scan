import 'package:provider/provider.dart' show ChangeNotifierProvider;
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

import 'qr_code_generate_provider/qr_code_generate_provider.dart';
import 'theme/theme.dart';

// Create all Providers here
final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ChangeNotifierProvider(create: (_) => QRCodeGenerateProvider()),
];

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/response.dart';
import 'screens/main_screen.dart';
import 'utils/theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ItemPostAdapter());
  await Hive.openBox<ItemPost>('favorite_post');
  runApp(const ProviderScope(child: EvoxApp()));
}

class EvoxApp extends StatelessWidget {
  const EvoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ePortal',
      theme: appThemeData,
      home: const MainScreen(),
    );
  }
}

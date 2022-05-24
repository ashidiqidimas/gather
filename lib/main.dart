import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'ui/styles/gather_theme.dart';
import 'business_logic/managers/all_managers.dart';
import 'business_logic/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();
  final _profileManager = ProfileManager();
  final _signUpManager = SignUpManager();
  final _signInManager = SignInManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      profileManager: _profileManager,
      signUpManager: _signUpManager,
      signInManager: _signInManager,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager),
        ChangeNotifierProvider(create: (context) => _signUpManager),
        ChangeNotifierProvider(create: (context) => _signInManager),
        ChangeNotifierProvider(create: (context) => _profileManager),
      ],
      // If want to implement dark mode, wrap [MaterialApp] in Consumer<ProfileManager>
      child: MaterialApp(
        title: '2Gather',
        theme: GatherTheme.light(),
        // TODO: Set home to a router
        home: Router(
          routerDelegate: _appRouter,
          // TODO: Add backButtonDispatcher
        ),
      ),
    );
  }
}

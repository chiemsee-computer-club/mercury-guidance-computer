import 'package:flutter/material.dart';
import 'package:mercury_guidance_computer/config/theme/export.dart';
import 'package:mercury_guidance_computer/startup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercury_guidance_computer/widgets/mercury_bottom_navigation_bar.dart';

import 'config/routes/export.dart';

void main() {
  configureServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  


  @override
  Widget build(BuildContext context) {
    var routingService = getIt.get<RoutingService>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()
            ..add(
              ThemeEventInitial(),
            ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
              title: 'Mercury Guidance Computer',
              debugShowCheckedModeBanner: false,
              theme: themeState.themeData,
              builder: (context, child) {
                return Scaffold(
                  body: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 200,
                            ),
                            Expanded(child: child!),
                          ],
                        ),
                      ),
                      const MercuryBottomNaviagationBar()
                    ],
                  ),
                );
              },
              onGenerateRoute: routingService.router.generator,
              navigatorKey: routingService.navigatorKey);
        },
      ),
    );
  }
}

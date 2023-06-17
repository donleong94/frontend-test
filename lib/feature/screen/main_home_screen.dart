import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:frontend_test/core/widget/custom_app_bar_widget.dart';
import 'package:frontend_test/feature/view/main_home_view.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const LoaderOverlay(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          titleText: "All Posts",
          hasLeading: true,
          isCenterTitle: true,
        ),
        body: MainHomeView(),
      ),
    );
  }
}

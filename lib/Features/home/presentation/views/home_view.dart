import 'dart:developer';

import 'package:bookly_app1/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    log(width.toString());
    return   const Scaffold(
        body: HomeViewBody(

        ),
    );
  }
}

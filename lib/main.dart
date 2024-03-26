import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_details/hotel_details_cubit.dart';
import 'package:flutter_exam_damianofrancescoventura/pages/hotels_details/hotels_details.dart';
import 'package:flutter_exam_damianofrancescoventura/pages/hotels_page/hotels_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelsCubit(),
      child: MaterialApp.router(
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => BlocProvider(
                create: (context) => HotelsCubit(),
                child: const HotelsPage(),
              ),
              routes: [
                GoRoute(
                  path: 'hotel_details/:hotelId',
                  builder: (context, state) => BlocProvider(
                    create: (context) => HotelDetailsCubit()
                      ..fetchHotelDetails(int.tryParse(
                        '${state.pathParameters['hotelId']}',
                      )!),
                    child: const HotelDetailsPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

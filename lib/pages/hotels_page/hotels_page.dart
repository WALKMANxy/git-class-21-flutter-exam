import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_cubit/hotel_state.dart';
import 'package:flutter_exam_damianofrancescoventura/pages/hotels_page/widgets/hotels_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelsCubit = context.watch<HotelsCubit>();
    final hotels = hotelsCubit.state.sortedHotels;

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HotelsCubit, HotelsState>(
          builder: (context, state) {
            return Text('Available Hotels: ${state.hotels.length}');
          },
        ),
        actions: [
          IconButton(
            onPressed: () => hotelsCubit.toggleOrder(),
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: hotels.length,
        itemBuilder: (context, index) => HotelItem(
          hotel: hotels[index],
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

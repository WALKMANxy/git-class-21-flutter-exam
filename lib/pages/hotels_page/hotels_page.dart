import 'package:exercise_4/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:exercise_4/pages/hotels_page/widgets/hotels_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Watching the HotelsCubit state
    final hotels = context.watch<HotelsCubit>().state.sortedHotels;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        actions: [
          IconButton(
            onPressed: () => context.read<HotelsCubit>().toggleOrder(),
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

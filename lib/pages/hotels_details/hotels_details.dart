import 'package:exercise_4/cubits/hotel_details/hotel_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exercise_4/cubits/hotel_details/hotel_details_cubit.dart';
import 'package:exercise_4/pages/hotels_details/widgets/hotels_info_row.dart';
import 'package:exercise_4/model/hotel_details.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
      ),
      body: BlocBuilder<HotelDetailsCubit, HotelDetailsState>(
        builder: (context, state) {
          return state.maybeWhen(
            // Handle loading state
            loading: () => const Center(child: CircularProgressIndicator()),
            // Handle success state
            success: (HotelDetail hotelDetail) => ListView(
              children: [
                InfoRow(
                  label: "Hotel's Name",
                  value: hotelDetail.name,
                ),
                const SizedBox(height: 16),
                InfoRow(
                  label: 'Address',
                  value: hotelDetail.address,
                ),
                ...hotelDetail.rooms
                    .map((room) => Column(
                          children: [
                            ListTile(
                              title: Text(room.type),
                              leading: Image.network(room.image,
                                  width: 100, height: 100, fit: BoxFit.cover),
                              subtitle: Text(
                                  'Occupants: ${room.adults}, Size: ${room.mq} mq, €${room.priceForNight}/night'),
                            ),
                            const Divider(),
                          ],
                        ))
                    .toList(),
              ],
            ),

            error: (String message) => Center(child: Text(message)),

            orElse: () =>
                const Center(child: Text('Awaiting hotel details...')),
          );
        },
      ),
    );
  }
}

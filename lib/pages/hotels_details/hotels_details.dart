import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_details/hotel_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_details/hotel_details_cubit.dart';
import 'package:flutter_exam_damianofrancescoventura/model/hotel_list.dart';
import 'package:flutter_exam_damianofrancescoventura/pages/hotels_details/widgets/hotels_info_row.dart';
import 'package:flutter_exam_damianofrancescoventura/model/hotel_details.dart';

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
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (HotelDetail hotelDetail, Hotel hotel) => ListView(
                children: [
                  Image.network(
                    hotel.mainPhoto,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      hotelDetail.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InfoRow(
                    label: 'Address',
                    value: hotelDetail.address,
                  ),
                  const SizedBox(height: 8),
                  ...hotelDetail.rooms
                      .map((room) => InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                  child: Image.network(room.image,
                                      fit: BoxFit.contain),
                                ),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      room.image,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            room.type,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Max occupants: ${room.adults}.',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w200,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            'Size of the room: ${room.mq} mq.',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w200,
                                                color: Color.fromARGB(
                                                    255, 26, 26, 26)),
                                          ),
                                          Text(
                                            'Price per night: €${room.priceForNight}.',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w200,
                                                color: Color.fromARGB(
                                                    255, 26, 26, 26)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ],
              ),
              orElse: () =>
                  const Center(child: Text('Awaiting hotel details...')),
            );
          },
        ));
  }
}

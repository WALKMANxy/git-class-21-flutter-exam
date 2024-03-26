import 'package:flutter/material.dart';
import 'package:exercise_4/model/hotel_list.dart';
import 'package:go_router/go_router.dart';

class HotelItem extends StatelessWidget {
  final Hotel hotel;

  const HotelItem({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          hotel.mainPhoto,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(hotel.name),
      subtitle: Text('Rating: ${hotel.voteAverage.toStringAsFixed(1)}'),
      onTap: () => context.go('/hotel_details/${hotel.id}'),
    );
  }
}

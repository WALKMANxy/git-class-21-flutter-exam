import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exercise_4/cubits/hotel_details/hotel_details_state.dart';
import 'package:exercise_4/model/hotel_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelDetailsCubit extends Cubit<HotelDetailsState> {
  HotelDetailsCubit() : super(const HotelDetailsState.initial());

  Future<void> fetchHotelDetails(int hotelId) async {
    emit(const HotelDetailsState.loading());
    final String url =
        'https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/hotels/hotel_details/$hotelId';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final hotelDetail = HotelDetail.fromJson(data);
        emit(HotelDetailsState.success(hotelDetail));
      } else {
        emit(const HotelDetailsState.error('Failed to load hotel details'));
      }
    } catch (e) {
      emit(HotelDetailsState.error('Error: $e'));
    }
  }
}

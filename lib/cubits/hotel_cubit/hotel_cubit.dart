import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_cubit/hotel_state.dart';
import 'package:flutter_exam_damianofrancescoventura/model/hotel_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelsCubit extends Cubit<HotelsState> {
  static const apiUrl =
      'https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/hotels/hotels';

  HotelsCubit() : super(const HotelsState(hotels: [])) {
    _fetchHotels();
  }

  int get hotelCount => state.hotels.length;

  Future<void> _fetchHotels() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonHotels = json.decode(response.body);

        final List<Hotel> hotels =
            jsonHotels.map((jsonHotel) => Hotel.fromJson(jsonHotel)).toList();

        emit(state.copyWith(hotels: hotels));
      } else {
        print('Failed to fetch hotels. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching hotels: $e');
    }
  }

  void toggleOrder() {
    emit(state.copyWith(isAscending: !state.isAscending));
  }
}

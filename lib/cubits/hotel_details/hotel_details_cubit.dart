import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam_damianofrancescoventura/cubits/hotel_details/hotel_details_state.dart';
import 'package:flutter_exam_damianofrancescoventura/model/hotel_details.dart';
import 'package:flutter_exam_damianofrancescoventura/model/hotel_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelDetailsCubit extends Cubit<HotelDetailsState> {
  HotelDetailsCubit() : super(const HotelDetailsState.initial());

  Future<void> fetchHotelDetails(int hotelId) async {
    emit(const HotelDetailsState.loading());
    final String detailsUrl =
        'https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/hotels/hotel_details/$hotelId';
    const String listUrl =
        'https://raw.githubusercontent.com/andrea689/flutter_course/main/exams/hotels/hotels';

    try {
      final listResponse = await http.get(Uri.parse(listUrl));
      Hotel? hotel;
      if (listResponse.statusCode == 200) {
        final List<dynamic> listData = json.decode(listResponse.body);
        final summaryData = listData.firstWhere(
          (hotel) => hotel['id'] == hotelId,
          orElse: () => null,
        );
        if (summaryData != null) {
          hotel = Hotel.fromJson(summaryData);
        }
      }

      final response = await http.get(Uri.parse(detailsUrl));
      if (response.statusCode == 200) {
        final detailedData = json.decode(response.body);
        final hotelDetail = HotelDetail.fromJson(detailedData);

        emit(HotelDetailsState.success(hotelDetail, hotel!));
      } else {
        emit(const HotelDetailsState.error('Failed to load hotel details'));
      }
    } catch (e) {
      emit(HotelDetailsState.error('Error: $e'));
    }
  }
}

import 'package:flutter_exam_damianofrancescoventura/model/hotel_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_exam_damianofrancescoventura/model/hotel_details.dart';

part 'hotel_details_state.freezed.dart';

@freezed
class HotelDetailsState with _$HotelDetailsState {
  const factory HotelDetailsState.initial() = _Initial;
  const factory HotelDetailsState.loading() = _Loading;
  const factory HotelDetailsState.success(
      HotelDetail hotelDetail, Hotel hotel) = _Success;
  const factory HotelDetailsState.error(String message) = _Error;
}

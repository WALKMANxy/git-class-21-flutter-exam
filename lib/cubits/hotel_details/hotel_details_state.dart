import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:exercise_4/model/hotel_details.dart';

part 'hotel_details_state.freezed.dart';

@freezed
class HotelDetailsState with _$HotelDetailsState {
  const factory HotelDetailsState.initial() = _Initial;
  const factory HotelDetailsState.loading() = _Loading;
  const factory HotelDetailsState.success(HotelDetail hotelDetail) = _Success;
  const factory HotelDetailsState.error(String message) = _Error;
}

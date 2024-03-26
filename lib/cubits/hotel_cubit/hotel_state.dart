import 'package:collection/collection.dart';
import 'package:flutter_exam_damianofrancescoventura/model/hotel_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'hotel_state.freezed.dart';

@freezed
class HotelsState with _$HotelsState {
  const HotelsState._();

  const factory HotelsState({
    @Default([]) List<Hotel> hotels,
    @Default(false) bool isAscending,
  }) = _HotelsState;

  List<Hotel> get sortedHotels => List<Hotel>.from(hotels)
    ..sort((a, b) => isAscending
        ? a.voteAverage.compareTo(b.voteAverage)
        : b.voteAverage.compareTo(a.voteAverage));

  Hotel? hotelById(int? hotelId) =>
      hotels.firstWhereOrNull((e) => e.id == hotelId);
}

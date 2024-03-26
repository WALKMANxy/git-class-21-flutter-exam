import 'package:freezed_annotation/freezed_annotation.dart';
import 'hotel_rooms.dart';

part 'hotel_details.freezed.dart';
part 'hotel_details.g.dart';

@freezed
class HotelDetail with _$HotelDetail {
  const factory HotelDetail({
    required String name,
    required String address,
    required List<Room> rooms,
  }) = _HotelDetail;

  factory HotelDetail.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailFromJson(json);
}

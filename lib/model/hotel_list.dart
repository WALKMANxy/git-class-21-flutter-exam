import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_list.freezed.dart';
part 'hotel_list.g.dart';

@freezed
class Hotel with _$Hotel {
  const factory Hotel({
    required int id,
    @JsonKey(name: "main_photo") required String mainPhoto,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "description") required String description,
    @JsonKey(name: "vote_average") required double voteAverage,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}

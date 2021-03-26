import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tjatat/domain/auth/auth_user.dart';
import 'package:tjatat/domain/auth/value_objects.dart';
import 'package:tjatat/domain/core/value_objects.dart';

part 'auth_user_dto.freezed.dart';
part 'auth_user_dto.g.dart';

@freezed
@JsonSerializable()
class AuthUserDto with _$AuthUserDto {
  const factory AuthUserDto({
    @JsonKey(ignore: true) String? id,
    required String username,
    required String emailAddress,
    required int lastSignedIn,
  }) = _AuthUserDto;

  factory AuthUserDto.fromDomain(AuthUser authUser) {
    return AuthUserDto(
      id: authUser.id.getOrCrash(),
      username: authUser.username.getOrCrash(),
      emailAddress: authUser.emailAddress.getOrCrash(),
      lastSignedIn: authUser.lastSignedIn.millisecondsSinceEpoch,
    );
  }

  AuthUser toDomain() {
    return AuthUser(
      id: UniqueId.fromUniqueString(id!),
      username: Username(username),
      emailAddress: EmailAddress(emailAddress),
      lastSignedIn: DateTime.fromMillisecondsSinceEpoch(lastSignedIn),
    );
  }

  factory AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);

  factory AuthUserDto.fromFirestore(DocumentSnapshot document) =>
      AuthUserDto.fromJson(document.data()!).copyWith(id: document.id);

  const AuthUserDto._();
}

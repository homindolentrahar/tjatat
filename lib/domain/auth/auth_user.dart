import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tjatat/domain/auth/value_objects.dart';
import 'package:tjatat/domain/core/value_objects.dart';

part 'auth_user.freezed.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    @required UniqueId id,
    @required EmailAddress email,
    @required DateTime loginAt,
  }) = _User;
}

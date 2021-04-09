// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:connectivity/connectivity.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_cubit.dart' as _i15;
import 'application/auth/sign_in_form/sign_in_form_cubit.dart' as _i14;
import 'application/core/network/network_info_cubit.dart' as _i9;
import 'application/core/timer/timer_cubit.dart' as _i11;
import 'domain/auth/i_auth_facade.dart' as _i12;
import 'domain/core/i_network_info.dart' as _i7;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i13;
import 'infrastructure/core/app_module.dart' as _i18;
import 'infrastructure/core/firebase_injectable_module.dart' as _i17;
import 'infrastructure/core/network_info.dart' as _i8;
import 'infrastructure/core/network_module.dart' as _i16;
import 'utils/ticker.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Connectivity>(() => networkModule.dataConnectionChecker);
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i7.INetworkInfo>(
      () => _i8.NetworkInfo(get<_i3.Connectivity>()));
  gh.factory<_i9.NetworkInfoCubit>(
      () => _i9.NetworkInfoCubit(get<_i7.INetworkInfo>()));
  gh.lazySingleton<_i10.Ticker>(() => appModule.ticker);
  gh.factory<_i11.TimerCubit>(() => _i11.TimerCubit(get<_i10.Ticker>()));
  gh.lazySingleton<_i12.IAuthFacade>(() => _i13.FirebaseAuthFacade(
      get<_i4.FirebaseAuth>(),
      get<_i6.GoogleSignIn>(),
      get<_i5.FirebaseFirestore>(),
      get<_i7.INetworkInfo>()));
  gh.factory<_i14.SignInFormCubit>(
      () => _i14.SignInFormCubit(get<_i12.IAuthFacade>()));
  gh.factory<_i15.AuthCubit>(() => _i15.AuthCubit(get<_i12.IAuthFacade>()));
  return get;
}

class _$NetworkModule extends _i16.NetworkModule {}

class _$FirebaseInjectableModule extends _i17.FirebaseInjectableModule {}

class _$AppModule extends _i18.AppModule {}

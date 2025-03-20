// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i19;
import 'package:hive_flutter/hive_flutter.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:purchases_flutter/purchases_flutter.dart' as _i15;

import '../../data/datasource/local/app_storage.dart' as _i17;
import '../../data/datasource/local/impl/app_storage_impl.dart' as _i18;
import '../../data/datasource/remote/supabase_api.dart' as _i21;
import '../../data/models/chat/chat_model_hive.dart' as _i12;
import '../../data/models/message/message_model_hive.dart' as _i13;
import '../../data/repositories/chat_repository_impl.dart' as _i29;
import '../../data/repositories/dashboard_repository_impl.dart' as _i5;
import '../../data/repositories/image_generate_repository_impl.dart' as _i34;
import '../../data/repositories/prompt_repository_impl.dart' as _i39;
import '../../data/repositories/text_generate_repository_impl.dart' as _i23;
import '../../data/repositories/user_storage_repository_impl.dart' as _i26;
import '../../domain/repositories/chat_repository.dart' as _i28;
import '../../domain/repositories/dashboard_repository.dart' as _i4;
import '../../domain/repositories/image_generate_repository.dart' as _i33;
import '../../domain/repositories/prompt_repository.dart' as _i38;
import '../../domain/repositories/text_generate_repository.dart' as _i22;
import '../../domain/repositories/user_storage_repository.dart' as _i25;
import '../../domain/usecase/chat_usecase.dart' as _i30;
import '../../domain/usecase/dashboard_configuration_usecase.dart' as _i14;
import '../../domain/usecase/feature_permission_usecase.dart' as _i32;
import '../../domain/usecase/image_generate_usecase.dart' as _i35;
import '../../domain/usecase/limit_image_generate_usecase.dart' as _i36;
import '../../domain/usecase/prompt_usecase.dart' as _i40;
import '../../domain/usecase/subscription_usecase.dart' as _i10;
import '../../domain/usecase/text_generate_usecase.dart' as _i24;
import '../../domain/usecase/user_storage_usecase.dart' as _i27;
import '../../presentations/chat/bloc/chat_bloc.dart' as _i41;
import '../../presentations/chat_detail/bloc/chat_detail_bloc.dart' as _i42;
import '../../presentations/dashboard_screen/bloc/dashboard_bloc.dart' as _i31;
import '../../presentations/manage_key/bloc/manage_key_bloc.dart' as _i37;
import '../../presentations/prompt/bloc/prompt_bloc.dart' as _i43;
import '../../presentations/shared/app_settings/bloc/app_settings_bloc.dart'
    as _i3;
import '../../presentations/shared/subscriptions/bloc/subscription_bloc.dart'
    as _i16;
import '../services/device_service.dart' as _i6;
import '../services/logger_service.dart' as _i8;
import '../services/speech_text_service.dart' as _i9;
import '../services/text_speech_service.dart' as _i11;
import 'modules/data_source_module.dart' as _i44;

const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final hiveModule = _$HiveModule();
  final purchaseModule = _$PurchaseModule();
  final activeConfigModule = _$ActiveConfigModule();
  final dataSourceModule = _$DataSourceModule();
  gh.singleton<_i3.AppSettingsBloc>(() => _i3.AppSettingsBloc());
  gh.factory<_i4.DashboardRepository>(() => _i5.DashboardRepositoryImpl());
  gh.factory<_i6.DeviceService>(() => _i6.DeviceService());
  await gh.singletonAsync<_i7.HiveInterface>(
    () => hiveModule.initHive(),
    preResolve: true,
  );
  gh.singleton<List<String>>(
    () => purchaseModule.revenueProducts,
    instanceName: 'RevenueProducts',
  );
  gh.factory<_i8.LoggerService>(() => _i8.LoggerService());
  gh.factory<_i9.SpeechTextService>(() => _i9.SpeechTextService());
  gh.singleton<String>(
    () => purchaseModule.revenueApiKey,
    instanceName: 'RevenueApiKey',
  );
  gh.singleton<_i10.SubscriptionUsecase>(() => _i10.SubscriptionUsecase(
      gh<List<String>>(instanceName: 'RevenueProducts')));
  gh.factory<_i11.TextSpeechService>(() => _i11.TextSpeechService());
  gh.singleton<bool>(
    () => activeConfigModule.enableInputKey,
    instanceName: 'enableInputKey',
  );
  gh.singleton<bool>(
    () => activeConfigModule.enableSubscription,
    instanceName: 'enableSubscription',
  );
  gh.singleton<_i7.Box<dynamic>>(
      () => hiveModule.prefs(gh<_i7.HiveInterface>()));
  gh.singleton<_i7.Box<_i12.MessageModelHive>>(
      () => hiveModule.messageBox(gh<_i7.HiveInterface>()));
  gh.singleton<_i7.Box<_i13.ChatModelHive>>(
      () => hiveModule.chatBox(gh<_i7.HiveInterface>()));
  gh.factory<_i14.DashboardConfigurationUsecase>(
      () => _i14.DashboardConfigurationUsecase(gh<_i4.DashboardRepository>()));
  await gh.singletonAsync<_i15.Purchases>(
    () => purchaseModule.prefs(gh<String>(instanceName: 'RevenueApiKey')),
    preResolve: true,
  );
  gh.factory<_i16.SubscriptionBloc>(
      () => _i16.SubscriptionBloc(gh<_i10.SubscriptionUsecase>()));
  gh.singleton<_i17.AppStorage>(
      () => _i18.AppStorageImpl(gh<_i19.Box<dynamic>>()));
  gh.factory<_i20.Dio>(
    () => dataSourceModule.dioProd(gh<_i17.AppStorage>()),
    registerFor: {_prod},
  );
  gh.factory<_i21.SupabaseApi>(() => _i21.SupabaseApi(gh<_i20.Dio>()));
  gh.factory<_i22.TextGenerateRepository>(
      () => _i23.TextGenerateRepositoryImpl(gh<_i21.SupabaseApi>()));
  gh.factory<_i24.TextGenerateUsecase>(
      () => _i24.TextGenerateUsecase(gh<_i22.TextGenerateRepository>()));
  gh.factory<_i25.UserStorageRepository>(
      () => _i26.UserStorageRepositoryImpl(gh<_i17.AppStorage>()));
  gh.factory<_i27.UserStorageUsecase>(
      () => _i27.UserStorageUsecase(gh<_i25.UserStorageRepository>()));
  gh.factory<_i28.ChatRepository>(() => _i29.ChatRepositoryImpl(
        gh<_i19.Box<_i12.ChatModelHive>>(),
        gh<_i21.SupabaseApi>(),
      ));
  gh.factory<_i30.ChatUsecase>(
      () => _i30.ChatUsecase(gh<_i28.ChatRepository>()));
  gh.factory<_i31.DashboardBloc>(() => _i31.DashboardBloc(
        gh<_i14.DashboardConfigurationUsecase>(),
        gh<_i27.UserStorageUsecase>(),
      ));
  gh.factory<_i32.FeaturePermissionUseCase>(() => _i32.FeaturePermissionUseCase(
        gh<_i10.SubscriptionUsecase>(),
        gh<_i27.UserStorageUsecase>(),
        gh<bool>(instanceName: 'enableSubscription'),
        gh<bool>(instanceName: 'enableInputKey'),
      ));
  gh.factory<_i33.ImageGenerateRepository>(
      () => _i34.ImageGenerateRepositoryImpl(gh<_i21.SupabaseApi>()));
  gh.factory<_i35.ImageGenerateUseCase>(
      () => _i35.ImageGenerateUseCase(gh<_i33.ImageGenerateRepository>()));
  gh.factory<_i36.LimitImageGenerateUsecase>(
      () => _i36.LimitImageGenerateUsecase(gh<_i27.UserStorageUsecase>()));
  gh.factoryParam<_i37.ManageKeyBloc, String?, dynamic>((
    identifier,
    _,
  ) =>
      _i37.ManageKeyBloc(
        identifier,
        gh<_i27.UserStorageUsecase>(),
        gh<_i24.TextGenerateUsecase>(),
      ));
  gh.factory<_i38.PromptRepository>(
      () => _i39.PromptRepositoryImpl(gh<_i21.SupabaseApi>()));
  gh.factory<_i40.PromptUsecase>(
      () => _i40.PromptUsecase(gh<_i38.PromptRepository>()));
  gh.factoryParam<_i41.ChatBloc, String?, dynamic>((
    identifier,
    _,
  ) =>
      _i41.ChatBloc(
        identifier,
        gh<_i30.ChatUsecase>(),
        gh<_i32.FeaturePermissionUseCase>(),
      ));
  gh.factoryParam<_i42.ChatDetailBloc, int, dynamic>((
    chatId,
    _,
  ) =>
      _i42.ChatDetailBloc(
        chatId,
        gh<_i30.ChatUsecase>(),
        gh<_i11.TextSpeechService>(),
        gh<_i9.SpeechTextService>(),
      ));
  gh.factory<_i43.PromptBloc>(() => _i43.PromptBloc(gh<_i40.PromptUsecase>()));
  return getIt;
}

class _$HiveModule extends _i44.HiveModule {}

class _$PurchaseModule extends _i44.PurchaseModule {}

class _$ActiveConfigModule extends _i44.ActiveConfigModule {}

class _$DataSourceModule extends _i44.DataSourceModule {}

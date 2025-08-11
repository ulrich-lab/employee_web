// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:visitor_pass/config/locator/locator.dart' as _i34;
import 'package:visitor_pass/config/locator/storage_paths.dart' as _i3;
import 'package:visitor_pass/Controllers/attendance_controller.dart' as _i32;
import 'package:visitor_pass/Controllers/change_password_controller.dart'
    as _i21;
import 'package:visitor_pass/Controllers/chat_controller.dart' as _i33;
import 'package:visitor_pass/Controllers/contacts_controller.dart' as _i24;
import 'package:visitor_pass/Controllers/dashboard_controller.dart' as _i25;
import 'package:visitor_pass/Controllers/notification_controller.dart' as _i26;
import 'package:visitor_pass/Controllers/permission_controller.dart' as _i27;
import 'package:visitor_pass/Controllers/pre_register_controller.dart' as _i28;
import 'package:visitor_pass/Controllers/preRegister_add_controller.dart'
    as _i31;
import 'package:visitor_pass/Controllers/profile_controller.dart' as _i29;
import 'package:visitor_pass/Controllers/visitor_details_controller.dart'
    as _i30;
import 'package:visitor_pass/core/datasources/graphql_datasource.dart' as _i5;
import 'package:visitor_pass/core/datasources/graphql_datasource.prod.dart'
    as _i6;
import 'package:visitor_pass/data/appointments_repository.prod.dart' as _i18;
import 'package:visitor_pass/data/attendance_repository.prod.dart' as _i20;
import 'package:visitor_pass/data/chat_repository.prod.dart' as _i23;
import 'package:visitor_pass/data/hive_chat_local_storage.dart' as _i8;
import 'package:visitor_pass/data/notification_repository.prod.dart' as _i10;
import 'package:visitor_pass/data/permission_repository.prod.dart' as _i12;
import 'package:visitor_pass/data/profile_repository.prod.dart' as _i14;
import 'package:visitor_pass/data/visitors_repository.prod.dart' as _i16;
import 'package:visitor_pass/domain/appointments_repository.dart' as _i17;
import 'package:visitor_pass/domain/attendance_repository.dart' as _i19;
import 'package:visitor_pass/domain/chat_local_storage.dart' as _i7;
import 'package:visitor_pass/domain/chat_repository.dart' as _i22;
import 'package:visitor_pass/domain/notification_repository.dart' as _i9;
import 'package:visitor_pass/domain/permission_repository.dart' as _i11;
import 'package:visitor_pass/domain/profile_repository.dart' as _i13;
import 'package:visitor_pass/domain/visitors_repository.dart' as _i15;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    await gh.singletonAsync<_i3.DeviceStorage>(
      () => _i3.DeviceStorage.init(),
      preResolve: true,
    );
    gh.factory<_i4.GraphQLClient>(() => serviceModule.create());
    gh.lazySingleton<_i5.GraphqlDatasource>(
        () => _i6.GraphqlDatasourceImpl(client: gh<_i4.GraphQLClient>()));
    gh.lazySingleton<_i7.IChatLocalStorage>(() => _i8.HiveChatLocalStorage());
    gh.lazySingleton<_i9.NotificationRepository>(
        () => _i10.NotificationRepositoryImpl(gh<_i5.GraphqlDatasource>()));
    gh.lazySingleton<_i11.PermissionRepository>(
      () => _i12.PermissionRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.ProfileRepository>(
      () => _i14.ProfileRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i15.VisitorsRepository>(
      () => _i16.VisitorsRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i17.AppointmentsRepository>(
      () => _i18.AppointmentsRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i19.AttendanceRepository>(
      () => _i20.AttendanceRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i21.ChangePasswordController>(() =>
        _i21.ChangePasswordController(
            profileRepository: gh<_i13.ProfileRepository>()));
    gh.lazySingleton<_i22.ChatRepository>(
      () => _i23.ChatRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i24.ContactPickerController>(
        () => _i24.ContactPickerController(gh<_i22.ChatRepository>()));
    gh.lazySingleton<_i25.DashboardController>(
        () => _i25.DashboardController(gh<_i15.VisitorsRepository>()));
    gh.lazySingleton<_i26.NotificationController>(
        () => _i26.NotificationController(gh<_i9.NotificationRepository>()));
    gh.lazySingleton<_i27.PermissionController>(
        () => _i27.PermissionController(gh<_i11.PermissionRepository>()));
    gh.lazySingleton<_i28.PreRegisterController>(
        () => _i28.PreRegisterController(gh<_i17.AppointmentsRepository>()));
    gh.lazySingleton<_i29.ProfileController>(
        () => _i29.ProfileController(gh<_i13.ProfileRepository>()));
    gh.lazySingleton<_i30.VisitorDetailsController>(
        () => _i30.VisitorDetailsController(gh<_i15.VisitorsRepository>()));
    gh.lazySingleton<_i31.AddPreRegisterController>(
        () => _i31.AddPreRegisterController(gh<_i17.AppointmentsRepository>()));
    gh.lazySingleton<_i32.AttendanceController>(
        () => _i32.AttendanceController(gh<_i19.AttendanceRepository>()));
    gh.lazySingleton<_i33.ChatController>(
        () => _i33.ChatController(gh<_i22.ChatRepository>()));
    return this;
  }
}

class _$ServiceModule extends _i34.ServiceModule {}

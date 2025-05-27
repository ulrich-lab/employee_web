// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:visitor_pass/config/locator/locator.dart' as _i29;
import 'package:visitor_pass/config/locator/storage_paths.dart' as _i4;
import 'package:visitor_pass/Controllers/attendance_controller.dart' as _i28;
import 'package:visitor_pass/Controllers/change_password_controller.dart'
    as _i20;
import 'package:visitor_pass/Controllers/dashboard_controller.dart' as _i21;
import 'package:visitor_pass/Controllers/notification_controller.dart' as _i22;
import 'package:visitor_pass/Controllers/permission_controller.dart' as _i23;
import 'package:visitor_pass/Controllers/pre_register_controller.dart' as _i24;
import 'package:visitor_pass/Controllers/preRegister_add_controller.dart'
    as _i27;
import 'package:visitor_pass/Controllers/profile_controller.dart' as _i25;
import 'package:visitor_pass/Controllers/visitor_details_controller.dart'
    as _i26;
import 'package:visitor_pass/core/datasources/graphql_datasource.dart' as _i6;
import 'package:visitor_pass/core/datasources/graphql_datasource.prod.dart'
    as _i7;
import 'package:visitor_pass/data/appointments_repository.prod.dart' as _i17;
import 'package:visitor_pass/data/attendance_repository.prod.dart' as _i19;
import 'package:visitor_pass/data/notification_repository.prod.dart' as _i9;
import 'package:visitor_pass/data/permission_repository.prod.dart' as _i11;
import 'package:visitor_pass/data/profile_repository.prod.dart' as _i13;
import 'package:visitor_pass/data/visitors_repository.prod.dart' as _i15;
import 'package:visitor_pass/domain/appointments_repository.dart' as _i16;
import 'package:visitor_pass/domain/attendance_repository.dart' as _i18;
import 'package:visitor_pass/domain/notification_repository.dart' as _i8;
import 'package:visitor_pass/domain/permission_repository.dart' as _i10;
import 'package:visitor_pass/domain/profile_repository.dart' as _i12;
import 'package:visitor_pass/domain/visitors_repository.dart' as _i14;

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
    gh.lazySingleton<_i3.Connectivity>(() => serviceModule.connectivity);
    await gh.singletonAsync<_i4.DeviceStorage>(
      () => _i4.DeviceStorage.init(),
      preResolve: true,
    );
    gh.factory<_i5.GraphQLClient>(() => serviceModule.create());
    gh.lazySingleton<_i6.GraphqlDatasource>(() => _i7.GraphqlDatasourceImpl(
          client: gh<_i5.GraphQLClient>(),
          connectivity: gh<_i3.Connectivity>(),
        ));
    gh.lazySingleton<_i8.NotificationRepository>(
        () => _i9.NotificationRepositoryImpl(gh<_i6.GraphqlDatasource>()));
    gh.lazySingleton<_i10.PermissionRepository>(
      () => _i11.PermissionRepositoryImpl(gh<_i6.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.ProfileRepository>(
      () => _i13.ProfileRepositoryImpl(gh<_i6.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i14.VisitorsRepository>(
      () => _i15.VisitorsRepositoryImpl(gh<_i6.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.AppointmentsRepository>(
      () => _i17.AppointmentsRepositoryImpl(gh<_i6.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.AttendanceRepository>(
      () => _i19.AttendanceRepositoryImpl(gh<_i6.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i20.ChangePasswordController>(() =>
        _i20.ChangePasswordController(
            profileRepository: gh<_i12.ProfileRepository>()));
    gh.lazySingleton<_i21.DashboardController>(
        () => _i21.DashboardController(gh<_i14.VisitorsRepository>()));
    gh.lazySingleton<_i22.NotificationController>(
        () => _i22.NotificationController(gh<_i8.NotificationRepository>()));
    gh.lazySingleton<_i23.PermissionController>(
        () => _i23.PermissionController(gh<_i10.PermissionRepository>()));
    gh.lazySingleton<_i24.PreRegisterController>(
        () => _i24.PreRegisterController(gh<_i16.AppointmentsRepository>()));
    gh.lazySingleton<_i25.ProfileController>(
        () => _i25.ProfileController(gh<_i12.ProfileRepository>()));
    gh.lazySingleton<_i26.VisitorDetailsController>(
        () => _i26.VisitorDetailsController(gh<_i14.VisitorsRepository>()));
    gh.lazySingleton<_i27.AddPreRegisterController>(
        () => _i27.AddPreRegisterController(gh<_i16.AppointmentsRepository>()));
    gh.lazySingleton<_i28.AttendanceController>(
        () => _i28.AttendanceController(gh<_i18.AttendanceRepository>()));
    return this;
  }
}

class _$ServiceModule extends _i29.ServiceModule {}

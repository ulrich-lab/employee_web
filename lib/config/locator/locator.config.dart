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
import 'package:visitor_pass/config/locator/locator.dart' as _i28;
import 'package:visitor_pass/config/locator/storage_paths.dart' as _i3;
import 'package:visitor_pass/Controllers/attendance_controller.dart' as _i27;
import 'package:visitor_pass/Controllers/change_password_controller.dart'
    as _i19;
import 'package:visitor_pass/Controllers/dashboard_controller.dart' as _i20;
import 'package:visitor_pass/Controllers/notification_controller.dart' as _i21;
import 'package:visitor_pass/Controllers/permission_controller.dart' as _i22;
import 'package:visitor_pass/Controllers/pre_register_controller.dart' as _i23;
import 'package:visitor_pass/Controllers/preRegister_add_controller.dart'
    as _i26;
import 'package:visitor_pass/Controllers/profile_controller.dart' as _i24;
import 'package:visitor_pass/Controllers/visitor_details_controller.dart'
    as _i25;
import 'package:visitor_pass/core/datasources/graphql_datasource.dart' as _i5;
import 'package:visitor_pass/core/datasources/graphql_datasource.prod.dart'
    as _i6;
import 'package:visitor_pass/data/appointments_repository.prod.dart' as _i16;
import 'package:visitor_pass/data/attendance_repository.prod.dart' as _i18;
import 'package:visitor_pass/data/notification_repository.prod.dart' as _i8;
import 'package:visitor_pass/data/permission_repository.prod.dart' as _i10;
import 'package:visitor_pass/data/profile_repository.prod.dart' as _i12;
import 'package:visitor_pass/data/visitors_repository.prod.dart' as _i14;
import 'package:visitor_pass/domain/appointments_repository.dart' as _i15;
import 'package:visitor_pass/domain/attendance_repository.dart' as _i17;
import 'package:visitor_pass/domain/notification_repository.dart' as _i7;
import 'package:visitor_pass/domain/permission_repository.dart' as _i9;
import 'package:visitor_pass/domain/profile_repository.dart' as _i11;
import 'package:visitor_pass/domain/visitors_repository.dart' as _i13;

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
    gh.lazySingleton<_i7.NotificationRepository>(
        () => _i8.NotificationRepositoryImpl(gh<_i5.GraphqlDatasource>()));
    gh.lazySingleton<_i9.PermissionRepository>(
      () => _i10.PermissionRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.ProfileRepository>(
      () => _i12.ProfileRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i13.VisitorsRepository>(
      () => _i14.VisitorsRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i15.AppointmentsRepository>(
      () => _i16.AppointmentsRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i17.AttendanceRepository>(
      () => _i18.AttendanceRepositoryImpl(gh<_i5.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i19.ChangePasswordController>(() =>
        _i19.ChangePasswordController(
            profileRepository: gh<_i11.ProfileRepository>()));
    gh.lazySingleton<_i20.DashboardController>(
        () => _i20.DashboardController(gh<_i13.VisitorsRepository>()));
    gh.lazySingleton<_i21.NotificationController>(
        () => _i21.NotificationController(gh<_i7.NotificationRepository>()));
    gh.lazySingleton<_i22.PermissionController>(
        () => _i22.PermissionController(gh<_i9.PermissionRepository>()));
    gh.lazySingleton<_i23.PreRegisterController>(
        () => _i23.PreRegisterController(gh<_i15.AppointmentsRepository>()));
    gh.lazySingleton<_i24.ProfileController>(
        () => _i24.ProfileController(gh<_i11.ProfileRepository>()));
    gh.lazySingleton<_i25.VisitorDetailsController>(
        () => _i25.VisitorDetailsController(gh<_i13.VisitorsRepository>()));
    gh.lazySingleton<_i26.AddPreRegisterController>(
        () => _i26.AddPreRegisterController(gh<_i15.AppointmentsRepository>()));
    gh.lazySingleton<_i27.AttendanceController>(
        () => _i27.AttendanceController(gh<_i17.AttendanceRepository>()));
    return this;
  }
}

class _$ServiceModule extends _i28.ServiceModule {}

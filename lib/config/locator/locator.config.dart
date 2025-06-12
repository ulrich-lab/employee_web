// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:visitor_pass/config/locator/locator.dart' as _i26;
import 'package:visitor_pass/Controllers/attendance_controller.dart' as _i25;
import 'package:visitor_pass/Controllers/change_password_controller.dart'
    as _i18;
import 'package:visitor_pass/Controllers/dashboard_controller.dart' as _i19;
import 'package:visitor_pass/Controllers/permission_controller.dart' as _i20;
import 'package:visitor_pass/Controllers/pre_register_controller.dart' as _i21;
import 'package:visitor_pass/Controllers/preRegister_add_controller.dart'
    as _i24;
import 'package:visitor_pass/Controllers/profile_controller.dart' as _i22;
import 'package:visitor_pass/Controllers/visitor_details_controller.dart'
    as _i23;
import 'package:visitor_pass/core/datasources/graphql_datasource.dart' as _i4;
import 'package:visitor_pass/core/datasources/graphql_datasource.prod.dart'
    as _i5;
import 'package:visitor_pass/data/appointments_repository.prod.dart' as _i15;
import 'package:visitor_pass/data/attendance_repository.prod.dart' as _i17;
import 'package:visitor_pass/data/notification_repository.prod.dart' as _i7;
import 'package:visitor_pass/data/permission_repository.prod.dart' as _i9;
import 'package:visitor_pass/data/profile_repository.prod.dart' as _i11;
import 'package:visitor_pass/data/visitors_repository.prod.dart' as _i13;
import 'package:visitor_pass/domain/appointments_repository.dart' as _i14;
import 'package:visitor_pass/domain/attendance_repository.dart' as _i16;
import 'package:visitor_pass/domain/notification_repository.dart' as _i6;
import 'package:visitor_pass/domain/permission_repository.dart' as _i8;
import 'package:visitor_pass/domain/profile_repository.dart' as _i10;
import 'package:visitor_pass/domain/visitors_repository.dart' as _i12;

const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    gh.factory<_i3.GraphQLClient>(() => serviceModule.create());
    gh.lazySingleton<_i4.GraphqlDatasource>(
        () => _i5.GraphqlDatasourceImpl(client: gh<_i3.GraphQLClient>()));
    gh.lazySingleton<_i6.NotificationRepository>(
        () => _i7.NotificationRepositoryImpl(gh<_i4.GraphqlDatasource>()));
    gh.lazySingleton<_i8.PermissionRepository>(
      () => _i9.PermissionRepositoryImpl(gh<_i4.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i10.ProfileRepository>(
      () => _i11.ProfileRepositoryImpl(gh<_i4.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.VisitorsRepository>(
      () => _i13.VisitorsRepositoryImpl(gh<_i4.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i14.AppointmentsRepository>(
      () => _i15.AppointmentsRepositoryImpl(gh<_i4.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.AttendanceRepository>(
      () => _i17.AttendanceRepositoryImpl(gh<_i4.GraphqlDatasource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i18.ChangePasswordController>(() =>
        _i18.ChangePasswordController(
            profileRepository: gh<_i10.ProfileRepository>()));
    gh.lazySingleton<_i19.DashboardController>(
        () => _i19.DashboardController(gh<_i12.VisitorsRepository>()));
    gh.lazySingleton<_i20.PermissionController>(
        () => _i20.PermissionController(gh<_i8.PermissionRepository>()));
    gh.lazySingleton<_i21.PreRegisterController>(
        () => _i21.PreRegisterController(gh<_i14.AppointmentsRepository>()));
    gh.lazySingleton<_i22.ProfileController>(
        () => _i22.ProfileController(gh<_i10.ProfileRepository>()));
    gh.lazySingleton<_i23.VisitorDetailsController>(
        () => _i23.VisitorDetailsController(gh<_i12.VisitorsRepository>()));
    gh.lazySingleton<_i24.AddPreRegisterController>(
        () => _i24.AddPreRegisterController(gh<_i14.AppointmentsRepository>()));
    gh.lazySingleton<_i25.AttendanceController>(
        () => _i25.AttendanceController(gh<_i16.AttendanceRepository>()));
    return this;
  }
}

class _$ServiceModule extends _i26.ServiceModule {}

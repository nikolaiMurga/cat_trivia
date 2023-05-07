// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cat_trivia/app/modules/api_module.dart' as _i14;
import 'package:cat_trivia/data/network/api_client.dart' as _i3;
import 'package:cat_trivia/data/repo/cats_fact/cats_fact_local_repo.dart'
    as _i9;
import 'package:cat_trivia/data/repo/cats_fact/cats_fact_network_repo.dart'
    as _i5;
import 'package:cat_trivia/data/repo/cats_fact/cats_fact_repo_impl.dart'
    as _i11;
import 'package:cat_trivia/data/repo/mapper/cats_fact_mapper.dart' as _i4;
import 'package:cat_trivia/data/repo/mapper/cats_image_mapper.dart' as _i6;
import 'package:cat_trivia/domain/repo/cats_fact_repo.dart' as _i10;
import 'package:cat_trivia/presentation/common/helpers/navigation.dart' as _i7;
import 'package:cat_trivia/presentation/history/bloc/history_cubit.dart'
    as _i12;
import 'package:cat_trivia/presentation/random/bloc/random_cubit.dart' as _i13;
import 'package:cat_trivia/presentation/splash/bloc/splash_cubit.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    final apiModule = _$ApiModule();
    gh.lazySingleton<_i3.ApiClient>(() => apiModule.apiClient);
    gh.factory<_i4.CatsFactMapper>(() => _i4.CatsFactMapper());
    gh.lazySingleton<_i5.CatsFactNetworkRepo>(() => _i5.CatsFactNetworkRepo(
          gh<_i3.ApiClient>(),
          gh<_i4.CatsFactMapper>(),
        ));
    gh.factory<_i6.CatsImageMapper>(() => _i6.CatsImageMapper());
    gh.lazySingleton<_i7.Navigation>(() => _i7.Navigation());
    gh.factory<_i8.SplashCubit>(() => _i8.SplashCubit());
    gh.lazySingleton<_i9.CatsFactLocalRepo>(
        () => _i9.CatsFactLocalRepo(gh<_i4.CatsFactMapper>()));
    gh.lazySingleton<_i10.CatsFactRepo>(() => _i11.CatsFactRepoImpl(
          gh<_i5.CatsFactNetworkRepo>(),
          gh<_i9.CatsFactLocalRepo>(),
          gh<_i4.CatsFactMapper>(),
          gh<_i6.CatsImageMapper>(),
        ));
    gh.factory<_i12.HistoryCubit>(
        () => _i12.HistoryCubit(gh<_i10.CatsFactRepo>()));
    gh.factory<_i13.RandomCubit>(
        () => _i13.RandomCubit(gh<_i10.CatsFactRepo>()));
    return this;
  }
}

class _$ApiModule extends _i14.ApiModule {}

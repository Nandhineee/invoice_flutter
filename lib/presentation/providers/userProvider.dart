import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoice/data/datasources/local/userDataSource.dart';
import 'package:invoice/data/repositories/userRepositoryImpl.dart';
import 'package:invoice/domain/models/user.dart';
import 'package:invoice/domain/repositories/userRepository.dart';

final userDetailsDataSourceProvider = Provider((ref) => UserDataSource());



final userDetailsRepositoryProvider = Provider<UserRepository>((ref)
{
  final userDetailsDataSource=ref.read(userDetailsDataSourceProvider);
  print(UserDataSource());
  return UserRepositoryImpl(userDetailsDataSource);
});

final authUserDetailsProvider = StateNotifierProvider((ref) {
  print(UserDataSource());
  UserRepository userRepository = ref.read(userDetailsRepositoryProvider);
  return AuthUserDetailsNotifier(userRepository);
});


//// class AuthUserDetailsNotifier extends StateNotifier<dynamic> {
// //   final UserRepository userRepository;
// //
// //   AuthUserDetailsNotifier(this.userRepository) : super(dynamic);
// //
// //   Future<void> authUserDetails(String userEmail, String password) async {
// //     final userDataOrNotFound =
// //     await userRepository.authUser(userEmail, password);
// //     userDataOrNotFound.fold((l) => state = l, (r) => state = r.message);
// //   }


class AuthUserDetailsNotifier extends StateNotifier<dynamic>{

  final UserRepository userRepository;

  AuthUserDetailsNotifier( this.userRepository):super (dynamic);


  Future<User?> authUserDetails(String Email, String password) async {
    state=await userRepository.authUser(Email, password);
  }

  dynamic getAuthUserDetails() {
    return state;
  }


}




import 'package:invoice/data/datasources/local/userDataSource.dart';
import 'package:invoice/domain/models/user.dart';
import 'package:invoice/domain/repositories/userRepository.dart';

class UserRepositoryImpl implements UserRepository {

  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<User?> authUser(String Email, String password) async {
    print("authUSER");
    User?user = await userDataSource.authUserDetails(Email, password);
    print(userDataSource.authUserDetails(Email, password));
    if (user != null) {
      return (user);
    } else {
      return null;
    }


    // @override
    // Future<Either<User, DataNotFoundException>> authUser(
    //     String userEmail, String password) async {
    //   UserData? userData =
    //   await userDetailsDataSource.authUserDetails(userEmail, password);
    //   if (userData != null) {
    //     return Left(userData);
    //   } else {
    //     return Right(DataNotFoundException("InValid Credentials"));
    //   }
    // }


  }
}


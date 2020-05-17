
import 'package:be_star/app/shared/models/user_model.dart';

abstract class IFirebaseStore {
 Future getMyUser() {}
 Stream<List<UserModel>> getUsers() {}
}

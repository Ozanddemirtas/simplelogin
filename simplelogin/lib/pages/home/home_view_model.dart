import 'package:mobx/mobx.dart';
import 'package:testproject/utils/page_exporter.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  Services service = Services();

  @observable
  ObservableList<UserModel> userList = ObservableList();

  @observable
  late UserModel currentUser;

  @action
  Future getList() async {
    userList = ObservableList();
    var response = await service.getUserList();
    currentUser = Services.currentUser;
    if (!response.hasError && response.data is List) {
      for (var item in response.data) {
        userList.add(UserModel.fromJson(item));
      }
    }
  }

  Future<bool> addFriend(String userId) async {
    var response = await service.addToFriends(userId);
    if (!response.hasError) {
      await service.getCurrentUser();
      currentUser = Services.currentUser;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeFriend(String userId) async {
    var response = await service.removeToFriends(userId);
    if (!response.hasError) {
      await service.getCurrentUser();
      currentUser = Services.currentUser;
      return true;
    } else {
      return false;
    }
  }
}

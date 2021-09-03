import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../models/todo_model.dart';
import '../../services/api_service.dart';

class HomeViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  List<TodoModel> todoList = [];
  final api = locator<ApiService>();
  fetchData() async {
    final body = await api.sendGet(endpoint: '/todos');
    navigator.navigateTo(Routes.loginView);
  }
}

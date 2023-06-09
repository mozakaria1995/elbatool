
import 'package:auth_manager/new/base/base_repo.dart';
import 'package:auth_manager/new/model/blog_model.dart';
import 'package:auth_manager/new/model/response/branches_model.dart';
import 'package:auth_manager/new/network/Endpoints.dart';

class BranchesRepo extends BaseRepo {
  Future<BranchesListModel?> getBranchList() {
    return networkManager.get<BranchesListModel>(Endpoints.BRANCHES,);
  }
}
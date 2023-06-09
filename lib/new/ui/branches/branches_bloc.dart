import 'dart:async';
import 'package:auth_manager/new/base/base_bloc.dart';
import 'package:auth_manager/new/base/base_view.dart';
import 'package:auth_manager/new/model/contactus_model.dart';
import 'package:auth_manager/new/model/response/branches_model.dart';
import 'package:auth_manager/new/repositories/branches_repo.dart';
import 'package:auth_manager/new/repositories/contact_us_repo.dart';

class BranchesBloc extends BaseBloc {
  BranchesBloc(BaseView view) : super(view);
List<BranchesModel> branchesList=[];
  BranchesRepo branchesRepo = BranchesRepo();

  void getBranchesList() {
    branchesRepo.getBranchList().then((response) {
      branchesList=response!.data!;

    }, onError: (error) {
      handleError(error);
      }
    );
  }


  @override
  void onDispose() {
    branchesRepo.dispose();
  }
}

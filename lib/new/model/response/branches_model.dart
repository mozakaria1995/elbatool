class BranchesListModel {
  List<BranchesModel>? data;

  BranchesListModel({this.data});

  BranchesListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BranchesModel>[];
      json['data'].forEach((v) {
        data!.add(BranchesModel.fromJson(v));
      });
    }
  }


}

class BranchesModel {
  int? id;
  String? phone;
  String? clinicName;
  String? address;

  BranchesModel({this.id, this.phone, this.clinicName, this.address});

  BranchesModel.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    phone= json['phone'];
    clinicName= json['clinic_name'];
    address= json['address'];

  }


}
import 'package:auth_manager/new/base/base_state.dart';

import 'package:auth_manager/new/ui/branches/branches_bloc.dart';
import 'package:flutter/material.dart';

import '../../utils/resoures/color_manager.dart';

class BranchesScreen extends StatefulWidget {
  @override
  _BranchesScreenState createState() => _BranchesScreenState();
}

class _BranchesScreenState extends BaseState<BranchesScreen, BranchesBloc> {
  @override
  void initState() {
    super.initState();
    bloc.getBranchesList();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الفروع"),),
      body: ListView.builder(
        itemCount: bloc.branchesList.length,
        itemBuilder: (context,index)=>
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0,horizontal: 28),
              child: ExpansionTile(
                expandedAlignment: Alignment.bottomRight,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                iconColor: ColorManager.primary,

                title:  Text(bloc.branchesList[index].clinicName!), //header title
                children: [
                  Container(
                      padding:const EdgeInsets.all(20),
                      width: double.infinity,

                      child:   Row(children: [
                        Icon(Icons.phone),
                        SizedBox(width: 5,),
                        Text(bloc.branchesList[index].phone!)
                      ],)
                  ),
                  Container(
                    padding:const EdgeInsets.all(20),
                    width: double.infinity,
                    child:  Row(children: [
                      Icon(Icons.pin_drop),
                      SizedBox(width: 5,),
                      Text(bloc.branchesList[index].address??"لا يوجد تفاصيل عن العنوان")
                    ],),
                  )
                ],
              ),
            ),
      ),
    );
  }

  @override
  void initBloc() {
    bloc = BranchesBloc(this);
  }
}




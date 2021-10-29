import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/helper/data_helper.dart';
import 'package:dinamik_not_app/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDerslers = DataHelper.tumDersler;
    return tumDerslers.length > 0
        ? ListView.builder(
            itemCount: tumDerslers.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (d) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      subtitle: Text(
                          "${tumDerslers[index].krediDegeri} Kredi , Not Değeri : ${tumDerslers[index].harfDegeri}",
                          style: Sabitler.subtitleStyle),
                      leading: CircleAvatar(
                          child: Text(tumDerslers[index].ad[1].toUpperCase())),
                      title: Text(
                        tumDerslers[index].ad.toUpperCase(),
                        style: Sabitler.dersListeStyle,
                      ),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Container(
            child: Text("Lütfen Bir Ders Giriniz", style: Sabitler.baslikStyle),
          ));
  }
}

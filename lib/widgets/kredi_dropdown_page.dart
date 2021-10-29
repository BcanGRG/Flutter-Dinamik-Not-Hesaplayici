import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediDegeri;
  KrediDropdownWidget({Key? key, required this.onKrediDegeri})
      : super(key: key);

  @override
  _KrediDropdownWidgetState createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double choosedValueCredit = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade300.withOpacity(0.3),
        borderRadius: Sabitler.borderRadiusForm,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        underline: Container(),
        onChanged: (value) {
          setState(() {
            choosedValueCredit = value!;
            widget.onKrediDegeri(choosedValueCredit);
          });
        },
        value: choosedValueCredit,
        items: DataHelper.tumKrediler(),
      ),
    );
  }
}

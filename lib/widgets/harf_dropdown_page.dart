import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfDegeri;
  HarfDropDownWidget({required this.onHarfDegeri, Key? key}) : super(key: key);

  @override
  _HarfDropDownWidgetState createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double choosedValueLetter = 4;
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
            choosedValueLetter = value!;
            widget.onHarfDegeri(choosedValueLetter);
          });
        },
        value: choosedValueLetter,
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}

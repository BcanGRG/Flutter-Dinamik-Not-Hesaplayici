import 'package:dinamik_not_app/constants/app_constants.dart';
import 'package:dinamik_not_app/helper/data_helper.dart';
import 'package:dinamik_not_app/model/ders.dart';
import 'package:dinamik_not_app/widgets/ders_listesi.dart';
import 'package:dinamik_not_app/widgets/harf_dropdown_page.dart';
import 'package:dinamik_not_app/widgets/kredi_dropdown_page.dart';
import 'package:dinamik_not_app/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesapApp extends StatefulWidget {
  @override
  State<OrtalamaHesapApp> createState() => _OrtalamaHesapAppState();
}

class _OrtalamaHesapAppState extends State<OrtalamaHesapApp> {
  final formKey = GlobalKey<FormState>();
  double choosedValueLetter = 4;
  double choosedValueCredit = 1;
  late String girilenDersAdi;
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
              child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildForm(),
                  flex: 7,
                ),
                Expanded(
                    flex: 3,
                    child: OrtalamaGoster(
                        ortalama: DataHelper.ortalamaHesapla(),
                        dersSayisi: DataHelper.tumDersler.length))
              ],
            ),
            Expanded(
              child: DersListesi(
                onDismiss: (index) {
                  setState(() {
                    DataHelper.tumDersler.removeAt(index);
                  });
                },
              ),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.dropDownHorizontal,
            child: _buildTextFormField(),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: Sabitler.dropDownHorizontal,
                child: HarfDropDownWidget(
                  onHarfDegeri: (harf) {
                    choosedValueLetter = harf;
                  },
                ),
              )),
              Expanded(
                  child: Padding(
                      padding: Sabitler.dropDownHorizontal,
                      child: KrediDropdownWidget(onKrediDegeri: (kredi) {
                        choosedValueCredit = kredi;
                      }))),
              Expanded(
                child: Padding(
                    padding: Sabitler.dropDownHorizontal,
                    child: IconButton(
                      onPressed: _dersEkleveOrtalamaHesapla,
                      icon: Icon(Icons.arrow_forward_ios_sharp),
                      iconSize: 30,
                      color: Sabitler.anaRenk,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          girilenDersAdi = value!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders Adını Giriniz";
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadiusForm,
          borderSide: BorderSide.none,
        ),
        hintText: "Matematik",
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: choosedValueLetter,
          krediDegeri: choosedValueCredit);

      DataHelper.dersEkle(eklenecekDers);

      FocusScope.of(context).unfocus();
    }
  }
}

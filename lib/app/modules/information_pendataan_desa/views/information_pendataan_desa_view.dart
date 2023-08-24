import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../pelajari_pendataan/views/pelajari_pendataan_view.dart';
import '../../pendataan/views/pendataan_view.dart';
import '../../utils/theme.dart';
import '../controllers/information_pendataan_desa_controller.dart';

class InformationPendataanDesaView
    extends GetView<InformationPendataanDesaController> {
  const InformationPendataanDesaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildHeader(),
                SizedBox(
                  height: 20,
                ),
                content(),
                SizedBox(
                  height: 20,
                ),
                buildHeader2(),
                SizedBox(
                  height: 15,
                ),
                fitur(),
                SizedBox(
                  height: 20,
                ),
                fitur2(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class buildHeader extends StatelessWidget {
  const buildHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Text(
      'Sekilas Info',
      style: blackTextStyle.copyWith(
        fontSize: width / 12.9375,
        fontWeight: bold,
      ),
    );
  }
}

class buildHeader2 extends StatelessWidget {
  const buildHeader2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Text(
      'Fitur',
      style: blackTextStyle.copyWith(
        fontSize: width / 12.9375,
        fontWeight: bold,
      ),
    );
  }
}

class content extends StatelessWidget {
  const content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 1.5054,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBlackColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10), // Menambahkan border radius
                child: Image.asset(
                  'assets/gempa.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Text(
                          'GEMPA',
                          style: whiteTextStyle.copyWith(
                            fontSize: width / 11.6,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'BUMI',
                          style: orangeRedTextstyle.copyWith(
                            fontSize: width / 8.28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Gempa bumi adalah getaran atau guncangan yang terjadi di permukaan bumi akibat pelepasan energi dari bawah permukaan',
                    style: whiteTextStyle.copyWith(
                      fontSize: width / 25.875,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class fitur extends StatelessWidget {
  const fitur({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: width / 5.175,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.edit_document,
                  color: kOrangeRed,
                  size: width / 10.35,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () => Get.to(
                      PendataanView(),
                    ),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'PENDATAAN',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 25.875,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class fitur2 extends StatelessWidget {
  const fitur2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: width / 5.175,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.cast_for_education,
                  color: kOrangeRed,
                  size: width / 10.35,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () => Get.to(PelajariPendataanView()),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'PELAJARI',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 25.875,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

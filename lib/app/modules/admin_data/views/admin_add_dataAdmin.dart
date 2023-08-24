import 'package:disaster_mapper/app/modules/admin_data/controllers/admin_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';

class AddAdminDesaView extends StatelessWidget {
  final controller = Get.put(AdminDataController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        title: Text(
          'TAMBAH ADMIN DESA',
          style: orangeRedTextstyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Username',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              Username(controller: controller),
              SizedBox(height: 16.0),
              Text(
                'Email',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              Email(controller: controller),
              SizedBox(height: 16.0),
              Text(
                'Password',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              Password(controller: controller),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Provinsi',
                    style: blackTextStyle.copyWith(
                      fontSize: width / 20.7,
                      fontWeight: bold,
                    ),
                  ),
                  Provinsi(controller: controller),
                  const SizedBox(height: 16.0),
                  Text(
                    'Kabupaten/Kota',
                    style: blackTextStyle.copyWith(
                      fontSize: width / 20.7,
                      fontWeight: bold,
                    ),
                  ),
                  KabupatenKota(controller: controller),
                  const SizedBox(height: 16.0),
                  Text(
                    'Kecamatan',
                    style: blackTextStyle.copyWith(
                      fontSize: width / 20.7,
                      fontWeight: bold,
                    ),
                  ),
                  Kecamatan(controller: controller),
                  SizedBox(height: 16.0),
                  Text(
                    'Desa',
                    style: blackTextStyle.copyWith(
                      fontSize: width / 20.7,
                      fontWeight: bold,
                    ),
                  ),
                  Desa(controller: controller),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kOrangeRed,
                ),
                onPressed: controller.saveData,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    super.key,
    required this.controller,
  });

  final AdminDataController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kBlackColor,
          width: 1,
        ),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: TextFormField(
                obscureText: controller.obscureText.value,
                decoration: InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                onChanged: (value) => controller.password(value),
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  controller.obscureText.value = !controller.obscureText.value;
                },
                child: Icon(
                  controller.obscureText.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kBlackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Username extends StatelessWidget {
  const Username({
    super.key,
    required this.controller,
  });

  final AdminDataController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kBlackColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        autocorrect: false,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration.collapsed(
          hintText: 'Username',
          hintStyle: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onChanged: (value) => controller.username(value),
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    super.key,
    required this.controller,
  });

  final AdminDataController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kBlackColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        autocorrect: false,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration.collapsed(
          hintText: 'Email',
          hintStyle: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onChanged: (value) => controller.email(value),
      ),
    );
  }
}

class Desa extends StatelessWidget {
  const Desa({
    super.key,
    required this.controller,
  });

  final AdminDataController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: kBlackColor,
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          hint: Text('Desa'),
          isDense: true,
          isExpanded: true,
          value: controller.selectedDesa.value.isNotEmpty
              ? controller.selectedDesa.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedDesa.value = newValue ?? '';
          },
          items: controller.desaList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

class Kecamatan extends StatelessWidget {
  const Kecamatan({
    super.key,
    required this.controller,
  });

  final AdminDataController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: kBlackColor,
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          hint: Text('Kecamatan'),
          isDense: true,
          isExpanded: true,
          value: controller.selectedKecamatan.value.isNotEmpty
              ? controller.selectedKecamatan.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedKecamatan.value = newValue ?? '';
            controller.selectedDesa.value = '';
            controller.fetchDataDesa(newValue!);
          },
          items: controller.kecamatanList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

class KabupatenKota extends StatelessWidget {
  const KabupatenKota({
    super.key,
    required this.controller,
  });

  final AdminDataController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: kBlackColor,
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          hint: Text('Kabupaten/Kota'),
          isDense: true,
          isExpanded: true,
          value: controller.selectedKabupaten.value.isNotEmpty
              ? controller.selectedKabupaten.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedKabupaten.value = newValue ?? '';
            controller.selectedKecamatan.value = '';
            controller.selectedDesa.value = '';
            controller.fetchDataKecamatan(newValue!);
          },
          items: controller.kabupatenList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

class Provinsi extends StatelessWidget {
  const Provinsi({
    super.key,
    required this.controller,
  });

  final AdminDataController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          top: 16,
          bottom: 16,
        ),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: kBlackColor,
            width: 1,
          ),
        ),
        child: DropdownButton<String>(
          hint: Text('Provinsi'),
          isExpanded: true,
          isDense: true,
          value: controller.selectedProvinsi.value.isNotEmpty
              ? controller.selectedProvinsi.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedProvinsi.value = newValue ?? '';
            controller.selectedKabupaten.value = '';
            controller.selectedKecamatan.value = '';
            controller.selectedDesa.value = '';
            controller.fetchDataKabupaten(newValue!);
          },
          items: controller.provinsiList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

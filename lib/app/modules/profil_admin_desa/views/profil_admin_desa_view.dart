import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_admin_desa_controller.dart';

class ProfilAdminDesaView extends GetView<ProfilAdminDesaController> {
  const ProfilAdminDesaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilAdminDesaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilAdminDesaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

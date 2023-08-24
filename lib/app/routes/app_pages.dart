import 'package:get/get.dart';

import '../modules/admin_data/bindings/admin_data_binding.dart';
import '../modules/admin_data/views/admin_add_dataAdmin.dart';
import '../modules/admin_data/views/admin_data_view.dart';
import '../modules/admin_desa_home/bindings/admin_desa_home_binding.dart';
import '../modules/admin_desa_home/views/admin_desa_home_view.dart';
import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/bottom_admin/bindings/bottom_admin_binding.dart';
import '../modules/bottom_admin/views/bottom_admin_view.dart';
import '../modules/bottom_admin_desa/bindings/bottom_admin_desa_binding.dart';
import '../modules/bottom_admin_desa/views/bottom_admin_desa_view.dart';
import '../modules/bottom_user/bindings/bottom_user_binding.dart';
import '../modules/bottom_user/views/bottom_user_view.dart';
import '../modules/edukasi/bindings/edukasi_binding.dart';
import '../modules/edukasi/views/edukasi_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information_pendataan/bindings/information_pendataan_binding.dart';
import '../modules/information_pendataan/views/information_pendataan_view.dart';
import '../modules/information_pendataan_desa/bindings/information_pendataan_desa_binding.dart';
import '../modules/information_pendataan_desa/views/information_pendataan_desa_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pelajari_pendataan/bindings/pelajari_pendataan_binding.dart';
import '../modules/pelajari_pendataan/views/pelajari_pendataan_view.dart';
import '../modules/pendataan/bindings/pendataan_binding.dart';
import '../modules/pendataan/views/pendataan_view.dart';
import '../modules/profil_admin_desa/bindings/profil_admin_desa_binding.dart';
import '../modules/profil_admin_desa/views/profil_admin_desa_view.dart';
import '../modules/profile_user/bindings/profile_user_binding.dart';
import '../modules/profile_user/views/profile_user_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_USER,
      page: () => ProfileUserView(),
      binding: ProfileUserBinding(),
    ),
    GetPage(
      name: _Paths.PENDATAAN,
      page: () => PendataanView(),
      binding: PendataanBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DESA_HOME,
      page: () => AdminDesaHomeView(),
      binding: AdminDesaHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_DATA,
      page: () => AdminDataView(),
      binding: AdminDataBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADMIN,
      page: () => AddAdminDesaView(),
      binding: AdminDataBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_USER,
      page: () => BottomUserView(),
      binding: BottomUserBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION_PENDATAAN,
      page: () => InformationPendataanView(),
      binding: InformationPendataanBinding(),
    ),
    GetPage(
      name: _Paths.EDUKASI,
      page: () => EdukasiView(),
      binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.PELAJARI_PENDATAAN,
      page: () => PelajariPendataanView(),
      binding: PelajariPendataanBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_ADMIN,
      page: () => const BottomAdminView(),
      binding: BottomAdminBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_ADMIN_DESA,
      page: () => const BottomAdminDesaView(),
      binding: BottomAdminDesaBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_ADMIN_DESA,
      page: () => const ProfilAdminDesaView(),
      binding: ProfilAdminDesaBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION_PENDATAAN_DESA,
      page: () => const InformationPendataanDesaView(),
      binding: InformationPendataanDesaBinding(),
    ),
  ];
}

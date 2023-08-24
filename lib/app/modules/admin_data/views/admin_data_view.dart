import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/data_collection.dart';
import '../../../data/detail_pendataan2.dart';
import '../../utils/theme.dart';
import '../controllers/admin_data_controller.dart';

class AdminDataView extends GetView<AdminDataController> {
  const AdminDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: controller.searchController,
                onChanged: (value) {
                  performSearch();
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: width / 23,
                ),
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama/NIK/NO.KK',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width / 23,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: kOrangeRed,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Border saat input diberi fokus
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: kOrangeRed,
                      width: 2,
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: kOrangeRed,
                    ),
                    onPressed: () {
                      controller.searchController.clear();
                      performSearch();
                    },
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: kOrangeRed,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (controller.searchResults.isEmpty) {
                    return ListView.builder(
                      itemCount: controller.pendataanList.length,
                      itemBuilder: (context, index) {
                        PendataanData pendataanData =
                            controller.pendataanList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DetailPendataan(
                                pendataanData: pendataanData,
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: width / 4.14,
                                    height: width / 4.14,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          pendataanData.imageUrls.isNotEmpty
                                              ? pendataanData.imageUrls[0]
                                              : 'https://via.placeholder.com/150',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${pendataanData.namaPemilik}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 29.5714,
                                              fontWeight: bold),
                                        ),
                                        Text(
                                          '${pendataanData.nik}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 29.5714,
                                              fontWeight: regular),
                                        ),
                                        Text(
                                          'No. Kartu Keluarga\n${pendataanData.nomorKK}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 25.875,
                                              fontWeight: bold),
                                        ),
                                        Text(
                                          '${pendataanData.tingkatKerusakan}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 29.5714,
                                              fontWeight: regular),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.searchResults.length,
                      itemBuilder: (context, index) {
                        PendataanData searchData =
                            controller.searchResults[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => DetailPendataan(pendataanData: searchData),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: width / 4.14,
                                    height: width / 4.14,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          searchData.imageUrls.isNotEmpty
                                              ? searchData.imageUrls[0]
                                              : 'https://via.placeholder.com/150',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${searchData.namaPemilik}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 29.5714,
                                              fontWeight: bold),
                                        ),
                                        Text(
                                          '${searchData.nik}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 29.5714,
                                              fontWeight: regular),
                                        ),
                                        Text(
                                          'No. Kartu Keluarga\n${searchData.nomorKK}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 25.875,
                                              fontWeight: bold),
                                        ),
                                        Text(
                                          '${searchData.tingkatKerusakan}',
                                          style: blackTextStyle.copyWith(
                                              fontSize: width / 29.5714,
                                              fontWeight: regular),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void performSearch() {
    String query = controller.searchController.text.trim();
    if (query.isNotEmpty) {
      List<PendataanData> searchData =
          controller.pendataanList.where((pendataanData) {
        return pendataanData.nik.contains(query) ||
            pendataanData.nomorKK.contains(query) ||
            pendataanData.namaPemilik.contains(query) ||
            pendataanData.tingkatKerusakan.contains(query);
      }).toList();
      controller.updateSearchResults(searchData);
    } else {
      controller.clearSearchResults();
    }
  }
}

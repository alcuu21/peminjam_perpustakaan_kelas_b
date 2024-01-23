import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaan_kelas_b/app/constant/endpoint.dart';
import 'package:petugas_perpustakaan_kelas_b/app/data/provider/api.provider.dart';
import 'package:petugas_perpustakaan_kelas_b/app/modules/book/controllers/book_controller.dart';

class AddBookController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahun_terbitController = TextEditingController();
  final BookController bookController = Get.find();
  //TODO: Implement AddBookController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

login() async {
  loading(true);
  try {
    FocusScope.of(Get.context!).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      final response = await ApiProvider.instance().post(Endpoint.book,
          data: {
          "judul": judulController.text.toString(),
          "penulis": judulController.text.toString(),
          "penerbit": penerbitController.text.toString(),
          "tahun_terbit": int.parse(tahunTerbitController.text.toString())
          });
      if (response.statusCode == 200) {
        bookController.getData();
        await StorageProvider.write(StorageKey, "logged");
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
      }
    }
    loading(false);
  }on DioException catch (e){
    loading(false);
    if(e.response != null) {
      if (e.response?.data != null) {
        Get.snackbar("sorry", "${e.response?.data[message]}",
            backgroundColor: Colors.orange);
      }
    }else{
      Get.snackbar("Sorry", e.message?? "", backgroundColor: Colors.red);
    }
  } catch (e){
    loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);


  }
}
}

import 'package:get/get.dart';
import 'package:petugas_perpustakaan_kelas_b/app/data/model/response_book.dart';
import 'package:petugas_perpustakaan_kelas_b/app/data/provider/api.provider.dart';

import '../../../constant/endpoint.dart';

class BookController extends GetxController with StateMixin<List<DataBook>>{


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
  Future<void>getData() async{
    change(null, status: RxStatus.empty()
      final response = await ApiProvider.instance()get(Endpoint.login,);
      if (response.statusCode == 200) {
       final ResponseBook responseBook = ResponseBook.fromJson(response.data);\
     if(responseBook.data!.isEmpty){
    }  else {
        Get.snackbar("Sorry,","${e.response?.data['message]}, backgroundColor: Colors.red);
      }
    }

  on.DioException; catch (e){
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
}

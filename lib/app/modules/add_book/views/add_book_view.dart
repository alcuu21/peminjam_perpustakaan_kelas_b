import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body: Center   body: Center(
    child:Form(
    key: controller.formKey,
        child: Column(
          children: [
          TextFormField(
          controller: controller.Controller,
          decoration: InputDecoration(hintText: "Masukkan Username"),
          validator: (value){
            if(value!.length>6){
              return "username tidak boleh kosong";
            }
            return null;
          },
        ),
        TextFormField(
          controller: controller.passwordController,
          decoration: InputDecoration(hintText: "Masukkan Password"),
          validator: (value){
            if(value!.length>6){
              return "Password tidak boleh kosong";
            }
            return null;
          },
        )
        Obx(() =>controller.loading.value?
    CircularProgressIndicator():
      body: const Center(
        child: Text(
          'AddBookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:anubs_invoice_app/model/product.dart';
import 'package:anubs_invoice_app/services/api_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductData>[].obs;
  final apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  // product get here
  Future<void> fetchProduct() async {
    try {
      final products = await apiService.getProduct();
      print('Fetched ${products.length} products');
      productList.assignAll(products);
    } catch (e) {
      print(e);
      Get.snackbar("Error", "error get products");
    }
  }

  // product post here
  Future<void> createProduct(ProductData productData) async {
    try {
      print("Creating product: ${productData.toJson()}");
      await apiService.postProduct(productData);
      await fetchProduct();
      Get.snackbar("Success", "Product added");
    } catch (e, stacktrace) {
      print("Error: $e");
      print("Stacktrace: $stacktrace");
      Get.snackbar("Error", "product no added");
    }
  }

  // product delete here
  // Future<void> removeProduct(ProductData productData) async {
  //   try {
  //     await apiService.deleteProduct(productData.sId!);
  //     await fetchProduct();
  //     Get.snackbar("Sucsess", "Product Deleted");
  //   } catch (e) {
  //     Get.snackbar("error", "product not deleted");
  //   }
  // }

  Future<void> removeProduct(ProductData productData) async {
    try {
      final id = productData.sId;
      if (id == null || id.isEmpty) {
        Get.snackbar("Error", "Product ID is missing");
        return;
      }

      print("Deleting product with ID: $id");
      await apiService.deleteProduct(id);
      await fetchProduct();
      Get.snackbar("Success", "Product Deleted");
    } catch (e) {
      print("Delete error: $e");
      Get.snackbar("Error", "Product not deleted");
    }
  }
}

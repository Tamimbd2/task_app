import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_task/core/constants/app_colors.dart';
import '../../service/connectivity_service.dart';
import '../controllers/product_controller.dart';


class ProductScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final ConnectivityService connectivityService = Get.put(ConnectivityService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Product List',
          style: TextStyle(color: AppColors.background),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.refreshProducts(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final width = MediaQuery.of(context).size.width;
        final isWide = width > 700;

        if (controller.products.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  connectivityService.isOnline.value
                      ? Icons.shopping_cart_outlined
                      : Icons.cloud_off,
                  size: 64,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  connectivityService.isOnline.value
                      ? 'No products found'
                      : 'No cached products available',
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                if (!connectivityService.isOnline.value)
                  const Text(
                    'Connect to internet to fetch products',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.refreshProducts(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: isWide
                ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                var product = controller.products[index];
                return _buildProductCard(product);
              },
            )
                : ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                var product = controller.products[index];
                return _buildProductTile(product);
              },
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProductTile(product) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 3,
      child: ListTile(
        leading: Image.network(
          product.images.isNotEmpty ? product.images[0] : 'https://placehold.co/100x100',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 60,
              height: 60,
              color: Colors.grey.shade200,
              child: const Icon(Icons.broken_image, color: Colors.grey, size: 32),
            );
          },
        ),
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '\$${product.price}',
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildProductCard(product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.images.isNotEmpty ? product.images[0] : 'https://placehold.co/200x200',
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, color: Colors.grey, size: 50),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price}',
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
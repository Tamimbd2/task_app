import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../assignment3/database_helper.dart';
import '../../service/connectivity_service.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;
  var isOfflineMode = false.obs;

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final ConnectivityService _connectivityService = Get.find<ConnectivityService>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();

    // Listen to connectivity changes
    ever(_connectivityService.isOnline, (isOnline) {
      if (isOnline && isOfflineMode.value) {
        // When back online, try to refresh data
        fetchProducts();
      }
    });
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);

      // First, always load from cache to show data immediately
      await _loadCachedProductsSilently();

      // Check if online
      if (_connectivityService.isOnline.value) {
        // Try to fetch from API
        try {
          var response = await http.get(
              Uri.parse('https://api.escuelajs.co/api/v1/products')
          ).timeout(const Duration(seconds: 10));

          if (response.statusCode == 200) {
            var jsonData = json.decode(response.body) as List;
            products.value = jsonData.map((e) => Product.fromJson(e)).toList();

            // Cache data to local database
            await _dbHelper.insertProducts(products);
            isOfflineMode(false);

            // No snackbar for success
          }
        } catch (e) {
          print("Error fetching from API: $e");
          // If API fails but we're online, show cached data silently
          if (products.isEmpty) {
            await _loadFromCacheQuietly();
          } else {
            isOfflineMode(false);
            // No snackbar for warning
          }
        }
      } else {
        // Load from local database when offline
        if (products.isEmpty) {
          await _loadFromCacheQuietly();
        } else {
          isOfflineMode(true);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  // Silent load without showing snackbar
  Future<void> _loadCachedProductsSilently() async {
    try {
      final cachedProducts = await _dbHelper.getProducts();
      if (cachedProducts.isNotEmpty) {
        products.value = cachedProducts;
        isOfflineMode(true);
      }
    } catch (e) {
      print("Error loading cached products: $e");
    }
  }

  // Load from cache quietly without any notification
  Future<void> _loadFromCacheQuietly() async {
    try {
      final cachedProducts = await _dbHelper.getProducts();

      if (cachedProducts.isNotEmpty) {
        products.value = cachedProducts;
        isOfflineMode(true);
      } else {
        products.value = [];
      }
    } catch (e) {
      print("Error loading from cache: $e");
    }
  }

  Future<void> loadFromCache() async {
    try {
      final cachedProducts = await _dbHelper.getProducts();

      if (cachedProducts.isNotEmpty) {
        products.value = cachedProducts;
        isOfflineMode(true);
        // No snackbar
      } else {
        products.value = [];
        // No snackbar
      }
    } catch (e) {
      print("Error loading from cache: $e");
    }
  }

  Future<void> refreshProducts() async {
    await fetchProducts();
  }

  Future<void> clearCache() async {
    await _dbHelper.deleteAllProducts();
    products.clear();
    // No snackbar
  }
}
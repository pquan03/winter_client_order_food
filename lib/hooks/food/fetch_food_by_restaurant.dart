import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:winter_food/common/snackbar_custom.dart';
import 'package:winter_food/constants/constants.dart';
import 'package:winter_food/models/api_error.dart';
import 'package:winter_food/models/food.dart';
import 'package:winter_food/models/hooks_model/hook_result.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchFoodsByRestaurant(String code) {
  final listFoods = useState<List<FoodModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/food/restaurant-foods/$code');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        listFoods.value = foodModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (err) {
      WLoader.errorSnackBar(title: 'Error', message: err.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: listFoods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

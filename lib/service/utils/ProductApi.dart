// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.code,
    required this.product,
    required this.status,
    required this.statusVerbose,
  });

  String code;
  ProductClass product;
  int status;
  String statusVerbose;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        code: json["code"],
        product: ProductClass.fromJson(json["product"]),
        status: json["status"],
        statusVerbose: json["status_verbose"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "product": product.toJson(),
        "status": status,
        "status_verbose": statusVerbose,
      };

  @override
  String toString() {
    return 'Product{code: ${code.toString()}, product: ${product.toString()}, status: $status, statusVerbose: $statusVerbose}';
  }
}

class ProductClass {
  ProductClass({
    this.id,
    this.allergensFromIngredients,
    this.brands,
    this.categories,
    this.code,
    this.dataQualityWarningsTags,
    this.genericName,
    this.genericNameDe,
    this.productId,
    this.imageIngredientsUrl,
    this.imageNutritionUrl,
    this.imageUrl,
    this.ingredients,
    //this.ingredientsHierarchy,
    this.labels,
    this.nutrientLevels,
    this.nutriments,
    this.nutriscoreGrade,
    this.nutriscoreScore,
    this.nutritionDataPer,
    this.nutritionDataPerImported,
    this.nutritionDataPrepared,
    this.nutritionDataPreparedPer,
    this.nutritionGrades,
    this.nutritionGradesTags,
    this.servingQuantity,
    this.servingSize,
    this.servingSizeImported,
    this.sortkey,
    required this.productName,
  });

  String? id;
  String? allergensFromIngredients;
  String? brands;
  String? categories;
  String? code;
  List<String>? dataQualityWarningsTags;
  String? genericName;
  String? genericNameDe;
  String? productId;
  String? imageIngredientsUrl;
  String? imageNutritionUrl;
  String? imageUrl;
  List<Ingredient>? ingredients;

  //List<String>? ingredientsHierarchy;
  String? labels;
  NutrientLevels? nutrientLevels;
  Nutriments? nutriments;
  String? nutriscoreGrade;
  int? nutriscoreScore;
  String? nutritionDataPer;
  String? nutritionDataPerImported;
  String? nutritionDataPrepared;
  String? nutritionDataPreparedPer;
  String? nutritionGrades;
  List<String>? nutritionGradesTags;
  String? servingQuantity;
  String productName;
  String? servingSize;
  String? servingSizeImported;
  int? sortkey;

  factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
        id: json["_id"],
        allergensFromIngredients: json["allergens_from_ingredients"],
        brands: json["brands"],
        categories: json["categories"],
        code: json["code"],
        dataQualityWarningsTags:
            List<String>.from(json["data_quality_warnings_tags"].map((x) => x)),
        genericName: json["generic_name"],
        genericNameDe: json["generic_name_de"],
        productId: json["id"],
        imageIngredientsUrl: json["image_ingredients_url"],
        imageNutritionUrl: json["image_nutrition_url"],
        imageUrl: json["image_url"],
        ingredients: json["ingredients"] == null? null : List<Ingredient>.from(
            json["ingredients"]?.map((x) => Ingredient.fromJson(x))),
        // ingredientsHierarchy:
        //     List<String>.from(json["ingredients_hierarchy"].map((x) => x)),
        labels: json["labels"],
        nutrientLevels: NutrientLevels.fromJson(json["nutrient_levels"]),
        nutriments: Nutriments.fromJson(json["nutriments"]),
        nutriscoreGrade: json["nutriscore_grade"],
        nutriscoreScore: json["nutriscore_score"],
        nutritionDataPer: json["nutrition_data_per"],
        nutritionDataPerImported: json["nutrition_data_per_imported"],
        nutritionDataPrepared: json["nutrition_data_prepared"],
        nutritionDataPreparedPer: json["nutrition_data_prepared_per"],
        nutritionGrades: json["nutrition_grades"],
        nutritionGradesTags:
            List<String>.from(json["nutrition_grades_tags"].map((x) => x)),
        servingQuantity: json["serving_quantity"].toString(),
        productName: json["product_name"].toString(),
        servingSize: json["serving_size"],
        servingSizeImported: json["serving_size_imported"].toString(),
        sortkey: json["sortkey"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "allergens_from_ingredients": allergensFromIngredients,
        "brands": brands,
        "categories": categories,
        "code": code,
        "data_quality_warnings_tags":
            List<dynamic>.from(dataQualityWarningsTags!.map((x) => x)),
        "generic_name": genericName,
        "generic_name_de": genericNameDe,
        "id": productId,
        "image_ingredients_url": imageIngredientsUrl,
        "image_nutrition_url": imageNutritionUrl,
        "image_url": imageUrl,
        "ingredients":
            ingredients == null ? null : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
        // "ingredients_hierarchy":
        //     List<dynamic>.from(ingredientsHierarchy!.map((x) => x)),
        "labels": labels,
        "nutrient_levels": nutrientLevels!.toJson(),
        "nutriments": nutriments!.toJson(),
        "nutriscore_grade": nutriscoreGrade,
        "nutriscore_score": nutriscoreScore,
        "nutrition_data_per": nutritionDataPer,
        "nutrition_data_per_imported": nutritionDataPerImported,
        "nutrition_data_prepared": nutritionDataPrepared,
        "nutrition_data_prepared_per": nutritionDataPreparedPer,
        "nutrition_grades": nutritionGrades,
        "nutrition_grades_tags":
            List<dynamic>.from(nutritionGradesTags!.map((x) => x)),
        "serving_quantity": servingQuantity,
        "product_name": productName,
        "serving_size": servingSize,
        "serving_size_imported": servingSizeImported,
        "sortkey": sortkey,
      };

  @override
  String toString() {
    return 'ProductClass{id: $id, allergensFromIngredients: $allergensFromIngredients, brands: $brands, categories: $categories, code: $code, dataQualityWarningsTags: $dataQualityWarningsTags, genericName: $genericName, genericNameDe: $genericNameDe, productId: $productId, imageIngredientsUrl: $imageIngredientsUrl, imageNutritionUrl: $imageNutritionUrl, imageUrl: $imageUrl, ingredients: $ingredients, labels: $labels, nutrientLevels: $nutrientLevels, nutriments: $nutriments, nutriscoreGrade: $nutriscoreGrade, nutriscoreScore: $nutriscoreScore, nutritionDataPer: $nutritionDataPer, nutritionDataPerImported: $nutritionDataPerImported, nutritionDataPrepared: $nutritionDataPrepared, nutritionDataPreparedPer: $nutritionDataPreparedPer, nutritionGrades: $nutritionGrades, nutritionGradesTags: $nutritionGradesTags, servingQuantity: $servingQuantity, productName: $productName, servingSize: $servingSize, servingSizeImported: $servingSizeImported, sortkey: $sortkey}';
  }
}

class Ingredient {
  Ingredient({
    this.hasSubIngredients,
    this.id,
    this.percentEstimate,
    this.percentMax,
    this.percentMin,
    this.text,
    this.vegan,
    this.vegetarian,
  });

  HasSubIngredients? hasSubIngredients;
  String? id;
  double? percentEstimate;
  double? percentMax;
  double? percentMin;
  String? text;
  HasSubIngredients? vegan;
  HasSubIngredients? vegetarian;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        hasSubIngredients: json["has_sub_ingredients"] == null
            ? null
            : hasSubIngredientsValues.map?[json["has_sub_ingredients"]],
        id: json["id"],
        percentEstimate: json["percent_estimate"]?.toDouble(),
        percentMax: json["percent_max"]?.toDouble(),
        percentMin: json["percent_min"]?.toDouble(),
        text: json["text"],
        vegan: json["vegan"] == null
            ? null
            : hasSubIngredientsValues.map?[json["vegan"]],
        vegetarian: json["vegetarian"] == null
            ? null
            : hasSubIngredientsValues.map?[json["vegetarian"]],
      );

  Map<String, dynamic> toJson() => {
        "has_sub_ingredients": hasSubIngredients == null
            ? null
            : hasSubIngredientsValues.reverse![hasSubIngredients],
        "id": id,
        "percent_estimate": percentEstimate,
        "percent_max": percentMax,
        "percent_min": percentMin,
        "text": text,
        "vegan": vegan == null ? null : hasSubIngredientsValues.reverse![vegan],
        "vegetarian": vegetarian == null
            ? null
            : hasSubIngredientsValues.reverse![vegetarian],
      };

  @override
  String toString() {
    return 'Ingredient{hasSubIngredients: $hasSubIngredients, id: $id, percentEstimate: $percentEstimate, percentMax: $percentMax, percentMin: $percentMin, text: $text, vegan: $vegan, vegetarian: $vegetarian}';
  }
}

enum HasSubIngredients { YES }

final hasSubIngredientsValues = EnumValues({"yes": HasSubIngredients.YES});

class NutrientLevels {
  NutrientLevels({
    this.fat,
    this.salt,
    this.saturatedFat,
    this.sugars,
  });

  String? fat;
  String? salt;
  String? saturatedFat;
  String? sugars;

  factory NutrientLevels.fromJson(Map<String, dynamic> json) => NutrientLevels(
        fat: json["fat"],
        salt: json["salt"],
        saturatedFat: json["saturated-fat"],
        sugars: json["sugars"],
      );

  Map<String, dynamic> toJson() => {
        "fat": fat,
        "salt": salt,
        "saturated-fat": saturatedFat,
        "sugars": sugars,
      };

  @override
  String toString() {
    return 'NutrientLevels{fat: $fat, salt: $salt, saturatedFat: $saturatedFat, sugars: $sugars}';
  }
}

class Nutriments {
  Nutriments({
    this.calcium,
    this.calcium100G,
    this.calciumServing,
    this.calciumUnit,
    this.calciumValue,
    this.carbohydrates,
    this.carbohydrates100G,
    this.carbohydratesServing,
    this.carbohydratesUnit,
    this.carbohydratesValue,
    this.cholesterol,
    this.cholesterol100G,
    this.cholesterolServing,
    this.cholesterolUnit,
    this.cholesterolValue,
    this.energy,
    this.energyKcal,
    this.energyKcal100G,
    this.energyKcalServing,
    this.energyKcalUnit,
    this.energyKcalValue,
    this.energy100G,
    this.energyServing,
    this.energyUnit,
    this.energyValue,
    this.fat,
    this.fat100G,
    this.fatServing,
    this.fatUnit,
    this.fatValue,
    this.fiber,
    this.fiber100G,
    this.fiberServing,
    this.fiberUnit,
    this.fiberValue,
    this.fruitsVegetablesNutsEstimateFromIngredients100G,
    this.fruitsVegetablesNutsEstimateFromIngredientsServing,
    this.iron,
    this.iron100G,
    this.ironServing,
    this.ironUnit,
    this.ironValue,
    this.novaGroup,
    this.novaGroup100G,
    this.novaGroupServing,
    this.nutritionScoreFr,
    this.nutritionScoreFr100G,
    this.proteins,
    this.proteins100G,
    this.proteinsServing,
    this.proteinsUnit,
    this.proteinsValue,
    this.salt,
    this.salt100G,
    this.saltServing,
    this.saltUnit,
    this.saltValue,
    this.saturatedFat,
    this.saturatedFat100G,
    this.saturatedFatServing,
    this.saturatedFatUnit,
    this.saturatedFatValue,
    this.sodium,
    this.sodium100G,
    this.sodiumServing,
    this.sodiumUnit,
    this.sodiumValue,
    this.sugars,
    this.sugars100G,
    this.sugarsServing,
    this.sugarsUnit,
    this.sugarsValue,
    this.transFat,
    this.transFat100G,
    this.transFatServing,
    this.transFatUnit,
    this.transFatValue,
    this.vitaminA,
    this.vitaminA100G,
    this.vitaminAServing,
    this.vitaminAUnit,
    this.vitaminAValue,
    this.vitaminC,
    this.vitaminC100G,
    this.vitaminCServing,
    this.vitaminCUnit,
    this.vitaminCValue,
  });

  double? calcium;
  double? calcium100G;
  double? calciumServing;
  String? calciumUnit;
  double? calciumValue;
  double? carbohydrates;
  double? carbohydrates100G;
  double? carbohydratesServing;
  String? carbohydratesUnit;
  double? carbohydratesValue;
  double? cholesterol;
  double? cholesterol100G;
  double? cholesterolServing;
  String? cholesterolUnit;
  double? cholesterolValue;
  double? energy;
  double? energyKcal;
  double? energyKcal100G;
  double? energyKcalServing;
  double? energyKcalUnit;
  double? energyKcalValue;
  double? energy100G;
  double? energyServing;
  String? energyUnit;
  double? energyValue;
  double? fat;
  double? fat100G;
  double? fatServing;
  String? fatUnit;
  double? fatValue;
  double? fiber;
  double? fiber100G;
  double? fiberServing;
  String? fiberUnit;
  double? fiberValue;
  double? fruitsVegetablesNutsEstimateFromIngredients100G;
  double? fruitsVegetablesNutsEstimateFromIngredientsServing;
  double? iron;
  double? iron100G;
  double? ironServing;
  String? ironUnit;
  double? ironValue;
  double? novaGroup;
  double? novaGroup100G;
  double? novaGroupServing;
  double? nutritionScoreFr;
  double? nutritionScoreFr100G;
  double? proteins;
  double? proteins100G;
  double? proteinsServing;
  String? proteinsUnit;
  double? proteinsValue;
  double? salt;
  double? salt100G;
  double? saltServing;
  String? saltUnit;
  double? saltValue;
  double? saturatedFat;
  double? saturatedFat100G;
  double? saturatedFatServing;
  String? saturatedFatUnit;
  double? saturatedFatValue;
  double? sodium;
  double? sodium100G;
  double? sodiumServing;
  String? sodiumUnit;
  double? sodiumValue;
  double? sugars;
  double? sugars100G;
  double? sugarsServing;
  String? sugarsUnit;
  double? sugarsValue;
  double? transFat;
  double? transFat100G;
  double? transFatServing;
  String? transFatUnit;
  double? transFatValue;
  double? vitaminA;
  double? vitaminA100G;
  double? vitaminAServing;
  String? vitaminAUnit;
  double? vitaminAValue;
  double? vitaminC;
  double? vitaminC100G;
  double? vitaminCServing;
  String? vitaminCUnit;
  double? vitaminCValue;

  factory Nutriments.fromJson(Map<String, dynamic> json) => Nutriments(
        calcium: json["calcium"]?.toDouble(),
        calcium100G: json["calcium_100g"]?.toDouble(),
        calciumServing: json["calcium_serving"]?.toDouble(),
        calciumUnit: json["calcium_unit"],
        calciumValue: json["calcium_value"]?.toDouble(),
        carbohydrates: json["carbohydrates"]?.toDouble(),
        carbohydrates100G: json["carbohydrates_100g"]?.toDouble(),
        carbohydratesServing: json["carbohydrates_serving"]?.toDouble(),
        carbohydratesUnit: json["carbohydrates_unit"],
        carbohydratesValue: json["carbohydrates_value"]?.toDouble(),
        cholesterol: json["cholesterol"]?.toDouble(),
        cholesterol100G: json["cholesterol_100g"]?.toDouble(),
        cholesterolServing: json["cholesterol_serving"]?.toDouble(),
        cholesterolUnit: json["cholesterol_unit"],
        cholesterolValue: json["cholesterol_value"]?.toDouble(),
        energy: json["energy"]?.toDouble(),
        energyKcal: json["energy-kcal"]?.toDouble(),
        energyKcal100G: json["energy-kcal_100g"]?.toDouble(),
        energyKcalServing: json["energy-kcal_serving"]?.toDouble(),
        energyKcalValue: json["energy-kcal_value"]?.toDouble(),
        energy100G: json["energy_100g"]?.toDouble(),
        fat: json["fat"]?.toDouble(),
        fat100G: json["fat_100g"]?.toDouble(),
        fatServing: json["fat_serving"]?.toDouble(),
        fatUnit: json["fat_unit"],
        fatValue: json["fat_value"]?.toDouble(),
        fiber: json["fiber"]?.toDouble(),
        fiber100G: json["fiber_100g"]?.toDouble(),
        fiberServing: json["fiber_serving"]?.toDouble(),
        fiberUnit: json["fiber_unit"],
        fiberValue: json["fiber_value"]?.toDouble(),
        fruitsVegetablesNutsEstimateFromIngredients100G:
            json["fruits-vegetables-nuts-estimate-from-ingredients_100g"]
                ?.toDouble(),
        fruitsVegetablesNutsEstimateFromIngredientsServing:
            json["fruits-vegetables-nuts-estimate-from-ingredients_serving"]
                ?.toDouble(),
        iron: json["iron"]?.toDouble(),
        iron100G: json["iron_100g"]?.toDouble(),
        ironServing: json["iron_serving"]?.toDouble(),
        ironUnit: json["iron_unit"],
        ironValue: json["iron_value"]?.toDouble(),
        novaGroup100G: json["nova-group_100g"]?.toDouble(),
        novaGroupServing: json["nova-group_serving"]?.toDouble(),
        nutritionScoreFr: json["nutrition-score-fr"]?.toDouble(),
        nutritionScoreFr100G: json["nutrition-score-fr_100g"]?.toDouble(),
        proteins: json["proteins"]?.toDouble(),
        proteins100G: json["proteins_100g"]?.toDouble(),
        proteinsServing: json["proteins_serving"]?.toDouble(),
        proteinsUnit: json["proteins_unit"],
        proteinsValue: json["proteins_value"]?.toDouble(),
        salt: json["salt"]?.toDouble(),
        salt100G: json["salt_100g"]?.toDouble(),
        saltServing: json["salt_serving"]?.toDouble(),
        saltUnit: json["salt_unit"],
        saltValue: json["salt_value"]?.toDouble(),
        saturatedFat: json["saturated-fat"]?.toDouble(),
        saturatedFat100G: json["saturated-fat_100g"]?.toDouble(),
        saturatedFatServing: json["saturated-fat_serving"]?.toDouble(),
        saturatedFatUnit: json["saturated-fat_unit"],
        saturatedFatValue: json["saturated-fat_value"]?.toDouble(),
        sodium: json["sodium"]?.toDouble(),
        sodium100G: json["sodium_100g"]?.toDouble(),
        sodiumServing: json["sodium_serving"]?.toDouble(),
        sodiumUnit: json["sodium_unit"],
        sodiumValue: json["sodium_value"]?.toDouble(),
        sugars: json["sugars"]?.toDouble(),
        sugars100G: json["sugars_100g"]?.toDouble(),
        sugarsServing: json["sugars_serving"]?.toDouble(),
        sugarsUnit: json["sugars_unit"],
        sugarsValue: json["sugars_value"]?.toDouble(),
        transFat: json["trans-fat"]?.toDouble(),
        transFat100G: json["trans-fat_100g"]?.toDouble(),
        transFatServing: json["trans-fat_serving"]?.toDouble(),
        transFatUnit: json["trans-fat_unit"],
        transFatValue: json["trans-fat_value"]?.toDouble(),
        vitaminA: json["vitamin-a"]?.toDouble(),
        vitaminA100G: json["vitamin-a_100g"]?.toDouble(),
        vitaminAServing: json["vitamin-a_serving"]?.toDouble(),
        vitaminAUnit: json["vitamin-a_unit"],
        vitaminAValue: json["vitamin-a_value"]?.toDouble(),
        vitaminC: json["vitamin-c"]?.toDouble(),
        vitaminC100G: json["vitamin-c_100g"]?.toDouble(),
        vitaminCServing: json["vitamin-c_serving"]?.toDouble(),
        vitaminCUnit: json["vitamin-c_unit"],
        vitaminCValue: json["vitamin-c_value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "calcium": calcium,
        "calcium_100g": calcium100G,
        "calcium_serving": calciumServing,
        "calcium_unit": calciumUnit,
        "calcium_value": calciumValue,
        "carbohydrates": carbohydrates,
        "carbohydrates_100g": carbohydrates100G,
        "carbohydrates_serving": carbohydratesServing,
        "carbohydrates_unit": carbohydratesUnit,
        "carbohydrates_value": carbohydratesValue,
        "cholesterol": cholesterol,
        "cholesterol_100g": cholesterol100G,
        "cholesterol_serving": cholesterolServing,
        "cholesterol_unit": cholesterolUnit,
        "cholesterol_value": cholesterolValue,
        "energy": energy,
        "energy-kcal": energyKcal,
        "energy-kcal_100g": energyKcal100G,
        "energy-kcal_serving": energyKcalServing,
        "energy-kcal_unit": energyKcalUnit,
        "energy-kcal_value": energyKcalValue,
        "energy_100g": energy100G,
        "energy_serving": energyServing,
        "energy_unit": energyUnit,
        "energy_value": energyValue,
        "fat": fat,
        "fat_100g": fat100G,
        "fat_serving": fatServing,
        "fat_unit": fatUnit,
        "fat_value": fatValue,
        "fiber": fiber,
        "fiber_100g": fiber100G,
        "fiber_serving": fiberServing,
        "fiber_unit": fiberUnit,
        "fiber_value": fiberValue,
        "fruits-vegetables-nuts-estimate-from-ingredients_100g":
            fruitsVegetablesNutsEstimateFromIngredients100G,
        "fruits-vegetables-nuts-estimate-from-ingredients_serving":
            fruitsVegetablesNutsEstimateFromIngredientsServing,
        "iron": iron,
        "iron_100g": iron100G,
        "iron_serving": ironServing,
        "iron_unit": ironUnit,
        "iron_value": ironValue,
        "nova-group": novaGroup,
        "nova-group_100g": novaGroup100G,
        "nova-group_serving": novaGroupServing,
        "nutrition-score-fr": nutritionScoreFr,
        "nutrition-score-fr_100g": nutritionScoreFr100G,
        "proteins": proteins,
        "proteins_100g": proteins100G,
        "proteins_serving": proteinsServing,
        "proteins_unit": proteinsUnit,
        "proteins_value": proteinsValue,
        "salt": salt,
        "salt_100g": salt100G,
        "salt_serving": saltServing,
        "salt_unit": saltUnit,
        "salt_value": saltValue,
        "saturated-fat": saturatedFat,
        "saturated-fat_100g": saturatedFat100G,
        "saturated-fat_serving": saturatedFatServing,
        "saturated-fat_unit": saturatedFatUnit,
        "saturated-fat_value": saturatedFatValue,
        "sodium": sodium,
        "sodium_100g": sodium100G,
        "sodium_serving": sodiumServing,
        "sodium_unit": sodiumUnit,
        "sodium_value": sodiumValue,
        "sugars": sugars,
        "sugars_100g": sugars100G,
        "sugars_serving": sugarsServing,
        "sugars_unit": sugarsUnit,
        "sugars_value": sugarsValue,
        "trans-fat": transFat,
        "trans-fat_100g": transFat100G,
        "trans-fat_serving": transFatServing,
        "trans-fat_unit": transFatUnit,
        "trans-fat_value": transFatValue,
        "vitamin-a": vitaminA,
        "vitamin-a_100g": vitaminA100G,
        "vitamin-a_serving": vitaminAServing,
        "vitamin-a_unit": vitaminAUnit,
        "vitamin-a_value": vitaminAValue,
        "vitamin-c": vitaminC,
        "vitamin-c_100g": vitaminC100G,
        "vitamin-c_serving": vitaminCServing,
        "vitamin-c_unit": vitaminCUnit,
        "vitamin-c_value": vitaminCValue,
      };

  @override
  String toString() {
    return 'Nutriments{calcium: $calcium, calcium100G: $calcium100G, calciumServing: $calciumServing, calciumUnit: $calciumUnit, calciumValue: $calciumValue, carbohydrates: $carbohydrates, carbohydrates100G: $carbohydrates100G, carbohydratesServing: $carbohydratesServing, carbohydratesUnit: $carbohydratesUnit, carbohydratesValue: $carbohydratesValue, cholesterol: $cholesterol, cholesterol100G: $cholesterol100G, cholesterolServing: $cholesterolServing, cholesterolUnit: $cholesterolUnit, cholesterolValue: $cholesterolValue, energy: $energy, energyKcal: $energyKcal, energyKcal100G: $energyKcal100G, energyKcalServing: $energyKcalServing, energyKcalUnit: $energyKcalUnit, energyKcalValue: $energyKcalValue, energy100G: $energy100G, energyServing: $energyServing, energyUnit: $energyUnit, energyValue: $energyValue, fat: $fat, fat100G: $fat100G, fatServing: $fatServing, fatUnit: $fatUnit, fatValue: $fatValue, fiber: $fiber, fiber100G: $fiber100G, fiberServing: $fiberServing, fiberUnit: $fiberUnit, fiberValue: $fiberValue, fruitsVegetablesNutsEstimateFromIngredients100G: $fruitsVegetablesNutsEstimateFromIngredients100G, fruitsVegetablesNutsEstimateFromIngredientsServing: $fruitsVegetablesNutsEstimateFromIngredientsServing, iron: $iron, iron100G: $iron100G, ironServing: $ironServing, ironUnit: $ironUnit, ironValue: $ironValue, novaGroup: $novaGroup, novaGroup100G: $novaGroup100G, novaGroupServing: $novaGroupServing, nutritionScoreFr: $nutritionScoreFr, nutritionScoreFr100G: $nutritionScoreFr100G, proteins: $proteins, proteins100G: $proteins100G, proteinsServing: $proteinsServing, proteinsUnit: $proteinsUnit, proteinsValue: $proteinsValue, salt: $salt, salt100G: $salt100G, saltServing: $saltServing, saltUnit: $saltUnit, saltValue: $saltValue, saturatedFat: $saturatedFat, saturatedFat100G: $saturatedFat100G, saturatedFatServing: $saturatedFatServing, saturatedFatUnit: $saturatedFatUnit, saturatedFatValue: $saturatedFatValue, sodium: $sodium, sodium100G: $sodium100G, sodiumServing: $sodiumServing, sodiumUnit: $sodiumUnit, sodiumValue: $sodiumValue, sugars: $sugars, sugars100G: $sugars100G, sugarsServing: $sugarsServing, sugarsUnit: $sugarsUnit, sugarsValue: $sugarsValue, transFat: $transFat, transFat100G: $transFat100G, transFatServing: $transFatServing, transFatUnit: $transFatUnit, transFatValue: $transFatValue, vitaminA: $vitaminA, vitaminA100G: $vitaminA100G, vitaminAServing: $vitaminAServing, vitaminAUnit: $vitaminAUnit, vitaminAValue: $vitaminAValue, vitaminC: $vitaminC, vitaminC100G: $vitaminC100G, vitaminCServing: $vitaminCServing, vitaminCUnit: $vitaminCUnit, vitaminCValue: $vitaminCValue}';
  }
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

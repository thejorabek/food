class FoodModel {
    FoodModel({
        this.name,
        this.cost,
        this.deliveryTime,
        this.rate,
    });

    Name? name;
    double? cost;
    int? deliveryTime;
    double? rate;

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        name: nameValues.map![json["name"]],
        cost: json["cost"].toDouble(),
        deliveryTime: json["delivery_time"],
        rate: json["rate"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "cost": cost,
        "delivery_time": deliveryTime,
        "rate": rate,
    };
}

enum Name { BROCCOLI_MIX_LAB, CHICKEN_VEGGIE }

final nameValues = EnumValues({
    "Broccoli Mix Lab": Name.BROCCOLI_MIX_LAB,
    "Chicken Veggie": Name.CHICKEN_VEGGIE
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap!;
    }
}

class RecipeModel
{
  late String appLabel;
  late String appImageUrl;
  late double appCalories;
  late String appUrl;

  RecipeModel({
    this.appLabel="Label",
    this.appCalories=0.00,
    this.appImageUrl="imageUrl",
    this.appUrl="url"
  });

  factory RecipeModel.fromMap(Map<String, dynamic> recipe)
  {
     return RecipeModel(
       appLabel: recipe["label"],
       appCalories: recipe["calories"],
       appImageUrl: recipe["image"],
       appUrl: recipe["url"],

     );
  }


}
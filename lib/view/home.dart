import 'package:flutter/material.dart';
import 'package:recipe_finder/controller/recipeRepository.dart';
import 'package:recipe_finder/models/recipe.dart';
import 'package:recipe_finder/view/widgets/recipeCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes=[];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text('Food Images')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(
                thumbnailUrl: _recipes[index].images);
          },
        ));
  }
}
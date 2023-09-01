-- Calories
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN calories_two INTEGER;
UPDATE public.fast_food_nutrition_menu SET calories_two = CASE WHEN "Calories" ~ E'^\\d+$' THEN "Calories"::INTEGER END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Calories";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN calories_two TO "Calories";

-- CaloriesFromFat
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN caloriesfromfat_two INTEGER;
UPDATE public.fast_food_nutrition_menu SET caloriesfromfat_two = CASE WHEN "CaloriesFromFat" ~ E'^\\d+$' THEN "CaloriesFromFat"::INTEGER END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "CaloriesFromFat";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN caloriesfromfat_two TO "CaloriesFromFat";

--TotalFat(g)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN totalfat_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET totalfat_two = CASE 
    WHEN "TotalFat(g)" IS NOT NULL AND "TotalFat(g)" ~ E'^\\d+\\.?\\d*$' 
    THEN cast("TotalFat(g)" as FLOAT) END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "TotalFat(g)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN totalfat_two TO "TotalFat(g)";

--SaturatedFat(g)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN saturedfat_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET saturedfat_two = CASE 
    WHEN "SaturatedFat(g)" IS NOT NULL AND "SaturatedFat(g)" ~ E'^\\d+\\.?\\d*$'
    THEN cast("SaturatedFat(g)" as FLOAT) END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "SaturatedFat(g)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN saturedfat_two TO "SaturatedFat(g)";

--TransFat(g)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN transfat_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET transfat_two = CASE 
    WHEN "TransFat(g)" IS NOT NULL AND "TransFat(g)" ~ E'^\\d+\\.?\\d*$'
    THEN cast("TransFat(g)" as FLOAT) END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "TransFat(g)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN transfat_two TO "TransFat(g)";

-- Cholesterol(mg)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN cholesterol_two INTEGER;
UPDATE public.fast_food_nutrition_menu SET cholesterol_two = CASE WHEN "Cholesterol(mg)" ~ E'^\\d+$' THEN "Cholesterol(mg)"::INTEGER END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Cholesterol(mg)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN cholesterol_two TO "Cholesterol(mg)";

--Sodium(mg)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN sodium_two INTEGER;
UPDATE public.fast_food_nutrition_menu SET sodium_two = CASE WHEN "Sodium(mg)" ~ E'^\\d+$' THEN "Sodium(mg)"::INTEGER END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Sodium(mg)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN sodium_two TO "Sodium(mg)";

--Carbs(g)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN carbs_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET carbs_two = CASE 
    WHEN "Carbs(g)" IS NOT NULL AND "Carbs(g)" ~ E'^\\d+\\.?\\d*$' 
    THEN  cast("Carbs(g)" as FLOAT) END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Carbs(g)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN carbs_two TO "Carbs(g)";

--Fiber(g)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN fiber_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET fiber_two = CASE
    WHEN "Fiber(g)" IS NOT NULL AND "Fiber(g)" ~ E'^\\d+\\.?\\d*$' 
    THEN cast("Fiber(g)" as FLOAT) END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Fiber(g)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN fiber_two TO "Fiber(g)";

--Sugars(g)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN sugars_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET sugars_two = CASE 
    WHEN "Sugars(g)" IS NOT NULL AND "Sugars(g)" ~ E'^\\d+\\.?\\d*$'
    THEN cast("Sugars(g)" as FLOAT) END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Sugars(g)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN sugars_two TO "Sugars(g)";

--Protein(g)
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN protein_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET protein_two = CASE 
    WHEN "Protein(g)" IS NOT NULL AND "Protein(g)" ~ E'^\\d+\\.?\\d*$'
    THEN cast("Protein(g)" as FLOAT) 
    END;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Protein(g)";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN protein_two TO "Protein(g)";


--WeightWatchersPnts
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN weight_two FLOAT;
UPDATE public.fast_food_nutrition_menu SET weight_two = CASE 
    WHEN "WeightWatchersPnts" IS NOT NULL AND "WeightWatchersPnts" ~ E'^\\d+\\.?\\d*$' 
    THEN CAST("WeightWatchersPnts" AS FLOAT) 
  END ;
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "WeightWatchersPnts";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN weight_two TO "WeightWatchersPnts";

CREATE TABLE public.fastfoodnutritionmenu AS
	SELECT ffnm.id as id,
  ffnm."Company" as "Company",
  ffnm."Item" as "Item",
  ffnm."Calories" as "Calories",
  ffnm."CaloriesFromFat" as "CaloriesFromFat",
  ffnm."TotalFat(g)" as "TotalFat(g)",
  ffnm."SaturatedFat(g)" as "SaturatedFat(g)",
  ffnm."TransFat(g)" as "TransFat(g)",
  ffnm."Cholesterol(mg)" as "Cholesterol(mg)",
  ffnm."Sodium(mg)" as "Sodium(mg)",
  ffnm."Carbs(g)" as "Carbs(g)",
  ffnm."Fiber(g)" as "Fiber(g)",
  ffnm."Sugars(g)" as "Sugars(g)",
  ffnm."Protein(g)" as "Protein(g)",
  ffnm."WeightWatchersPnts" as "WeightWatchersPnts"
FROM public.fast_food_nutrition_menu ffnm;

-- Recuperar o primary key
ALTER TABLE public.fastfoodnutritionmenu ALTER COLUMN id SET NOT NULL;
ALTER TABLE public.fastfoodnutritionmenu
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
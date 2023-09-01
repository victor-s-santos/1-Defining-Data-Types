ALTER TABLE public.fast_food_nutrition_menu ALTER COLUMN "Calories" TYPE INTEGER;
ALTER TABLE public.fast_food_nutrition_menu ALTER COLUMN "Calories" TYPE INT USING "Calories"::INT;
-- as duas primeiras linhas não irão funcionar, portanto não será tão simples assim mudarmos o tipo de dado

-- não funciona, portanto vou precisar seguir 4 passos:
-- 1- cria uma nova coluna do tipo integer:
ALTER TABLE public.fast_food_nutrition_menu ADD COLUMN calories_two INTEGER;
-- 2- atualizar a coluna com valores convertidos para integer:
UPDATE public.fast_food_nutrition_menu SET calories_two = CASE WHEN "Calories" ~ E'^\\d+$' THEN "Calories"::INTEGER END;
-- 3- remover a coluna antiga, e renomear a coluna nova
ALTER TABLE public.fast_food_nutrition_menu DROP COLUMN "Calories";
ALTER TABLE public.fast_food_nutrition_menu RENAME COLUMN calories_two TO "Calories";

-- 4- para recuperar a posição, vamos criar outra tabela
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


-- 5 recuperar o primary key
ALTER TABLE public.fastfoodnutritionmenu ALTER COLUMN id SET NOT NULL;
ALTER TABLE public.fastfoodnutritionmenu
    ADD CONSTRAINT id_pk PRIMARY KEY (id);

-- Sanity Check
SELECT *
FROM RamenRatings
ORDER BY Stars DESC

-- Find how many 5 star reviews belong to each country of origin
SELECT Country, COUNT(1) AS NumberOf5Stars
FROM RamenRatings
WHERE Stars=5
GROUP BY Country
ORDER BY NumberOf5Stars desc

-- Find which brand produces the most ramen varieties
SELECT Brand, COUNT(1) AS NumberOfRamenVarieties
FROM RamenRatings
GROUP BY Brand
ORDER BY NumberOfRamenVarieties desc

-- Find a relationship between Style and Stars
WITH StyleCTE(Style, AverageRating, NumberOfReviews)
AS
(
SELECT Style, AVG(Stars) AS AverageRating, COUNT(1) AS NumberOfReviews
FROM RamenRatings
WHERE Stars is not null
GROUP BY Style
)
SELECT Style, AverageRating
FROM StyleCTE
Where NumberOfReviews > 50
ORDER BY AverageRating desc

-- Which countries are found in the Top Ten and how many times
SELECT Country, COUNT(1) AS NumberOfTopTens
FROM RamenRatings
Where [Top Ten] is not null
GROUP BY Country
ORDER BY NumberOfTopTens desc

-- Which brands are found in the Top Tens and how many times
SELECT Brand, COUNT(1) AS NumberOfTopTens
FROM RamenRatings
Where [Top Ten] is not null
GROUP BY Brand
ORDER BY NumberOfTopTens desc

-- Creating views to store data for later visualizations
CREATE VIEW FiveStarCountries as
SELECT Country, COUNT(1) AS NumberOf5Stars
FROM RamenRatings
WHERE Stars=5
GROUP BY Country


CREATE VIEW BrandVarieties as
SELECT Brand, COUNT(1) AS NumberOfRamenVarieties
FROM RamenRatings
GROUP BY Brand


CREATE VIEW StylesVsStars as
WITH StyleCTE(Style, AverageRating, NumberOfReviews)
AS
(
SELECT Style, AVG(Stars) AS AverageRating, COUNT(1) AS NumberOfReviews
FROM RamenRatings
WHERE Stars is not null
GROUP BY Style
)
SELECT Style, AverageRating
FROM StyleCTE
Where NumberOfReviews > 50


CREATE VIEW CountriesBelongingToTopTen as
SELECT Country, COUNT(1) AS NumberOfTopTens
FROM RamenRatings
Where [Top Ten] is not null
GROUP BY Country

CREATE VIEW BrandsBelongingToTopTen as
SELECT Brand, COUNT(1) AS NumberOfTopTens
FROM RamenRatings
Where [Top Ten] is not null
GROUP BY Brand

SELECT
    c.first_name AS Prenom,
    c.last_name AS Nom,
    b.nice_score AS Score_Sagesse_2025,
    ci.name AS Ville,
    co.name AS Pays,
    ep.x_m AS Coordonnee_X_m,
    ep.y_m AS Coordonnee_Y_m

FROM
    behavior AS b
INNER JOIN
    children AS c ON b.child_id = c.id
INNER JOIN
    elf_plan AS ep ON b.child_id = ep.child_id
INNER JOIN
    households AS h ON c.household_id = h.id
INNER JOIN
    cities AS ci ON h.city_id = ci.id
INNER JOIN
    countries AS co ON ci.country_code = co.code

WHERE
    b.year = 2025

ORDER BY
    b.nice_score DESC

LIMIT 3;
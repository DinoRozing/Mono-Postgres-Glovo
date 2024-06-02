SELECT * FROM "user";
SELECT * FROM "customer";
SELECT * FROM "deliveryPerson";
SELECT * FROM "restaurant";
SELECT * FROM "menuItem";
SELECT * FROM "restaurantMenuItem";
SELECT * FROM "order";
SELECT * FROM "orderItem";
SELECT * FROM "delivery";
SELECT * FROM "payment";
SELECT * FROM "paymentMethod";

SELECT 
    cu."userId",
    cu."email",
    cu."password",
    cu."address",
    o."Id",
    o."orderDate",
    o."status",
    p."amount",
    p."paymentDate"
FROM 
    "customer" AS cu
JOIN 
    "order" AS o ON cu."userId" = o."customerId"
JOIN 
    "payment" AS p ON o."Id" = p."orderId";
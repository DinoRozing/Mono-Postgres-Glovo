INSERT INTO "user" ("firstName", "lastName", "number")
VALUES
    ('Dino', 'Rozing', '09123012345'),
    ('Michael', 'Brown', '09234023456'),
    ('Emily', 'Martinez', '09345034567'),
    ('David', 'Thompson', '09456045678');

INSERT INTO "customer" ("userId", "email", "password", "address")
VALUES
    (1, 'dino@gmail.com', 'Xr3Pq9sW', 'Trg Petra Preradovića 23, Osijek'),
    (2, 'michael@gmail.com', '7TmN2fE5', 'Trg Ante Starčevića 1, Osijek'),
    (3, 'emily@outlook.com', 'bR8uYp1L', 'Ulica Stjepana Radića 12, Osijek'),
    (4, 'david@hotmail.com', '4KgHd6zF', 'Ivana Gundulića 14, Osijek');

INSERT INTO "deliveryPerson" ("userId", "vehicle")
VALUES
    (1, 'Car'),
    (2, 'Bike'),
    (3, 'Scooter'),
    (4, 'Truck');

INSERT INTO "restaurant" ("name", "address", "number", "customerId")
VALUES
    ('Restaurant Zeleni Val', 'Antuna Gustava Matoša 11, Osijek', '0934567890', 1),
    ('Restaurant Novi Salon', 'Augusta Šenoe 8, Osijek', '0976543210', 2),
    ('Restaurant Rustika', 'Franje Krežme 16, Osijek', '0968101214', 3),
    ('Restaurant Projekt 9', 'Janka Čmelika 5, Osijek', '0991215182', 4);

INSERT INTO "menuItem" ("name", "description", "price", "restaurantId")
VALUES
    ('Hamburger', 'Sočna goveđa pljeskavica prekrivena svježim zeljem, rajčicom i sirom, poslužena u mekanom pecivu.', 10.99, 1),
    ('Margherita Pizza', 'Klasična talijanska pizza prekrivena umakom od rajčice, mozzarellom i svježim listovima bosiljka.', 8.99, 3),
    ('Grilled Salmon', 'Svježa lososova filet začinjena i pečena do savršenstva, poslužena s prilogom od povrća na pari.', 12.99, 2),
    ('Chicken Caesar Salad', 'Krispna salata romaine pomiješana s piletinom, parmezanom i prelivena Caesar preljevom.', 9.99, 4);

INSERT INTO "restaurantMenuItem" ("restaurantId", "menuItemId")
VALUES
    (1, 1),
    (3, 2),
    (2, 3),
    (4, 4);

INSERT INTO "order" ("orderDate", "status", "customerId", "restaurantId")
VALUES
    ('2024-06-02', 'Pending', 1, 1),
    ('2024-06-03', 'Processing', 2, 2),
    ('2024-06-04', 'Delivered', 3, 3),
    ('2024-06-05', 'Canceled', 4, 4);

INSERT INTO "orderItem" ("amount", "price", "orderId", "menuItemId")
VALUES
    (2, 21.98, 1, 1),
    (1, 8.99, 2, 4),
    (3, 38.97, 3, 2),
    (2, 19.98, 4, 3);

INSERT INTO "delivery" ("deliveryDate", "deliveryTime", "status", "orderId", "deliveryPersonId")
VALUES
    ('2024-06-03', '12:00:00', 'Delivered', 1, 1),
    ('2024-06-04', '13:00:00', 'Pending', 2, 2),
    ('2024-06-05', '14:00:00', 'Delivered', 3, 3),
    ('2024-06-06', '15:00:00', 'Pending', 4, 4);

INSERT INTO "payment" ("amount", "paymentDate", "orderId")
VALUES
    (21.98, '2024-06-02', 1),
    (8.99, '2024-06-03', 2),
    (38.97, '2024-06-04', 3),
    (19.98, '2024-06-05', 4);

INSERT INTO "paymentMethod" ("method", "paymentId")
VALUES
    ('Credit Card', 1),
    ('PayPal', 2),
    ('Cash', 3),
    ('Debit Card', 4);
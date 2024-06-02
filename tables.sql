CREATE TABLE "user" (
    Id SERIAL PRIMARY KEY,
    firstName VARCHAR(30) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    number VARCHAR(12)
);

CREATE TABLE customer (
    Id SERIAL PRIMARY KEY,
    userId INT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT "FK_customer_user_userId"
        FOREIGN KEY (userId)
        REFERENCES "user" (Id)
        ON DELETE CASCADE
);

CREATE TABLE deliveryPerson (
    Id SERIAL PRIMARY KEY,
    userId INT NOT NULL,
    vehicle VARCHAR(50) NOT NULL,
    CONSTRAINT "FK_deliveryPerson_user_userId"
        FOREIGN KEY (userId)
        REFERENCES "user" (Id)
        ON DELETE CASCADE
);

CREATE TABLE restaurant (
    Id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    number VARCHAR(12) NOT NULL,
    customerId INT NOT NULL,
    CONSTRAINT "FK_restaurant_customer_customerId"
        FOREIGN KEY (customerId)
        REFERENCES customer (Id)
        ON DELETE CASCADE
);

CREATE TABLE menuItem (
    Id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price FLOAT NOT NULL,
    restaurantId INT NOT NULL,
    CONSTRAINT "FK_menuItem_restaurant_restaurantId"
        FOREIGN KEY (restaurantId)
        REFERENCES restaurant (Id)
        ON DELETE CASCADE
);

CREATE TABLE restaurantMenuItem (
    restaurantId INT NOT NULL,
    menuItemId INT NOT NULL,
    PRIMARY KEY (restaurantId, menuItemId),
    CONSTRAINT "FK_restaurantMenuItem_restaurant_restaurantId"
        FOREIGN KEY (restaurantId)
        REFERENCES restaurant (Id)
        ON DELETE CASCADE,
    CONSTRAINT "FK_restaurantMenuItem_menuItem_menuItemId"
        FOREIGN KEY (menuItemId)
        REFERENCES menuItem (Id)
        ON DELETE CASCADE
);

CREATE TABLE "order" (
    Id SERIAL PRIMARY KEY,
    orderDate DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    customerId INT NOT NULL,
    restaurantId INT NOT NULL,
    CONSTRAINT "FK_order_customer_customerId"
        FOREIGN KEY (customerId)
        REFERENCES customer (Id)
        ON DELETE CASCADE,
    CONSTRAINT "FK_order_restaurant_restaurantId"
        FOREIGN KEY (restaurantId)
        REFERENCES restaurant (Id)
        ON DELETE CASCADE
);

CREATE TABLE orderItem (
    Id SERIAL PRIMARY KEY,
    amount INT NOT NULL,
    price FLOAT NOT NULL,
    orderId INT NOT NULL,
    menuItemId INT NOT NULL,
    CONSTRAINT "FK_orderItem_order_orderId"
        FOREIGN KEY (orderId)
        REFERENCES "order" (Id)
        ON DELETE CASCADE,
    CONSTRAINT "FK_orderItem_menuItem_menuItemId"
        FOREIGN KEY (menuItemId)
        REFERENCES menuItem (Id)
        ON DELETE CASCADE
);

CREATE TABLE delivery (
    Id SERIAL PRIMARY KEY,
    deliveryDate DATE NOT NULL,
    deliveryTime TIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    orderId INT NOT NULL,
    deliveryPersonId INT NOT NULL,
    CONSTRAINT "FK_delivery_order_orderId"
        FOREIGN KEY (orderId)
        REFERENCES "order" (Id)
        ON DELETE CASCADE,
    CONSTRAINT "FK_delivery_deliveryPerson_deliveryPersonId"
        FOREIGN KEY (deliveryPersonId)
        REFERENCES deliveryPerson (Id)
        ON DELETE CASCADE
);

CREATE TABLE payment (
    Id SERIAL PRIMARY KEY,
    amount FLOAT NOT NULL,
    paymentDate DATE NOT NULL,
    orderId INT NOT NULL,
    CONSTRAINT "FK_payment_order_orderId"
        FOREIGN KEY (orderId)
        REFERENCES "order" (Id)
        ON DELETE CASCADE
);

CREATE TABLE paymentMethod (
    Id SERIAL PRIMARY KEY,
    method VARCHAR(50) NOT NULL,
    paymentId INT NOT NULL,
    CONSTRAINT "FK_paymentMethod_payment_paymentId"
        FOREIGN KEY (paymentId)
        REFERENCES payment (Id)
        ON DELETE CASCADE
);
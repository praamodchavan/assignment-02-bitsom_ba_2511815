// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.mongo_queries.insertMany([
  {
    "_id": "ELEC001",
    "category": "Electronics",
    "name": "Samsung 55 inch Smart TV",
    "brand": "Samsung",
    "price": 45999,
    "in_stock": true,
    "specs": {
      "voltage": "220V",
      "warranty_years": 2,
      "resolution": "4K Ultra HD",
      "smart_features": ["Netflix", "YouTube", "Hotstar"]
    },
    "dimensions": {
      "screen_size": "55 inch",
      "weight": "15kg"
    },
    "tags": ["television", "smart tv", "4k", "samsung"]
  },
  {
    "_id": "CLTH001",
    "category": "Clothing",
    "name": "Men's Formal Shirt",
    "brand": "Peter England",
    "price": 1299,
    "in_stock": true,
    "variants": [
      { "size": "S", "color": "White", "quantity": 10 },
      { "size": "M", "color": "White", "quantity": 5 },
      { "size": "L", "color": "Blue",  "quantity": 8 },
      { "size": "XL","color": "Blue",  "quantity": 3 }
    ],
    "fabric": {
      "material": "Cotton",
      "wash_care": "Machine wash cold",
      "transparency": "Non-transparent"
    },
    "tags": ["formal", "shirt", "cotton", "office wear"]
  },
  {
    "_id": "GROC001",
    "category": "Groceries",
    "name": "Aashirvaad Whole Wheat Atta",
    "brand": "Aashirvaad",
    "price": 289,
    "in_stock": true,
    "packaging": {
      "weight": "5kg",
      "type": "Sealed Bag"
    },
    "dates": {
      "manufactured": "2024-11-01",
      "expiry": "2025-10-31"
    },
    "nutritional_info": {
      "calories_per_100g": 340,
      "protein": "12g",
      "carbohydrates": "70g",
      "fiber": "2.5g"
    },
    "tags": ["atta", "wheat", "flour", "staple food"]
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.mongo_queries.find(
  { "category": "Electronics", "price": { $gt: 20000 } }
);


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.mongo_queries.find(
  { "category": "Groceries", "dates.expiry": { $lt: "2025-01-01" } }
);


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.mongo_queries.updateOne(
  { "_id": "ELEC001" },
  { $set: { "discount_percent": 10 } }
);


// OP5: createIndex() — create an index on category field and explain why

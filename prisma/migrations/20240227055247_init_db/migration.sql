-- CreateTable
CREATE TABLE "brand" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "category" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "brand_category" (
    "category_id" INTEGER NOT NULL,
    "brand_id" INTEGER NOT NULL,

    PRIMARY KEY ("category_id", "brand_id"),
    CONSTRAINT "brand_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "brand_category_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "brand" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "market" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order_date" DATETIME NOT NULL,
    "total" INTEGER NOT NULL,
    "market_id" INTEGER NOT NULL,
    CONSTRAINT "order_market_id_fkey" FOREIGN KEY ("market_id") REFERENCES "market" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "weighable" BOOLEAN NOT NULL,
    "category_id" INTEGER NOT NULL,
    "brand_id" INTEGER NOT NULL,
    CONSTRAINT "product_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "product_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "brand" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "item_order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "unit_cost" INTEGER NOT NULL,
    "unit_discount" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "order_id" INTEGER NOT NULL,
    CONSTRAINT "item_order_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "item_order_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "order" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "brand_name_key" ON "brand"("name");

-- CreateIndex
CREATE UNIQUE INDEX "category_name_key" ON "category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "market_name_key" ON "market"("name");

-- CreateIndex
CREATE UNIQUE INDEX "product_name_key" ON "product"("name");

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "email" VARCHAR(300),
  "password_digest" VARCHAR(400),
  "bu_id" int
);

CREATE TABLE "assets" (
  "id" SERIAL PRIMARY KEY,
  "description" VARCHAR(300),
  "category" VARCHAR(300),
  "bu_id" int
);

CREATE TABLE "maintenance_logs" (
  "id" SERIAL PRIMARY KEY,
  "asset_id" int,
  "maintenance_id" int,
  "expense_value" int,
  "user_id" int,
  "date_time" timestamptz
);

CREATE TABLE "maintenance_types" (
  "id" SERIAL PRIMARY KEY,
  "maintenance_name" VARCHAR(300)
);

CREATE TABLE "revenue_types" (
  "id" SERIAL PRIMARY KEY,
  "revenue_name" VARCHAR(300)
);

CREATE TABLE "utilisation_logs" (
  "id" SERIAL PRIMARY KEY,
  "asset_id" int,
  "revenue_id" int,
  "revenue_value" int,
  "user_id" int,
  "date_time" timestamptz
);

CREATE TABLE "business_units" (
  "id" SERIAL PRIMARY KEY,
  "bu_name" VARCHAR(300),
  "division_name" VARCHAR(300)
);

ALTER TABLE "utilisation_logs" ADD FOREIGN KEY ("asset_id") REFERENCES "assets" ("id");

ALTER TABLE "maintenance_logs" ADD FOREIGN KEY ("asset_id") REFERENCES "assets" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("bu_id") REFERENCES "business_units" ("id");

ALTER TABLE "assets" ADD FOREIGN KEY ("bu_id") REFERENCES "business_units" ("id");

ALTER TABLE "maintenance_logs" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "utilisation_logs" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "utilisation_logs" ADD FOREIGN KEY ("revenue_id") REFERENCES "revenue_types" ("id");

ALTER TABLE "maintenance_logs" ADD FOREIGN KEY ("maintenance_id") REFERENCES "maintenance_types" ("id");
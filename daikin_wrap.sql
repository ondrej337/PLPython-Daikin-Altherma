/*
 Source Server Type    : PostgreSQL
 Source Host           : localhost:5432
 Source Schema         : daikin
 Date: 25/01/2023 13:41:04
*/


-- ----------------------------
-- Table structure for daikin_wrap
-- ----------------------------
DROP TABLE IF EXISTS "daikin"."daikin_wrap";
CREATE TABLE "daikin"."daikin_wrap" (
  "adapter_model" varchar(255) COLLATE "pg_catalog"."default",
  "outdoor_temperature" varchar(255) COLLATE "pg_catalog"."default",
  "tank_temperature" varchar(255) COLLATE "pg_catalog"."default",
  "leaving_water_temperature" varchar(255) COLLATE "pg_catalog"."default",
  "power_state" varchar(255) COLLATE "pg_catalog"."default",
  "power_consumption" json,
  "tank_consumption" json,
  "generate_date" timestamp(6) DEFAULT now()
)
;

-- ----------------------------
-- Indexes structure for table daikin_wrap
-- ----------------------------
CREATE INDEX "idx_daikin_wrap_heating" ON "daikin"."daikin_wrap" USING btree (
  (power_consumption ->> 'Electrical'::text) COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_generate_date" ON "daikin"."daikin_wrap" USING btree (
  "generate_date" "pg_catalog"."timestamp_ops" ASC NULLS LAST
);

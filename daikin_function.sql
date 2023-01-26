/*
 Source Server Type    : PostgreSQL
 Source Host           : localhost:5432
 Source Schema         : mycron

 Date: 25/01/2023 13:46:05
*/


-- ----------------------------
-- Function structure for py_daikin
-- ----------------------------
DROP FUNCTION IF EXISTS "mycron"."py_daikin"("ip" varchar);
CREATE OR REPLACE FUNCTION "mycron"."py_daikin"("ip" varchar)
  RETURNS "pg_catalog"."text" AS $BODY$
from daikin_altherma import DaikinAltherma
ad = DaikinAltherma(ip)
try:
  plan = plpy.prepare("INSERT INTO daikin.daikin_wrap(adapter_model,outdoor_temperature,tank_temperature,leaving_water_temperature,power_state,power_consumption,tank_consumption) VALUES ($1,$2,$3,$4,$5,$6,$7)", ["text", "text","text", "text","text","JSON","JSON"])
  plpy.execute(plan, [ad.adapter_model,ad.outdoor_temperature,ad.tank_temperature,ad.leaving_water_temperature,ad.power_state,ad.power_consumption,ad.tank_consumption])
except plpy.SPIError as e:
	return "ERROR, SQLSTATE %s" % e.sqlstate
else:
	return "Row added"
$BODY$
  LANGUAGE plpython3u VOLATILE
  COST 100;

DELIMITER $$
DROP PROCEDURE IF EXISTS `create_index_if_not_exists`$$

CREATE DEFINER=`user`@`%` PROCEDURE `create_index_if_not_exists`(schema_name_vc varchar(50), table_name_vc varchar(50), index_name_vc varchar(50), field_list_vc varchar(200))
SQL SECURITY INVOKER
BEGIN

set @Index_cnt = (
select count(1) cnt
FROM INFORMATION_SCHEMA.STATISTICS
WHERE table_name = table_name_vc
and index_name = index_name_vc
and table_schema = schema_name_vc
);

IF ifnull(@Index_cnt,0) = 0 THEN set @index_sql = concat('Alter table ',table_name_vc,' ADD INDEX ',index_name_vc,'(',field_list_vc,');');

SELECT @index_sql;

PREPARE stmt FROM @index_sql;
EXECUTE stmt;

DEALLOCATE PREPARE stmt;

END IF;

END$$
DELIMITER ;


call create_index_if_not_exists('tsc_live','category','name','name');

call create_index_if_not_exists('tsc_live','constituency','name','name');
call create_index_if_not_exists('tsc_live','constituency','constituency_type_id','constituency_type_id');
call create_index_if_not_exists('tsc_live','constituency','url_id','url_id');

call create_index_if_not_exists('tsc_live','constituency_type','country_id','country_id');
call create_index_if_not_exists('tsc_live','constituency_type','url_id','url_id');

call create_index_if_not_exists('tsc_live','leaflet_category','leaflet_id','leaflet_id');
call create_index_if_not_exists('tsc_live','leaflet_category','category_id','category_id');

call create_index_if_not_exists('tsc_live','leaflet_constituency','leaflet_id','leaflet_id');
call create_index_if_not_exists('tsc_live','leaflet_constituency','constituency_id','constituency_id');

call create_index_if_not_exists('tsc_live','leaflet_image','leaflet_id','leaflet_id');

call create_index_if_not_exists('tsc_live','leaflet_tag','leaflet_id','leaflet_id');
call create_index_if_not_exists('tsc_live','leaflet_tag','tag_id','tag_id');

call create_index_if_not_exists('tsc_live','leaflet_party_attack','leaflet_id','leaflet_id');
call create_index_if_not_exists('tsc_live','leaflet_party_attack','party_id','party_id');

call create_index_if_not_exists('tsc_live','party','country_id','country_id');
call create_index_if_not_exists('tsc_live','party','url_id','url_id');

call create_index_if_not_exists('tsc_live','promise','leaflet_id','leaflet_id');

call create_index_if_not_exists('tsc_live','rate_value','rate_type_id','rate_type_id');

call create_index_if_not_exists('tsc_live','tag','tag_clean','tag_clean');


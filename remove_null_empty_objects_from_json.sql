CREATE OR REPLACE FUNCTION remove_null_empty_objects_from_json(pdata jsonb)
 RETURNS jsonb
 LANGUAGE plpgsql
AS $function$
DECLARE
	v_jsonb jsonb; 
begin

	select jsonb_object_agg(main.pkey, main.pval) into v_jsonb 
	from 
	(
		select 
			t2.pkey,
			case when (t2.ptype='object') then 
				examples.remove_null_empty_objects_from_json(t2.pval) 
			else 
				t2.pval
			end as pval
		from 
			(
				select jsonb_typeof(t1.pval) as ptype, t1.pkey, t1.pval 
				from jsonb_each(jsonb_strip_nulls(pdata)) as t1(pkey, pval) 
			) t2 
		where not(t2.ptype='object' and t2.pval='{}')
	) main;

	return v_jsonb;

END;
$function$
;


{{ config(materialized='table') }}

select 

	id as order_id,
	user_id as customer_id,
	order_date,
	status,
	_etl_loaded_at as _etl_loaded_at

from raw.jaffle_shop.orders
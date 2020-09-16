{{ config(materialized='table') }}

with 

orders as (

	select *
	from {{ ref('stg_orders')}}

),


success_payment as (

	select * 
	from {{ ref('stg_payment') }}
	where status = 'success'

),

order_amount as (

	select 	
		customer_id,
		orders.order_id,
		amount
	from orders
		left join success_payment
			on orders.order_id = success_payment.order_id
)

select * from order_amount

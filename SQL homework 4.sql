select date_diff('day',t.transaction_timestamp,ft.first_transaction) as Advance,
count(t.user_id)
from tangarana.payment_transactions as t
LEFT JOIN
	(
		select 
		distinct user_id,
		first_value(transaction_timestamp) over (partition by user_id order by transaction_timestamp asc
		rows between unbounded preceding and unbounded following) as first_transaction
		from tangarana.payment_transactions
		where transaction_type='payment' and transaction_status='1' and transaction_total IS NOT NULL
		) AS ft
ON t.user_id=ft.user_id
where first_transaction >= '2017-01-01' and first_transaction<= '2017-06-30' and advance >= '0'
group by 1
order by 1


SELECT ord.order_id,
       Concat(cus.first_name, ' ', cus.last_name) AS 'customer_name',
       cus.city,
       cus.state,
       ord.order_date,
       SUM(item.quantity)                         AS 'total_units',
       SUM(item.quantity * item.list_price)       AS 'revenue',
       prod.product_name,
       cat.category_name,
       sto.store_name,
       CONCAT(sta.first_name, ' ', sta.last_name) AS 'sales_rep'
FROM   sales.orders ord
       INNER JOIN sales.customers cus
               ON ord.customer_id = cus.customer_id
       INNER JOIN sales.order_items item
               ON item.order_id = ord.order_id
       INNER JOIN production.products prod
               ON item.product_id = prod.product_id
       INNER JOIN production.categories cat
               ON prod.category_id = cat.category_id
       INNER JOIN sales.stores sto
               ON ord.store_id = sto.store_id
       INNER JOIN sales.staffs sta
               ON ord.staff_id = sta.staff_id
GROUP  BY ord.order_id,
          Concat(cus.first_name, ' ', cus.last_name),
          cus.city,
          cus.state,
          ord.order_date,
          prod.product_name,
          cat.category_name,
          sto.store_name,
          Concat(sta.first_name, ' ', sta.last_name) 
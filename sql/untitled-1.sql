CREATE TABLE order_items (
    order_ıtem_id BEGINT GENERATED ALWAYS ON IDENTITY PRIMARY KEY,
    order_id BEGINT NOT NULL 
    product_id BIGINT NOT NULL  
    quantity INTEGER NOT NULL CHECK (quantity>=0),
    unit_price INTEGER(12,2) NOT NULL CHECK (unit_price>=0) 


    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_order_items_product
        FOREING KEY(product_id)
            REFERENCES products(product_id)

);
-- customer
            product 
    order
    order_items 


SELECT 
    O.order_id,
    c.firt_name ||" "|| c.last_name as customer_name,
    ai.quantitiy * oi.unit_price as line total ,
    SUM(oi.quantity*oi.unit_price) as order_total 
    
FROM orders AS o 
JOIN customers AS c 
    ON o.customer_id=o.customer_id 
JOIN order_items AS oi
    ON o.order_id=oi.order_id 
JOIN product as p 
    ON oi.product_id=oi.prduct_id
ORDER BY o.order_id ,oi.order_item_id ; 



    WİTH order_talbe (SELECT
        order_id,
        
        order_status,
        CASE
            WHEN order_status = 'delivered' THEN 'completed'
            WHEN order_status IN ('paid', 'shipped') THEN 'in_progress'
            WHEN order_status = 'pending' THEN 'waiting'
            WHEN order_status = 'cancelled' THEN 'cancelled'
            END AS order_category
        FROM orders;)

    CTE (Common Table Expresision) 
    WITH order_totals AS 



WHERE o.order_status IN ("paid","shippked","delivere")


KPI (KEY PERFEROMCE INDICATOR ) 
CASE 
    WHEN
    WHEN




SELECT customer_id,
COUNT(*) FILTER (WHERE status = 'completed') AS completed_cnt, SUM(CASE WHEN status = 'cancelled' THEN 1 END) AS cancelled_cnt, -- PostgreSQL, DuckDB
-- her motorda çalışır
SUM(total_amount) FILTER (WHERE order_date >= DATE '2025-05-01') AS may_revenue
FROM orders
GROUP BY customer_id;
revenue =gelir demektir 
SELECT customer_id,
    COUNT(*) FILTER(WHERE status="completed") as completed_cnt,
    SUM(
        CASE WHEN status="called" THEN 1 END 
    ) AS CALLED CNT 
     SUM(total_amount) FILTER (WHERE order_date>=DATE '2025-05-01'  as may_revenue )
    GROUP BY customer_id ; 

GROUP BY city,status  citty tana namı iler tümek 


FROM orders JOIN customers USİNG (customer_id)




SELECT COALASCE(city,"City genel toplam olcua "),COALESCE(status,"Ürünleir genek topamı "),DISTINCT(SUM(total_amount)) as revenue
From orders 3JOIN customers USING (customer_id)
GROUP BY ROLLUP(city,status);


CREATE TABLE customers(
    customer_id PRIMARY KEY GENETADED ALWALYS ,
    name VARCHAR(50) ,
    created_date  DATE , 
    total_amount DECIMAL(10,2)

    );


    DQL SELECT
    DDL  INSERT-UPDATE-DELETE - MERGE 
    DML INSERT -DELETE-MERGE
    TCL BEGIN COMMİT ROLLBACK SAVEPOİNT 
    DCL GRANK REVOKE 

COUNT ( DISTINCT oorder_id) AS TEKRAR ETMEDE SAYILAR BULA FROM ordes  o 



SELECT order_id,
    COUNT(*) FILTER (WHERE status="completed") AS completed_cnt,
    SUM(CASE WHERE status ="canceled " THEN 1 END  ) AS canselled_cnt,
    SUM(total_amount) FILTER (WHERE order_data >DATE '2025-04-11') AS may_revenue
    From orders ADD




SELECT city, status, SUM(total_amount) AS revenue,
FROM orders JOIN customers USING (CUSTOMER_İ)

GROUP  BY ROLLUP(city,status)



FROM orders JOIN customers USING(order_id) Ortak ile birleştibili im 



customer_id	status
1	delivered
1	pending
1	delivered
1	shipped

STRING_AGG(DISTINCT status ,',' ORDER BY status ) AS statuses ADD

---------------------
customer_id    statuess ADD
1              delivered,pending,shippped

order_id	order_date
105	    2026-10-03
101	    2026-10-01
108	    2026-10-05

SELECT firsname ,

    ARRAY_AGG(order_id ORDER By order_date )  AS order_ids 
    FROM orders JOIN custoer USING(customer_id ) --En hızlı şekilde birlieştimeli olduk 
    order_id    order_ids
    1   101,105,108.   


    STRING_AGG(status,","ORDER BY status ) as studens 
    ARRAY_AGG(order_id ORDER BY order_date )

--Create table içerine yazılmak zorunda 
    CONSTRAINT fk_order_items_product
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE CASCADE :,
    ON DELETE CASCODE : -Orders silindeğinde order_items bilgiler silmesi sağlamktadı.ADD




 

 CUSTOMERS
|
| customer_id
v
ORDERS
|
| order_id
v
ORDER_ITEMS
|
| product_id
v
PRODUCTS



cl

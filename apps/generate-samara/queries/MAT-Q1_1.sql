SELECT 
    C.C_CUSTKEY,
	C.C_NAME,
	C.C_REGION,
	R.REGION_PK
FROM 
    LINEORDER L, 
    DATE D, 
    CUSTOMER C, 
    REGION R
WHERE 
    L.LO_ORDERDATE = D.D_DATEKEY AND 
    L.LO_CUSTKEY = C.C_CUSTKEY AND 
	L.LO_DISCOUNT BETWEEN 1 AND 3 AND 
    L.LO_QUANTITY < 25 AND 
	D.D_YEAR = 1993;
    
    
	
	
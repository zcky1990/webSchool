SET @nisn = '%s';

select * from (select (case when (gl.besaran - gdn.total_bayar) is null then 0
	       else (gl.besaran - gdn.total_bayar) end
	       ) as gedung  from (
		select gedung.gedung_list_id, 
		(case when sum(gedung.bayar) is nULL then 0 
	    ELSE  sum(gedung.bayar)
	     END
	)as total_bayar from gedung where nisn = @nisn)gdn
	INNER JOIN (SELECT gedung_list.id, (CASE 
                                        WHEN gedung_list.besaran IS NULL THEN 0
                                       ELSE gedung_list.besaran END)AS besaran  FROM gedung_list) gl ON gl.id = gdn.gedung_list_id )angsuran_gedung		     
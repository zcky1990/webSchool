SET @nisn = '100000';
SET @startSemester = 201701;
SET @endSemester = 201803;
SET @kelas = 1;

select * FROM 
		(select (total_angsuran-total_bayar) as spp  from (select 
			(CASE
			    WHEN total_angsuran is null THEN 0
			    ELSE total_angsuran
			END)AS total_angsuran from (select sum(besaran)as total_angsuran 
			from spp_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
			JOIN                                          
			(select * from(select (
			    CASE
			    	WHEN total_bayar is null THEN 0
			    	ELSE total_bayar
				END)AS total_bayar 
			    FROM(SELECT sum(bayar)as total_bayar FROM spp 
			         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_spp
 JOIN
		(select (total_angsuran-total_bayar) as mpls  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from mpls_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas )totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM mpls 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_mpls 
 JOIN
		(select (total_angsuran-total_bayar) as seragam  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from seragam_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM seragam 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_seragam
 JOIN
	(select (total_angsuran-total_bayar) as praktek  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from praktek_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM praktek 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_praktek
 JOIN
	(select (total_angsuran-total_bayar) as lks  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from lks_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM lks 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_lks	
 JOIN
	(select (total_angsuran-total_bayar) as lks_produktif  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from lks_produktif_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM lks_produktif 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_lks_produktif
 JOIN
	(select (total_angsuran-total_bayar) as kegiatan  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from kegiatan_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM kegiatan 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_kegiatan		
 JOIN
	(select (total_angsuran-total_bayar) as kartu_pelajar  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from kartu_pelajar_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM kartu_pelajar 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_kartu_pelajar  
JOIN
	(select (total_angsuran-total_bayar) as qurban  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from qurban_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM qurban 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_qurban      	 
JOIN
	(select (total_angsuran-total_bayar) as ldks  from (select 
		(CASE
		    WHEN total_angsuran is null THEN 0
		    ELSE total_angsuran
		END)AS total_angsuran from (select sum(besaran)as total_angsuran 
		from ldks_list where concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and kelas = @kelas)totalAngsuran)ta
		JOIN                                          
		(select * from(select (
		    CASE
		    	WHEN total_bayar is null THEN 0
		    	ELSE total_bayar
			END)AS total_bayar 
		    FROM(SELECT sum(bayar)as total_bayar FROM ldks 
		         WHERE concat(tahun, lpad(bulan, 2, '0')) between @startSemester and @endSemester and nisn = @nisn)total_bayar_angsuran)asd)angs)angsuran_ldks   
JOIN
	(select (case when (gl.besaran - gdn.total_bayar) is null then 0
	       else (gl.besaran - gdn.total_bayar) end
	       ) as gedung  from (
		select gedung.gedung_list_id, 
		(case when sum(gedung.bayar) is nULL then 0 
	    ELSE  sum(gedung.bayar)
	     END
	)as total_bayar from gedung where nisn = @nisn)gdn
	LEFT JOIN (SELECT gedung_list.id, (CASE 
                                        WHEN gedung_list.besaran IS NULL THEN 0
                                       ELSE gedung_list.besaran END)AS besaran  FROM gedung_list) gl ON gl.id = gdn.gedung_list_id  )angsuran_gedung		          



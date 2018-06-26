SELECT description, (angsuran_ujian.besaran - angsuran_ujian.bayar ) as sisa 
from (SELECT * FROM ujian_list ul INNER JOIN (SELECT nisn,ujian_id,
	(case 
     	when bayar is null then 0
     	else bayar
    end)as bayar
FROM  ujian WHERE ujian.nisn = '%s'
and concat(ujian.tahun, lpad(ujian.bulan, 2, '0')) between %d and %d)bu
ON ul.id = bu.ujian_id)angsuran_ujian
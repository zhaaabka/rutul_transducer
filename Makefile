.DEFAULT_GOAL := rut_num.generator.hfst

rut_phon.twol.hfst: rut_phon.twol
	hfst-twolc rut_phon.twol -o rut_phon.twol.hfst
rut_num.lexd.hfst: rut_num.lexd
	lexd rut_num.lexd | hfst-txt2fst -o rut_num.lexd.hfst
rut_num.generator.hfst: rut_num.lexd.hfst rut_phon.twol.hfst
	hfst-compose-intersect rut_num.lexd.hfst rut_phon.twol.hfst -o rut_num.generator.hfst
	
#Запуск: hfst-fst2strings rut_num.generator.hfst
<<<<<<< HEAD
run:
	@gcc -O2 -S  bucketsort.c -lpapi 
	@gcc -O2 -g  bucketsort0.c -lpapi -o bucketsort0
	@gcc -O2 -g  bucketsortquick.c -lpapi -o bucketsortquick
	@gcc -O2 -g  bucketsortradix.c -lpapi -o bucketsortradix
	@gcc -O2 -g  bucketsort.c -lpapi
	export PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC"

py:
	python papi_hl_output_writer.py --notation=derived --type=summary --source papi_hl_output

clean:
	@rm ./a.out
=======
run:
	@gcc -O2 -S  -I/${PAPI_DIR}/include -L/${PAPI_DIR}/lib bucketsort.c -lpapi 
	@gcc -O2 -g  -I/${PAPI_DIR}/include -L/${PAPI_DIR}/lib bucketsort0.c -lpapi -o bucketsort0
	@gcc -O2 -g   -I/${PAPI_DIR}/include -L/${PAPI_DIR}/lib bucketsortquick.c -lpapi -o bucketsortquick
	@gcc -O2 -g   -I/${PAPI_DIR}/include -L/${PAPI_DIR}/lib bucketsort.c -lpapi
	@export PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC"
	
	

clean:
	@rm ./a.out
	@rm ./bucketsort0
	@rm ./bucketsortquick
>>>>>>> d9d0b4dc51a9feca17f7d13428fc02aae82e871f
	
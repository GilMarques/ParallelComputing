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
	
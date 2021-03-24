run:
	@gcc -O2 -S  bucketsort.c -lpapi 
	@gcc -O2 -g  bucketsort0.c -lpapi -o bucketsort0
	@gcc -O2 -g  bucketsortquick.c -lpapi -o bucketsortquick
	@gcc -O2 -g  bucketsort.c -lpapi
	export PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC"
	
	

clean:
	@rm ./a.out
	
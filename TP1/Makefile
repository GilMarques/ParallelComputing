run:
	@gcc -O2 -S  bucketsortradix.c -lpapi 
	@gcc -O2 -S  bucketsortinsertion.c -lpapi 
	@gcc -O2 -g  bucketsort0.c -lpapi -o bucketsort0
	@gcc -O2 -g  bucketsortquick.c -lpapi -o bucketsortquick
	@gcc -O2 -g  -mavx2  bucketsortradix.c -lpapi -o bucketsortradix
	@gcc -O2 -g  bucketsortinsertion.c -lpapi -o bucketsortinsertion
	@gcc -O2 -g  bucketsort.c -lpapi -o bucketsort
	export PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC"

py:
	python papi_hl_output_writer.py --notation=derived --type=summary --source papi_hl_output

clean:
	@rm  bucketsort
	@rm  bucketsort0
	@rm  bucketsortquick
	@rm  bucketsortradix
	@rm  bucketsortinsertion
	
perform:
	perf record ./bucketsortradix 1000000
	perf annotate
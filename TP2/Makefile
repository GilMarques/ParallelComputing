run:
	@gcc -O2 -g  quick.c -lpapi -o quick
	@gcc -O2 -g  insert.c -lpapi -o insert
	export PAPI_EVENTS="PAPI_TOT_INS,PAPI_TOT_CYC"

py:
	python papi_hl_output_writer.py --notation=derived --type=summary --source papi_hl_output

clean:
	@rm  quick
	@rm	insert


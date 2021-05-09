run:
	@gcc -O2 -g  quick.c -std=c99  -o quick
	@gcc -O2 -g  insert.c -std=c99  -o insert
	@gcc -O2 -g  quickparallel.c -std=c99 -fopenmp -o quickparallel
	@gcc -O2 -g  insertparallel.c -std=c99 -fopenmp -o insertparallel
	

py:
	python papi_hl_output_writer.py --notation=derived --type=summary --source papi_hl_output

clean:
	@rm  quick
	@rm	insert


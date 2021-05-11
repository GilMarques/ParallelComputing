run:
	@gcc -O2 -g  insertsequential.c -std=c99  -o insertsequential
	@gcc -O2 -g  insertparallel.c -std=c99 -fopenmp -o insertparallel
	@gcc -O2 -g  insertparallel2.c -std=c99 -fopenmp -o insertparallel2
	@gcc -O2 -g  insertparallel3.c -std=c99 -fopenmp -o insertparallel3
	@gcc -O2 -g  insertparallel4.c -std=c99 -fopenmp -o insertparallel4
	
	

py:
	python papi_hl_output_writer.py --notation=derived --type=summary --source papi_hl_output

clean:
	@rm	insertsequential
	@rm	insertparallel
	@rm	insertparallel2
	@rm	insertparallel3
	@rm	insertparallel4



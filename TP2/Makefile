run:
	@gcc -O2 -g  quicksequential.c -std=c99  -o quicksequential
	@gcc -O2 -g  insertsequential.c -std=c99  -o insertsequential
	@gcc -O2 -g  quickparallel.c -std=c99 -fopenmp -o quickparallel
	@gcc -O2 -g  insertparallel.c -std=c99 -fopenmp -o insertparallel
	@gcc -O2 -g  insertparallel2.c -std=c99 -fopenmp -o insertparallel2
	@gcc -O2 -g  quickparallel2.c -std=c99 -fopenmp -o quickparallel2
	

py:
	python papi_hl_output_writer.py --notation=derived --type=summary --source papi_hl_output

clean:
	@rm quicksequential
	@rm	insertsequential
	@rm	quickparallel
	@rm	insertparallel
	@rm	insertparallel2
	@rm	quickparallel2


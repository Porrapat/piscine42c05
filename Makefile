.DEFAULT_GOAL := all

EX00 = ft_iterative_factorial
EX01 = ft_recursive_factorial
EX02 = ft_iterative_power
EX03 = ft_recursive_power
EX04 = ft_fibonacci
EX05 = ft_sqrt
EX06 = ft_is_prime
EX07 = ft_find_next_prime
EX08 = ft_ten_queens_puzzle

norminette:
	-norminette ./ex00/${EX00}.c
	-norminette ./ex01/${EX01}.c
	-norminette ./ex02/${EX02}.c
	-norminette ./ex03/${EX03}.c
	-norminette ./ex04/${EX04}.c
	-norminette ./ex05/${EX05}.c
	-norminette ./ex06/${EX06}.c
	-norminette ./ex07/${EX07}.c
	-norminette ./ex08/${EX08}.c

compile: norminette
	-gcc ./ex00/${EX00}.c test_ex00_${EX00}.c -Wall -Werror -Wextra -o test_ex00_${EX00}
	-gcc ./ex01/${EX01}.c test_ex01_${EX01}.c -Wall -Werror -Wextra -o test_ex01_${EX01}
	-gcc ./ex02/${EX02}.c test_ex02_${EX02}.c -Wall -Werror -Wextra -o test_ex02_${EX02}
	-gcc ./ex03/${EX03}.c test_ex03_${EX03}.c -Wall -Werror -Wextra -o test_ex03_${EX03}
	-gcc ./ex04/${EX04}.c test_ex04_${EX04}.c -Wall -Werror -Wextra -o test_ex04_${EX04}
	-gcc ./ex05/${EX05}.c test_ex05_${EX05}.c -Wall -Werror -Wextra -o test_ex05_${EX05}
	-gcc ./ex06/${EX06}.c test_ex06_${EX06}.c -Wall -Werror -Wextra -lm -o test_ex06_${EX06}
	-gcc ./ex07/${EX07}.c test_ex07_${EX07}.c -Wall -Werror -Wextra -o test_ex07_${EX07}
	-gcc ./ex08/${EX08}.c test_ex08_${EX08}.c -Wall -Werror -Wextra -o test_ex08_${EX08}

build-sample: compile
	-./test_ex00_${EX00} > result_sample_ex00_${EX00}.txt
	-./test_ex01_${EX01} > result_sample_ex01_${EX01}.txt
	-./test_ex02_${EX02} > result_sample_ex02_${EX02}.txt
	-./test_ex03_${EX03} > result_sample_ex03_${EX03}.txt
	-./test_ex04_${EX04} > result_sample_ex04_${EX04}.txt
	-./test_ex05_${EX05} > result_sample_ex05_${EX05}.txt
	-./test_ex06_${EX06} > result_sample_ex06_${EX06}.txt
	-./test_ex07_${EX07} > result_sample_ex07_${EX07}.txt
	-./test_ex08_${EX08} > result_sample_ex08_${EX08}.txt

run:	compile
	-./test_ex00_${EX00} > result_current_ex00_${EX00}.txt
	-./test_ex01_${EX01} > result_current_ex01_${EX01}.txt
	-./test_ex02_${EX02} > result_current_ex02_${EX02}.txt
	-./test_ex03_${EX03} > result_current_ex03_${EX03}.txt
	-./test_ex04_${EX04} > result_current_ex04_${EX04}.txt
	-./test_ex05_${EX05} > result_current_ex05_${EX05}.txt
	-./test_ex06_${EX06} > result_current_ex06_${EX06}.txt
	-./test_ex07_${EX07} > result_current_ex07_${EX07}.txt
	-./test_ex08_${EX08} > result_current_ex08_${EX08}.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex00_${EX00}.txt result_sample_ex00_${EX00}.txt
	-diff result_current_ex01_${EX01}.txt result_sample_ex01_${EX01}.txt
	-diff result_current_ex02_${EX02}.txt result_sample_ex02_${EX02}.txt
	-diff result_current_ex03_${EX03}.txt result_sample_ex03_${EX03}.txt
	-diff result_current_ex04_${EX04}.txt result_sample_ex04_${EX04}.txt
	-diff result_current_ex05_${EX05}.txt result_sample_ex05_${EX05}.txt
	-diff result_current_ex06_${EX06}.txt result_sample_ex06_${EX06}.txt
	-diff result_current_ex07_${EX07}.txt result_sample_ex07_${EX07}.txt
	-diff result_current_ex08_${EX08}.txt result_sample_ex08_${EX08}.txt

clean:
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex00_${EX00}
	-rm test_ex01_${EX01}
	-rm test_ex02_${EX02}
	-rm test_ex03_${EX03}
	-rm test_ex04_${EX04}
	-rm test_ex05_${EX05}
	-rm test_ex06_${EX06}
	-rm test_ex07_${EX07}
	-rm test_ex08_${EX08}

clean-sample:
	-rm -rf result_sample_ex*.txt

clean-before-push-with-sample: clean
	-git add .
	-git commit -m "Build Sample Complete"
	-git push origin master

.PHONY: norminette compile build-sample  run all test clean clean-sample clean-before-push-with-sample

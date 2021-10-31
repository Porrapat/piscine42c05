.DEFAULT_GOAL := all

EX00 = ft_iterative_factorial
EX01 = ft_recursive_factorial
EX02 = ft_iterative_power
EX03 = ft_recursive_power
EX04 =
EX05 =
EX06 =
EX07 =
EX08 =

norminette:
	-norminette ./ex00/${EX00}.c
	-norminette ./ex01/${EX01}.c
	-norminette ./ex02/${EX02}.c
	-norminette ./ex03/${EX03}.c
	-norminette ./ex04/ft_fibonacci.c
	-norminette ./ex05/ft_sqrt.c
	-norminette ./ex06/ft_is_prime.c
	-norminette ./ex07/ft_find_next_prime.c
	-norminette ./ex08/ft_ten_queens_puzzle.c

compile: norminette
	-gcc ./ex00/${EX00}.c test_ex00_${EX00}.c -Wall -Werror -Wextra -o test_ex00_${EX00}
	-gcc ./ex01/${EX01}.c test_ex01_${EX01}.c -Wall -Werror -Wextra -o test_ex01_${EX01}
	-gcc ./ex02/${EX02}.c test_ex02_${EX02}.c -Wall -Werror -Wextra -o test_ex02_${EX02}
	-gcc ./ex03/${EX03}.c test_ex03_${EX03}.c -Wall -Werror -Wextra -o test_ex03_${EX03}
	-gcc ./ex04/ft_fibonacci.c test_ex04_ft_fibonacci.c -Wall -Werror -Wextra -o test_ex04_ft_fibonacci
	-gcc ./ex05/ft_sqrt.c test_ex05_ft_sqrt.c -Wall -Werror -Wextra -o test_ex05_ft_sqrt
	-gcc ./ex06/ft_is_prime.c test_ex06_ft_is_prime.c -Wall -Werror -Wextra -lm -o test_ex06_ft_is_prime
	-gcc ./ex07/ft_find_next_prime.c test_ex07_ft_find_next_prime.c -Wall -Werror -Wextra -o test_ex07_ft_find_next_prime
	-gcc ./ex08/ft_ten_queens_puzzle.c test_ex08_ft_ten_queens_puzzle.c -Wall -Werror -Wextra -o test_ex08_ft_ten_queens_puzzle

build-sample: compile
	-./test_ex00_${EX00} > result_sample_ex00_${EX00}.txt
	-./test_ex01_${EX01} > result_sample_ex01_${EX01}.txt
	-./test_ex02_${EX02} > result_sample_ex02_${EX02}.txt
	-./test_ex03_${EX03} > result_sample_ex03_${EX03}.txt
	-./test_ex04_ft_fibonacci > result_sample_ex04_ft_fibonacci.txt
	-./test_ex05_ft_sqrt > result_sample_ex05_ft_sqrt.txt
	-./test_ex06_ft_is_prime > result_sample_ex06_ft_is_prime.txt
	-./test_ex07_ft_find_next_prime > result_sample_ex07_ft_find_next_prime.txt
	-./test_ex08_ft_ten_queens_puzzle > result_sample_ex08_ft_ten_queens_puzzle.txt

run:	compile
	-./test_ex00_${EX00} > result_current_ex00_${EX00}.txt
	-./test_ex01_${EX01} > result_current_ex01_${EX01}.txt
	-./test_ex02_${EX02} > result_current_ex02_${EX02}.txt
	-./test_ex03_${EX03} > result_current_ex03_${EX03}.txt
	-./test_ex04_ft_fibonacci > result_current_ex04_ft_fibonacci.txt
	-./test_ex05_ft_sqrt > result_current_ex05_ft_sqrt.txt
	-./test_ex06_ft_is_prime > result_current_ex06_ft_is_prime.txt
	-./test_ex07_ft_find_next_prime > result_current_ex07_ft_find_next_prime.txt
	-./test_ex08_ft_ten_queens_puzzle > result_current_ex08_ft_ten_queens_puzzle.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex00_${EX00}.txt result_sample_ex00_${EX00}.txt
	-diff result_current_ex01_${EX01}.txt result_sample_ex01_${EX01}.txt
	-diff result_current_ex02_${EX02}.txt result_sample_ex02_${EX02}.txt
	-diff result_current_ex03_${EX03}.txt result_sample_ex03_${EX03}.txt
	-diff result_current_ex04_ft_fibonacci.txt result_sample_ex04_ft_fibonacci.txt
	-diff result_current_ex05_ft_sqrt.txt result_sample_ex05_ft_sqrt.txt
	-diff result_current_ex06_ft_is_prime.txt result_sample_ex06_ft_is_prime.txt
	-diff result_current_ex07_ft_find_next_prime.txt result_sample_ex07_ft_find_next_prime.txt
	-diff result_current_ex08_ft_ten_queens_puzzle.txt result_sample_ex08_ft_ten_queens_puzzle.txt

clean:
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex00_${EX00}
	-rm test_ex01_${EX01}
	-rm test_ex02_${EX02}
	-rm test_ex03_${EX03}
	-rm test_ex04_ft_fibonacci
	-rm test_ex05_ft_sqrt
	-rm test_ex06_ft_is_prime
	-rm test_ex07_ft_find_next_prime
	-rm test_ex08_ft_ten_queens_puzzle

clean-sample:
	-rm -rf result_sample_ex*.txt

clean-before-push-with-sample: clean
	-git add .
	-git commit -m "Build Sample Complete"
	-git push origin master

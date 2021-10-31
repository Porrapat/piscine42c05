.DEFAULT_GOAL := all
norminette:
	-norminette ./ex00/ft_iterative_factorial.c
	-norminette ./ex01/ft_recursive_factorial.c
	-norminette ./ex02/ft_iterative_power.c
	-norminette ./ex03/ft_recursive_power.c
	-norminette ./ex04/ft_fibonacci.c
	-norminette ./ex05/ft_sqrt.c
	-norminette ./ex06/ft_is_prime.c
	-norminette ./ex07/ft_find_next_prime.c
	-norminette ./ex08/ft_ten_queens_puzzle.c

compile: norminette
	-gcc ./ex00/ft_iterative_factorial.c test_ex00_ft_iterative_factorial.c -Wall -Werror -Wextra -o test_ex00_ft_iterative_factorial
	-gcc ./ex01/ft_recursive_factorial.c test_ex01_ft_recursive_factorial.c -Wall -Werror -Wextra -o test_ex01_ft_recursive_factorial
	-gcc ./ex02/ft_iterative_power.c test_ex02_ft_iterative_power.c -Wall -Werror -Wextra -o test_ex02_ft_iterative_power
	-gcc ./ex03/ft_recursive_power.c test_ex03_ft_recursive_power.c -Wall -Werror -Wextra -o test_ex03_ft_recursive_power
	-gcc ./ex04/ft_fibonacci.c test_ex04_ft_fibonacci.c -Wall -Werror -Wextra -o test_ex04_ft_fibonacci
	-gcc ./ex05/ft_sqrt.c test_ex05_ft_sqrt.c -Wall -Werror -Wextra -o test_ex05_ft_sqrt
	-gcc ./ex06/ft_is_prime.c test_ex06_ft_is_prime.c -Wall -Werror -Wextra -o test_ex06_ft_is_prime
	-gcc ./ex07/ft_find_next_prime.c test_ex07_ft_find_next_prime.c -Wall -Werror -Wextra -o test_ex07_ft_find_next_prime
	-gcc ./ex08/ft_ten_queens_puzzle.c test_ex08_ft_ten_queens_puzzle.c -Wall -Werror -Wextra -o test_ex08_ft_ten_queens_puzzle

build-sample: compile
	-./test_ex00_ft_iterative_factorial > result_sample_ex00_ft_iterative_factorial.txt
	-./test_ex01_ft_recursive_factorial > result_sample_ex01_ft_recursive_factorial.txt
	-./test_ex02_ft_iterative_power > result_sample_ex02_ft_iterative_power.txt
	-./test_ex03_ft_recursive_power > result_sample_ex03_ft_recursive_power.txt
	-./test_ex04_ft_fibonacci > result_sample_ex04_ft_fibonacci.txt
	-./test_ex05_ft_sqrt > result_sample_ex05_ft_sqrt.txt
	-./test_ex06_ft_is_prime > result_sample_ex06_ft_is_prime.txt
	-./test_ex07_ft_find_next_prime > result_sample_ex07_ft_find_next_prime.txt
	-./test_ex08_ft_ten_queens_puzzle > result_sample_ex08_ft_ten_queens_puzzle.txt

run:	compile
	-./test_ex00_ft_iterative_factorial > result_current_ex00_ft_iterative_factorial.txt
	-./test_ex01_ft_recursive_factorial > result_current_ex01_ft_recursive_factorial.txt
	-./test_ex02_ft_iterative_power > result_current_ex02_ft_iterative_power.txt
	-./test_ex03_ft_recursive_power > result_current_ex03_ft_recursive_power.txt
	-./test_ex04_ft_fibonacci > result_current_ex04_ft_fibonacci.txt
	-./test_ex05_ft_sqrt > result_current_ex05_ft_sqrt.txt
	-./test_ex06_ft_is_prime > result_current_ex06_ft_is_prime.txt
	-./test_ex07_ft_find_next_prime > result_current_ex07_ft_find_next_prime.txt
	-./test_ex08_ft_ten_queens_puzzle > result_current_ex08_ft_ten_queens_puzzle.txt

all:	norminette	compile run

test:	all
	-diff result_current_ex00_ft_iterative_factorial.txt result_sample_ex00_ft_iterative_factorial.txt
	-diff result_current_ex01_ft_recursive_factorial.txt result_sample_ex01_ft_recursive_factorial.txt
	-diff result_current_ex02_ft_iterative_power.txt result_sample_ex02_ft_iterative_power.txt
	-diff result_current_ex03_ft_recursive_power.txt result_sample_ex03_ft_recursive_power.txt
	-diff result_current_ex04_ft_fibonacci.txt result_sample_ex04_ft_fibonacci.txt
	-diff result_current_ex05_ft_sqrt.txt result_sample_ex05_ft_sqrt.txt
	-diff result_current_ex06_ft_is_prime.txt result_sample_ex06_ft_is_prime.txt
	-diff result_current_ex07_ft_find_next_prime.txt result_sample_ex07_ft_find_next_prime.txt
	-diff result_current_ex08_ft_ten_queens_puzzle.txt result_sample_ex08_ft_ten_queens_puzzle.txt

clean:
	-rm -rf */*.out
	-rm -rf result_current_ex*.txt
	-rm test_ex00_ft_iterative_factorial
	-rm test_ex01_ft_recursive_factorial
	-rm test_ex02_ft_iterative_power
	-rm test_ex03_ft_recursive_power
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

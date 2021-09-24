import random 
import sys 


FILE_NAME = "file.txt"


def main(args):
	assert len(args) >= 2, "Too few parameters"
	assert args[1].isdigit(), "Invalid param type"

	count_of_rows = int(args[1])

	with open(FILE_NAME, "w", encoding="utf-8") as file:
		for i in range(count_of_rows-1):
			print(random.random(), end="\n", file=file)
		print(random.random(), end="", file=file)

if __name__ == "__main__":
	main(sys.argv)
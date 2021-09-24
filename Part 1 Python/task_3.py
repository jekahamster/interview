import sys 


FILE_NAME = "file.txt"


def main(args):
	assert len(args) >= 2, "Too few parameters"
	assert args[1].isdigit(), "Invalid param type"

	numbers_from_file = []

	count_of_rows = int(args[1])


	with open(FILE_NAME, "r", encoding="UTF-8") as file:
		rows = file.readlines()
		for row in rows[-count_of_rows:]:
			number = float(row.strip().replace("\n", ""))
			numbers_from_file.append(number)


	print(numbers_from_file)

if __name__ == "__main__":
	main(sys.argv)
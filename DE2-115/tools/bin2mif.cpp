#include <iostream>
#include <iomanip>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

using namespace std;

int main(int argc, char * argv[])
{
	int size;
	int width = 8;
	int offset = 0;
	int skip = 0;
	if (argc >= 7) {
		offset = atoi(argv[5]);
		skip = atoi(argv[6]);
	}
	if (argc >= 6) {
		offset = atoi(argv[5]);
	}
	if (argc >= 5) {
		width = atoi(argv[4]);
	}
	if (argc >= 4) {
		size = atoi(argv[3]);
	}
	else if (argc == 3) {
		size = 256; // Default GB BROM Size
	}
	else {
		cout << "Usage: bin2mif <input.bin> <output.mif> [size] [width] [offset] [skip]" << endl;
		return -1;
	}

	ifstream inFile(argv[1], ios::in | ios::binary);
	ofstream outFile(argv[2], ios::out | ios::trunc);

	char * buffer;
	int in_size = offset + size * (skip + 1);

	buffer = (char *)malloc(in_size);
	inFile.read(buffer, in_size);
	int rd_ptr = offset;

	outFile << "WIDTH=8;" << endl;
	outFile << "DEPTH=65536;" << endl;
	outFile << "" << endl;
	outFile << "ADDRESS_RADIX=HEX;" << endl;
	outFile << "DATA_RADIX=HEX;" << endl;
	outFile << "CONTENT BEGIN" << endl;
	for (int i = 0; i < size; i++) {
		
		outFile << hex << uppercase << i;
		outFile << ":  " ;
		outFile << hex << uppercase << setw(2) << setfill('0') << int((uint8_t)buffer[rd_ptr]);
		outFile << ";";

		rd_ptr += (skip + 1);
		if (i % (width / 8) == (width / 8 - 1))
			outFile << endl;
	}
	outFile << "END;";

	inFile.close();
	outFile.close();

    return 0;
}
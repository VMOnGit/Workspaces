SOURCE_FILE = $(wildcard *.cpp)

TARGET = opfile

CXX = g++

all:$(TARGET)

$(TARGET):$(SOURCE_FILE)
	$(CXX) $(SOURCE_FILE) -o $(TARGET)
	
.PHONY: clean
clean:
	rm -f $(TARGET)

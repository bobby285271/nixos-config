CC := g++
OBJ := bin
POSTFIX := out

SOURCES := $(wildcard ./*.cpp)
OBJECTS := $(patsubst ./%.cpp, $(OBJ)/%.$(POSTFIX), $(SOURCES))

all: $(OBJECTS)

$(OBJ)/%.$(POSTFIX): ./%.cpp
	$(CC) $< -o $@

clean: 
	rm -rf ./bin/*

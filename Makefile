PREFIX    := /usr/local
TARGET    := objconv
CC        := g++
LD        := g++
CFLAGS    += -Wall -O2
LDFLAGS   += -Wall
SRC_DIR   := src
BUILD_DIR := build
LIBS       = 
SOURCES    = $(wildcard $(SRC_DIR)/*.cpp)
OBJECTS    = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SOURCES))

.PHONY: all

all: $(TARGET)

$(TARGET): $(OBJECTS)
	@$(LD) $(LDFLAGS) $(LIBS) -o $(BUILD_DIR)/bin/$@ $(OBJECTS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)/bin
	@$(CC) $(CFLAGS) -c -o $@ $<

install:
	@cp $(BUILD_DIR)/bin/$(TARGET) $(PREFIX)/bin/

clean:
	@rm -fr $(BUILD_DIR)

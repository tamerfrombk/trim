#
# Makefile for trim
# (C) Tamer Aly 2019
#

CXX = g++
CXXFLAGS = -Wall -Wextra -Wpedantic -Werror --std=c++11 -O2

SOURCES = trim.cpp
OUTPUT = trim
INSTALL_DIR = /opt/bin

all: build

build:
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $(OUTPUT)

install: build
	mkdir -p $(INSTALL_DIR)
	mv -f $(OUTPUT) $(INSTALL_DIR)

clean:
	rm -f $(OUTPUT)

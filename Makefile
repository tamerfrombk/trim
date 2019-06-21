#
# Makefile for trim
# (C) Tamer Aly 2019
#

CXX = g++
CXXFLAGS = -Wall -Wextra -Wpedantic -Werror --std=c++11 -O2

SOURCES = trim.cpp
OUTPUT = trim
INSTALL_DIR = /opt/bin

MAN_PAGE = trim.1.gz
MAN_PAGE_DIR = /opt/man
MAN_PAGE_LINK = /usr/share/man/man1

.PHONY: all clean install _build uninstall

all: _build

_build:
	$(CXX) $(CXXFLAGS) $(SOURCES) -o $(OUTPUT)

install: _build
	mkdir -p $(INSTALL_DIR)
	cp -f $(OUTPUT) $(INSTALL_DIR)
	mkdir -p $(MAN_PAGE_DIR) 
	cp -f $(MAN_PAGE) $(MAN_PAGE_DIR)
	ln -sf $(MAN_PAGE_DIR)/$(MAN_PAGE) $(MAN_PAGE_LINK)/$(MAN_PAGE)

uninstall: 
	rm -f $(INSTALL_DIR)/$(OUTPUT)
	rm -f $(MAN_PAGE_DIR)/$(MAN_PAGE)
	rm -f $(MAN_PAGE_LINK)/$(MAN_PAGE)

clean:
	rm -f $(OUTPUT)

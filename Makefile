SRC_DIR := src
OUT_DIR := out

SOURCES := $(wildcard $(SRC_DIR)/*.txt)
OUTPUTS := $(patsubst $(SRC_DIR)/%.txt,$(OUT_DIR)/%.txt,$(SOURCES))

.PHONY: all check build test clean ci

all: test

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.txt: $(SRC_DIR)/%.txt | $(OUT_DIR)
	@echo "Building $< -> $@"
	tr '[:lower:]' '[:upper:]' < "$<" > "$@"

check:
	@if [ ! -d "$(SRC_DIR)" ]; then \
		echo "ERROR: source directory $(SRC_DIR) is missing"; \
		exit 1; \
	elif [ "$(words $(SOURCES))" -eq 0 ]; then \
		echo "ERROR: no .txt files found in $(SRC_DIR)"; \
		exit 1; \
	else \
		echo "CHECK PASSED: found $(words $(SOURCES)) source files"; \
	fi
build: $(OUTPUTS)

test: build
	@if grep -n '[a-z]' $(OUTPUTS); then echo "TEST FAILED: lowercase letters found"; exit 1; else echo "TEST PASSED"; fi

clean:
	rm -rf $(OUT_DIR)

ci: clean check test


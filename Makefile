CC = clang

BUILD_DIR = build

all: $(BUILD_DIR) $(BUILD_DIR)/toyc

$(BUILD_DIR):
	@mkdir $(BUILD_DIR)

$(BUILD_DIR)/toyc: main.c
	$(CC) -o $@ main.c

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR)/run_tests: run_tests.c $(BUILD_DIR)/toyc
	$(CC) $(CFLAGS) $< -o $@

.PHONY: test
test: $(BUILD_DIR)/run_tests
	@./$^

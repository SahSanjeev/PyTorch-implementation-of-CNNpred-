PYTHON ?= python
TRAIN_SCRIPT = train.py

.PHONY: install run help

install:
	$(PYTHON) -m pip install -r requirements.txt

run:
	$(PYTHON) $(TRAIN_SCRIPT) --Base-dir .

help:
	@echo "Available targets:"
	@echo "  make install   Install Python dependencies"
	@echo "  make run       Run the CNNpred training script"
	@echo "  make help      Show this help message"

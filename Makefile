VENV ?= .venv
PIP = $(VENV)/bin/pip
PY = $(VENV)/bin/python

.PHONY: init
init: $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install requests
	$(PIP) install mbake
	$(PIP) install black

$(VENV):
	python3 -m venv $(VENV)
	touch $@

.PHONY: format
format:
	$(VENV)/bin/mbake format Makefile
	$(VENV)/bin/black */main.py

.PHONY: iot
iot:
	$(PY) iot-data/main.py

.PHONY: fix-db
fix-db:
	sh database/start.sh
	sh database/drop.sh
	sh database/create.sh
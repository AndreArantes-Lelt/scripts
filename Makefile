VENV ?= .venv
PIP = $(VENV)/bin/pip
PY = $(VENV)/bin/python

.PHONY: init
init: $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install requests
	$(PIP) install black

$(VENV):
	python3 -m venv $(VENV)
	touch $@

.PHONY: format
format:
	$(VENV)/bin/black request.py

.PHONY: run-iot
run-iot: 
	$(PY) iot-data/main.py

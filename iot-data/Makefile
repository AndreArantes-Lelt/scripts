VENV ?= .venv
PIP = $(VENV)/bin/pip
PY = $(VENV)/bin/python

init: $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install requests
	$(PIP) install black

$(VENV):
	python3 -m venv $(VENV)
	touch $@

format:
	$(VENV)/bin/black request.py

run: 
	$(PY) request.py

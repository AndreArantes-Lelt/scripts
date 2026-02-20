VENV ?= .venv
PIP = $(VENV)/bin/pip
PY = $(VENV)/bin/python
 
init: $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install requests

$(VENV):
	python3 -m venv $(VENV)
	touch $@

run:
	$(PY) request.py

# Variables
VENV_DIR = venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
FLASK = $(VENV_DIR)/bin/flask

# Default action to install and run the app
all: install run

# Create the virtual environment if it doesn't exist
$(VENV_DIR)/bin/activate: requirements.txt
	python3 -m venv $(VENV_DIR)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Install dependencies
install: $(VENV_DIR)/bin/activate
	$(PIP) install -r requirements.txt

# Run the Flask application
run: $(VENV_DIR)/bin/activate
	FLASK_APP=app.py $(FLASK) run --port=3000

# Clean up the virtual environment (optional)
clean:
	rm -rf $(VENV_DIR)

# Reset the app
reset: clean install run

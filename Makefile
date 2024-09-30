# Variables
VENV_DIR = venv
PYTHON = python3
PIP = $(VENV_DIR)/bin/pip

# Default action to install and run the app
all: install run

# Create the virtual environment if it doesn't exist
$(VENV_DIR)/bin/activate: requirements.txt
	$(PYTHON) -m venv $(VENV_DIR)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Install dependencies
install: $(VENV_DIR)/bin/activate
	$(PIP) install -r requirements.txt

# Run the Flask application
run: $(VENV_DIR)/bin/activate
	$(VENV_DIR)/bin/python -m flask run --port=3000

# Clean up the virtual environment (optional)
clean:
	rm -rf $(VENV_DIR)

# Reset the app
reset: clean install run

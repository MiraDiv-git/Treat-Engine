#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_status "Checking for Python 3.13.3..."

if command -v python3.13 &> /dev/null; then
    PYTHON_CMD="python3.13"
elif command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | grep -oP '\d+\.\d+\.\d+')
    if [[ "$PYTHON_VERSION" == "3.13.3" ]]; then
        PYTHON_CMD="python3"
    else
        print_warning "Found $PYTHON_VERSION, but version 3.13.3 needed"
        PYTHON_CMD=""
    fi
elif command -v python &> /dev/null; then
    PYTHON_VERSION=$(python --version 2>&1 | grep -oP '\d+\.\d+\.\d+')
    if [[ "$PYTHON_VERSION" == "3.13.3" ]]; then
        PYTHON_CMD="python"
    else
        print_warning "Found $PYTHON_VERSION, but version 3.13.3 needed"
        PYTHON_CMD=""
    fi
else
    PYTHON_CMD=""
fi

if [[ -z "$PYTHON_CMD" ]]; then
    print_status "Installing Python 3.13.3..."
    
    # Checking for package manager
    if command -v apt &> /dev/null; then
        # Ubuntu/Debian
        sudo apt update
        sudo apt install -y software-properties-common
        sudo add-apt-repository -y ppa:deadsnakes/ppa
        sudo apt update
        sudo apt install -y python3.13 python3.13-venv python3.13-tk python3.13-dev
        PYTHON_CMD="python3.13"
    elif command -v yum &> /dev/null; then
        # CentOS/RHEL
        sudo yum install -y python3.13 python3.13-tkinter python3.13-devel
        PYTHON_CMD="python3.13"
    elif command -v dnf &> /dev/null; then
        # Fedora
        sudo dnf install -y python3.13 python3.13-tkinter python3.13-devel
        PYTHON_CMD="python3.13"
    elif command -v pacman &> /dev/null; then
        # Arch Linux
        sudo pacman -S --noconfirm python tk python-pip
        PYTHON_CMD="python"
    elif command -v brew &> /dev/null; then
        # macOS (Homebrew)
        brew install python@3.13 python-tk@3.13
        PYTHON_CMD="python3.13"
    else
        print_error "Can't specify package manager. Install Python 3.13.3 manually."
        exit 1
    fi
else
    print_status "Python 3.13.3 found: $PYTHON_CMD"
    
    # Installing tk support
    print_status "Installing tkinter support..."
    if command -v apt &> /dev/null; then
        sudo apt install -y python3.13-tk
    elif command -v yum &> /dev/null; then
        sudo yum install -y python3.13-tkinter
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y python3.13-tkinter
    elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm tk
    elif command -v brew &> /dev/null; then
        brew install python-tk@3.13
    fi
fi

if ! command -v $PYTHON_CMD &> /dev/null; then
    print_error "Can't find or install Python 3.13.3."
    exit 1
fi

print_status "Python 3.13.3 was installed successfully."

# 2. Creating venv
print_status "Creating virtual environment..."

if [[ -d ".venv" ]]; then
    print_warning "Folder '/.venv' already exists. Recreating the folder..."
    rm -rf .venv
fi

$PYTHON_CMD -m venv .venv

if [[ ! -d ".venv" ]]; then
    print_error "Virtual environment creation failed."
    exit 1
fi

print_status "Virtual environment was created successfully."

# 3. Activating venv
print_status "Activating virtual environment..."

source .venv/bin/activate

if [[ "$VIRTUAL_ENV" == "" ]]; then
    print_error "Can't activate virtual environment."
    exit 1
fi

print_status "Virtual environment activated."

# 4. Requirements
print_status "Installing the requirements..."

if [[ ! -f "requirements.txt" ]]; then
    print_error "Can't find requirements.txt."
    exit 1
fi

pip install --upgrade pip
pip install -r requirements.txt

if [[ $? -ne 0 ]]; then
    print_error "Error while installing requirements."
    exit 1
fi

print_status "Requirements satisfied successfully."

# 5. Test
print_status "Starting main.py..."

if [[ ! -f "main.py" ]]; then
    print_error "Can't find main.py"
    exit 1
fi

python main.py

print_status "Installation finished"

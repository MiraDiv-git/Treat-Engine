# editor/editor.py
from proman import proman_window

def launch():
    root = proman_window()
    root.mainloop()

if __name__ == "__main__":
    launch()
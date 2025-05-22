# main.py
from core.window import Window
from core.renderer import Renderer

def main():
    win = Window()
    renderer = Renderer(win.ctx)

    while not win.should_close():
        win.clear(0.0, 0.0, 0.0)
        renderer.render()
        win.swap_buffers()
        win.poll_events()

    win.terminate()

if __name__ == "__main__":
    main()

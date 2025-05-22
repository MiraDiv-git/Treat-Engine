# core/window.py
import glfw
import moderngl
import sys

class Window:
    def __init__(self, width=800, height=600, title="Treat Engine"):
        if not glfw.init():
            raise Exception("GLFW initialization failed")

        self._window = glfw.create_window(width, height, title, None, None)
        if not self._window:
            glfw.terminate()
            raise Exception("GLFW window creation failed")

        glfw.make_context_current(self._window)
        self.ctx = moderngl.create_context()

        self.width = width
        self.height = height

    def should_close(self):
        return glfw.window_should_close(self._window)

    def swap_buffers(self):
        glfw.swap_buffers(self._window)

    def poll_events(self):
        glfw.poll_events()

    def terminate(self):
        glfw.destroy_window(self._window)
        glfw.terminate()

    def clear(self, r=0.1, g=0.1, b=0.1):
        self.ctx.clear(r, g, b, 1.0)

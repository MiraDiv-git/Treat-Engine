# core/renderer.py
import numpy as np
import moderngl
import os

class Renderer:
    def __init__(self, ctx):
        self.ctx = ctx

        line1 = np.array([
            0, -0.1,
            0, 0.2,
        ], dtype='f4')

        line2 = np.array([
            0, 0.2,
            0.1, 0.2,
        ], dtype='f4')

        line3 = np.array([
            0, -0.1,
            0.1, -0.1,
        ], dtype='f4')

        line4 = np.array([
            0, 0,
            0.1, 0.1,
        ], dtype='f4')

        line5 = np.array([
            0.2, -0.1,
            0.2, 0.2,
        ], dtype='f4')

        line6 = np.array([
            0.2, 0.2,
            0.3, 0.2,
        ], dtype='f4')

        line7 = np.array([
            0.3, 0.2,
            0.3, -0.1,
        ], dtype='f4')

        line8 = np.array([
            0.2, 0.1,
            0.3, 0,
        ], dtype='f4')

        line9 = np.array([
            -0.2, 0.2,
            -0.2, -0.1,
        ], dtype='f4')

        line10 = np.array([
            -0.2, 0.2,
            -0.1, 0.2,
        ], dtype='f4')

        line11 = np.array([
            -0.1, 0.2,
            -0.1, 0.1,
        ], dtype='f4')

        line12 = np.array([
            -0.1, 0.1,
            -0.2, 0,
        ], dtype='f4')

        line13 = np.array([
            -0.2, 0.1,
            -0.1, -0.1,
        ], dtype='f4')

        line14 = np.array([
            0.4, 0.2,
            0.6, 0.2,
        ], dtype='f4')

        line15 = np.array([
            0.5, 0.2,
            0.5, -0.1,
        ], dtype='f4')

        line16 = np.array([
            -0.3, 0.2,
            -0.5, 0.2,
        ], dtype='f4')

        line17 = np.array([
            -0.4, 0.2,
            -0.4, -0.1,
        ], dtype='f4')

        line18 = np.array([
            -0.5, 0.2,
            -0.5, 0.1,
        ], dtype='f4')

        line19 = np.array([
            -0.3, 0.2,
            -0.3, 0.1,
        ], dtype='f4')

        line20 = np.array([
            0.4, 0.2,
            0.4, 0.1,
        ], dtype='f4')

        line21 = np.array([
            0.6, 0.2,
            0.6, 0.1,
        ], dtype='f4')

        self.lines = [
            line1, line2, line3, line4, line5, line6, line7,
            line8, line9, line10, line11, line12, line13,
            line14, line15, line16, line17, line18, line19, line20, line21
        ]

        def rel_path(*parts):
            return os.path.abspath(os.path.join(os.path.dirname(__file__), "..", *parts))

        # Boofers
        with open(rel_path("shaders", "basic.vert")) as vs_file, \
                open(rel_path("shaders", "basic.frag")) as fs_file:
            self.prog = self.ctx.program(
                vertex_shader=vs_file.read(),
                fragment_shader=fs_file.read()
            )

        # VBO and VAO lists
        self.vbos = []
        self.vaos = []

        # Render properties
        for line in self.lines:
            vbo = self.ctx.buffer(line.tobytes())
            vao = self.ctx.vertex_array(self.prog, [(vbo, '2f', 'in_vert')])
            self.vbos.append(vbo)
            self.vaos.append(vao)

    # Render itself
    def render(self):
        for vao in self.vaos:
            vao.render(mode=moderngl.LINES)

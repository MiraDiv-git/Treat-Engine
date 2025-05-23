# Treat Engine

(\*insert a cool image or logo here*)



## **About:**  
Treat Engine is a simple but powerful 2D engine, oriented toward indie devs.

It uses **Python** as the *scripting language* and **ModernGL** as the *rendering API*,
making development simple and giving you full control over the hardware.

It is distributed as open-source under the GPL 2.0 licence - highly recommend 
giving it a read before forking the engine ;)



## Features

- Game logic scripting with **Python**
- Rendering via **ModernGL** (*OpenGL*)
- Lightweight and minimalistic
- Open-source code under GPL 2.0 license



## Installation

1. Clone repository:  
```bash
git clone https://github.com/MiraDiv-git/Treat-Engine.git
```
2. Create virtual environment inside this folder:
```bash
python -m venv .venv
```
3. Install dependencies:
```bash
./.venv/bin/pip install -r requirements.txt # on Linux / MacOS
.venv\Scripts\pip.exe install -r requirements.txt # on Windows
```
4. Run Treat Engine:

```bash
./run.sh # on Linux / MacOS
run.bat # on Windows
```
**Or run it manually:**
```bash
./.venv/bin/python main.py # on Linux / MacOS
.venv\Scripts\python.exe main.py # on Windows
```
You can also check the [Releases](https://github.com/MiraDiv-git/Treat-Engine/releases) page for 
compiled executable files



## Documentation
There will be docs. Someday



## Roadmap

### Current Version (v0.1 - Alpha)
- [x] Basic rendering pipeline
- [x] Python scripting integration  
- [ ] Sprite rendering system
- [ ] Input handling (keyboard/mouse)

### v0.2 - Core Features
- [ ] Audio system integration
- [ ] Basic collision detection
- [ ] Scene management
- [ ] Asset loading (textures, sounds)

### v0.3 - Developer Experience  
- [ ] Built-in editor tools
- [ ] Debug renderer
- [ ] Performance profiler
- [ ] Documentation website

### v1.0 - Stable Release
- [ ] Complete API documentation
- [ ] Example games and tutorials
- [ ] Performance optimizations
- [ ] Cross-platform builds

### Future Ideas 💭
- Tilemap editor
- Mobile platform support
- Plugin system

*Roadmap is subject to change based on community feedback and development priorities*



## Contributing

We welcome contributions to Treat Engine! Here's how you can help:

### Ways to contribute:
- **Report bugs** — open an issue with detailed description
- **Suggest features** — share your ideas in discussions
- **Improve documentation** — fix typos, add examples
- **Submit code** — bug fixes, new features, optimizations

### Before contributing:
1. Check existing issues to avoid duplicates
2. For major changes, open an issue first to discuss
3. Follow the existing code style
4. Test your changes thoroughly

### Pull Request process:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

**Note:** By contributing, you agree that your contributions will be licensed under GPL 2.0



## License
This project is distributed under [GNU General Public License v.2.0](LICENSE)



## Contact
If you have questions or suggestions — feel free to *open an issue*
or contact me via DM
import customtkinter as tk

separator_color = '#3C5E34'
creator_bg_color = '#171A13'
creator_button_color = '#0b400a'
creator_button_highlight = '#105c0e'

new_project_button = None
open_project_button = None

def proman_window():
    root = tk.CTk()
    root.title("Treat Editor - Project Manager")
    root.minsize(800, 600)
    # root.geometry("1280x720")
    root.geometry("800x600") # testing
    root.configure(fg_color="#0F110C")

    proman_creator(root)
    proman_top_panel(root)
    proman_separator(root)

    return root

def proman_top_panel(root):
    panel = tk.CTkFrame(root, height=30, fg_color=separator_color, corner_radius=10, border_width=-1)
    panel.pack(side="top", fill="x")

    top_overlay = tk.CTkFrame(root, height=16, fg_color=separator_color, corner_radius=0)
    top_overlay.place(x=0, y=0, relwidth=1.0)

def proman_separator(root):
    panel = tk.CTkFrame(root, width=20, fg_color=separator_color, corner_radius=0, border_width=-10)
    panel.place(x=300, y=0, relheight=1)

    shadow = tk.CTkFrame(root, width=5, fg_color='#0a0a0a', corner_radius=0, border_width=-10)
    shadow.place(x=320, y=30, relheight=1,)

def proman_creator(root):
    background = tk.CTkFrame(root, width=300, fg_color=creator_bg_color, corner_radius=0, border_width=-10)
    background.place(x=0, y=0, relheight=1)
    background.lower()

    panel = tk.CTkFrame(root, width=255, height=500, fg_color=creator_bg_color, border_width=-10)
    #panel = tk.CTkFrame(root, width=255, height=500, fg_color=separator_color, border_width=-10) # testing
    panel.place(x=20, rely=0.5, anchor="w")

    creator_buttons(panel)

def creator_buttons(root):
    global new_project_button, open_project_button
    new_project_button = tk.CTkButton(root,
                                      height=50,
                                      fg_color=creator_button_color,
                                      hover_color=creator_button_highlight,
                                      text='New Project',
                                      command=lambda: on_click(new_project_button))
    new_project_button.place(rely=0.35, relwidth=1)

    open_project_button = tk.CTkButton(root,
                                       height=50,
                                       fg_color=creator_button_color,
                                       hover_color=creator_button_highlight,
                                       text='Open Project',
                                       command=lambda: on_click(open_project_button))
    open_project_button.place(rely=0.5, relwidth=1)

def on_click(button):
    if button == new_project_button:
        print("New Project Emulation")
    elif button == open_project_button:
        print("Open Project Emulation")
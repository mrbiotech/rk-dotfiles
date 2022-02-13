from __future__ import unicode_literals

from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.keys import Keys
from pygments.token import Token

from ptpython.layout import CompletionVisualisation

__all__ = ("configure",)


def configure(repl):
    # Colorscheme:
    repl.use_code_colorscheme("pastie")

    # Set color depth:
    repl.color_depth = "DEPTH_24_BIT"
   
    # Enable syntax highlighting:
    repl.enable_syntax_highlighting = True


    # Show the status bar:
    repl.show_status_bar = True
    
    # Show line numbers when input is multi-line:
    repl.show_line_numbers = True
    
    # Show completions (NONE, POP_UP, MULTI_COLUMN, TOOLBAR):
    repl.show_completion_visualisation = CompletionVisualisation.MULTI_COLUMN
    
    # Show sidebar help when sidebar active:
    repl.show_sidebar_help = True
    
    # Swap light/dark colors:
    repl.swap_light_and_dark = False
    
    # Highlight matching parentheses:
    repl.highlight_matching_parenthesis = True
    
    # Typing completion:
    repl.complete_while_typing = True
    
    # Enable Vi mode:
    repl.vi_mode = True
    
    # Enable paste mode:
    repl.paste_mode = False
    
    # Prompt style ('classic', 'ipython'):
    repl.prompt_style = 'ipython'
    
    # Blank line after output:
    repl.insert_blank_line_after_output = True
    
    # Enable open in editor ('v' in Vi mode):
    repl.enable_open_in_editor = True
    
    # Disable exit confirmation:
    repl.confirm_exit = False


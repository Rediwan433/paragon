local M = {}

---@param c theme_name.Palette
---@param opts theme_name.Config
function M.get(c, opts)
  -- stylua: ignore
  return  {

    -- Basics
    Normal     = { fg = c.fg, bg = c.bg }, --FIXME: transparent
    Statement  = { fg = c.jade },
    Include    = { fg = c.jade },
    Comment    = { fg = c.smoke},
    Constant   = { fg = c.gild  },
    String     = { fg = c.ember },
    Number     = { fg = c.gild },
    Boolean    = { fg = c.gild },
    Float      = { fg = c.gild },
    Delimiter  = { fg = c.subtle},
    Operator    = { fg = c.subtle},
    Function   = { fg = c.azure },
    Type       = { fg = c.ichor },
    Typedef = { fg = c.ichor },
    Identifier = { fg = c.fg },
    Character   = { fg = c.gild },
    SpecialChar     = { fg = c.gild},        -- caracteres especiales como `\n`, `\t`
    Special    = { fg = c.gild },
    PreProc    = { fg = c.jade },
    Repeat          = { fg = c.jade },         -- `for`, `while`, `do` (si no lo cubre @keyword.repeat)

    -- Others:
    Underlined  = { underline = true },

    -- Logs
    Todo        = { fg = c.fg  },
    Debug       = { fg = c.gild  },  -- debugging statements
    Error       = { fg = c.red },   -- errores de sintaxis

    --  UI ELEMENTS / WINDOWS
    Conceal = { fg = c.fg },              -- Texto oculto (con 'conceallevel')

    Cursor = { fg = c.bg, bg = c.fg }, -- Cursor, tiene que ser todo igual
    lCursor = { fg = c.bg, bg = c.fg },
    CursorIM = { fg = c.bg, bg = c.fg },
    --
    ColorColumn     = { bg = c.highlight_low },     -- Columnas definidas con 'colorcolumn' low o el color del de  la linea 
    CursorColumn    = { bg = c.highlight_low },     -- Columna del cursor
    CursorLine      = { bg = c.highlight_med },         -- Línea del cursor
    Folded = { fg = c.jade, bg = c.bg},  -- estilo suave y armónico
    FoldColumn                  = { bg =   c.bg, fg = c.subtle }, -- 'foldcolumn' -- FIXME: transparent
    SignColumn                  = { bg = c.bg, fg = c.subtle }, -- column where |signs| are displayed FIXME:Transparent
    SignColumnSB                = { bg = c.bg, fg = c.subtle}, -- column where |signs| are displayed FIXME: transparent
    EndOfBuffer     = { fg = c.subtle},                   -- Líneas de relleno (~)
    NormalNC                    = { fg = c.fg, bg = c.bg  }, -- DIM NECESARY and FIXME: transparent
    VertSplit       = { fg = c.highlight_low },           -- Separador vertical
    WinSeparator    = { fg = c.highlight_low, bold = true }, -- Separador vertical con bold
    NormalSB        = { fg = c.fg , bg = c.bg}, -- normal text in sidebar

    -- windows
    NormalFloat     = { fg = c.fg, bg = c.surface }, -- Floating windows
    FloatBorder     = { fg = c.overlay, bg = c.overlay },
    FloatTitle      = { fg = c.ember, bg = c.overlay },
    -- FIXME: preciso cambiar el color de seleccino de winddow

    -- cmp
    Pmenu           = { bg = c.surface, fg = c.fg },      -- Popup menu
    PmenuSel        = { bg = c.highlight_high },               -- QUIZAS PONER HIGH
    PmenuSbar       = { bg = c.overlay },                -- Scrollbar
    PmenuThumb      = { bg = c.highlight_low },               -- Scrollbar thumb
    PmenuMatch      = { bg = c.surface, fg = c.subtle },   -- FIXME: no me agarra
    PmenuMatchSel   = { bg = c.surface, fg = c.subtle  }, -- FIXME: no me agarra
    PmenuBorder = { bg = c.overlay},
    --
    -- -- =========================
    -- -- UI MESSAGES / MODE
    -- -- =========================
    ModeMsg         = { fg = c.fg , bold = true }, 
    MsgArea         = { fg = c.fg, bg = c.bg },             
    MoreMsg         = { fg = c.azure },              -- "more" prompt
    Question        = { fg = c.azure },              -- hit-enter / yes/no
    WarningMsg      = { fg = c.ember },            -- color warning?
    --
    -- -- =========================
    -- -- LINES & NUMBERS
    -- -- =========================
    LineNr          = { fg = c.subtle  },          -- Line numbers
    LineNrAbove     = { fg = c.subtle },
    LineNrBelow     = { fg = c.subtle },
    CursorLineNr    = { fg = c.fg, bold = true },  -- Current line number
    MatchParen      = { fg = c.gild, bold = true },  -- Matching brackets
    --
    -- -- =========================
    -- -- VISUAL MODES
    -- -- =========================
    Visual          = { bg = c.highlight_high },
    VisualNOS       = { bg = c.highlight_high },
    Search          = { bg = c.highlight_high, fg = c.fg },    -- Last search
    IncSearch       = { bg = c.gild, fg = c.bg },      -- Incremental search
    CurSearch       = "IncSearch",                        -- Alias
    --
    -- -- =========================
    -- -- SPELLCHECK
    -- -- =========================
    SpellBad        = { sp = c.red, undercurl = true },
    SpellCap        = { sp = c.ember, undercurl = true },
    SpellLocal      = { sp = c.azure, undercurl = true },
    SpellRare       = { sp = c.magenta, undercurl = true },
    --
    -- -- =========================
    -- -- STATUS / TAB LINE
    -- -- =========================
    StatusLine      = { fg = c.fg,  bg = c.none },
    StatusLineNC    = { fg = c.fg , bg = c.none },
    TabLine         = { bg = c.highlight_low, fg = c.subtle },
    TabLineFill     = { bg = c.bg }, -- FIXME: Transparent
    TabLineSel = { fg = c.bg, bg = c.azure },
    Title           = { fg = c.azure, bold = true },
    WinBar          = "StatusLine",
    WinBarNC        = "StatusLineNC",
    --
    -- -- =========================
   -- -- STYLES
    -- -- =========================
    Bold            = { bold = true, fg = c.fg },
    Italic          = { italic = true, fg = c.fg },
    --
    --
    -- -- =========================
    -- -- DIAGNOSTICS
    -- -- =========================
    DiagnosticError             = { fg = c.red },
    DiagnosticWarn              = { fg = c.ember},
    DiagnosticInfo              = { fg = c.azure },
    DiagnosticHint              = { fg = c.magenta },


    DiagnosticUnderlineError    = { undercurl = true, sp = c.red},
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.ember },
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.azure},
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.magenta},

    DiagnosticUnnecessary       = { fg = c.subtle},
    DiagnosticVirtualTextError  = {  fg = c.red},
    DiagnosticVirtualTextWarn   = {  fg = c.ember},
    DiagnosticVirtualTextInfo   = {  fg = c.azure},
    DiagnosticVirtualTextHint   = {  fg = c.magenta},
    --
    -- -- =========================
    -- -- HEALTH / SYSTEM
    -- -- =========================
    healthError   = { fg = c.red },
    healthSuccess = { fg = c.fg },
    healthWarning = { fg = c.ember },
    --
    -- -- =========================
    -- -- DIFF
    -- -- =========================
    -- FIXME: No se que esta pasando ni que hace todo esto de diff
    diffAdded      = { bg = c.bg, fg = c.jade },     -- lineas nuevas verdes suaves
    diffRemoved    = { bg = c.bg, fg = c.red },    -- lineas eliminadas naranja suave
    diffChanged    = { bg = c.bg, fg = c.azure },    -- lineas cambiadas azul
    diffLine       = { fg = c.smoke },                           -- lineas de diff
    helpExample    = { fg = c.smoke },                           -- ejemplos de help
    diffOldFile    = { fg = c.ichor, bg = c.bg},    -- archivo antiguo
    diffNewFile    = { fg = c.ichor, bg = c.bg},    -- archivo nuevo
    diffFile       = { fg = c.azure },                           -- nombre de archivo
    diffIndexLine  = { fg = c.red },                            -- índice en diff
    --
    -- OTROS
    -- Label           = { fg = c.fg }           -- etiquetas, labels en C (`label:`)
    -- StorageClass    = { fg = c.jade }         -- `static`, `extern`, etc.
    -- Structure       = { fg = c.ichor }        -- structs, enums, unions
    -- Tag             = { fg = c.azure }        -- etiquetas de HTML/XML (`<div>`)
    -- Exception       = { fg = c.gild }         -- palabras reservadas de excepción (`try`, `catch`)
    -- PreCondit       = { fg = c.jade }         -- preprocessor conditionals (`#if`, `#ifdef`)
    -- Define          = { fg = c.jade }         -- macros definidas (`#define`)
    -- Macro           = { fg = c.jade }         -- macros heredadas
    -- SpecialComment  = { fg = c.smoke, italic = true } -- comentarios especiales
    --
    -- -- =========================
    -- -- DEBUG
    -- -- =========================
    -- debugBreakpoint = { bg = c.info, fg = c.info }
    -- debugPC         = { bg = c.bg_sidebar }
    --
    -- -- =========================
    -- -- HELP / HTML / QUICKFIX
    -- -- =========================
    -- dosIniLabel     = "@property"
    -- helpCommand     = { bg = c.bright_black, fg = c.azure }
    -- htmlH1          = { fg = c.magenta, bold = true }
    -- htmlH2          = { fg = c.azure, bold = true }
    -- qfFileName      = { fg = c.azure }
    -- qfLineNr        = { fg = c.black }
    --
    -- -- =========================
    -- -- LSP
    -- -- =========================
    -- LspReferenceText            = { bg = c.fg_gutter }
    -- LspReferenceRead            = { bg = c.fg_gutter }
    -- LspReferenceWrite           = { bg = c.fg_gutter }
    -- LspSignatureActiveParameter = { bg = c.bg_visual, bold = true }
    -- LspCodeLens                 = { fg = c.comment }
    -- LspInlayHint                = { bg = c.blue1, fg = c.dark3 }
    -- LspInfoBorder               = { fg = c.bg_visual, bg = c.bg_float }
    -- ComplHint                   = { fg = c.bright_black }
  }
end

return M

local lush = require('lush')
local hsl = lush.hsluv

-- Lush.hsl provides a number of convenience functions for:
--
--   Relative adjustment (rotate(), saturate(), desaturate(), lighten(), darken())
--   Absolute adjustment (prefix above with abs_)
--   Combination         (mix())
--   Overrides           (hue(), saturation(), lightness())
--   Access              (.h, .s, .l)
--   Coercion            (tostring(), "Concatination: " .. color)
--   Helpers             (readable())
--
--   Adjustment functions have shortcut aliases, ro, sa, de, li, da
--                                               abs_sa, abs_de, abs_li, abs_da



local dark = {
  -- syntax
  bg          = hsl("#282C34"),
  fg          = hsl("#ABB2BF"),
  cursor      = hsl("#FFCC00"),
  keyword     = hsl("#10B1FE"),
  comment     = hsl("#636D83"),
  punctuation = hsl("#7A82DA"),
  method      = hsl("#3FC56B"),
  type        = hsl("#FF6480"),
  string      = hsl("#F9C859"),
  number      = hsl("#FF78F8"),
  constant    = hsl("#9F7EFE"),
  tag         = hsl("#3691FF"),
  attribute   = hsl("#FF936A"),
  property    = hsl("#CE9887"),
  parameter   = hsl("#8bcdef"),
  label       = hsl("#50acae"),
  -- workspace
  primary     = hsl("#3691ff"),
  selection   = hsl("#274670"),
  search      = hsl("#1A7247"),
  diffAdd     = hsl("#105B3D"),
  diffChange  = hsl("#10415B"),
  diffDelete  = hsl("#522E34"),
  diffText    = hsl("#10415B").lighten(12),
  error       = hsl("#ff2e3f"),
  warning     = hsl("#da7a43"),
}

local light = {
  bg          = hsl("#F9F9F9"),
  fg          = hsl("#383A42"),
  cursor      = hsl("#F31459"),
  keyword     = hsl("#0098DD"),
  comment     = hsl("#A0A1A7"),
  punctuation = hsl("#7A82DA"),
  method      = hsl("#23974A"),
  type        = hsl("#D52753"),
  string      = hsl("#C5A332"),
  number      = hsl("#CE33C0"),
  constant    = hsl("#823FF1"),
  tag         = hsl("#275FE4"),
  attribute   = hsl("#DF631C"),
  property    = hsl("#A05A48"),
  parameter   = hsl("#40B8C5"),
  label       = hsl("#3a8ab2"),
  -- workspace
  primary     = hsl("#0099e1"),
  -- TODO: fix selection + diff change clash
  selection   = hsl("#d2ecff"),
  search      = hsl("#b1eacf"),
  diffAdd     = hsl("#c5f6c8"),
  diffChange  = hsl("#C2E4FF"),
  diffDelete  = hsl("#fac1c6"),
  diffText    = hsl("#C2E4FF").darken(4),
  error       = hsl("#ff0000"),
  warning     = hsl("#ff8f3a")
}

local t = dark

if (vim.o.background == "light") then
  t = light
end

local function shade(color, value)
  if (vim.o.background == "light") then
    return color.darken(value)
  else
    return color.lighten(value)
  end
end

-- t.shade1 = shade(t.bg, 1)
-- t.shade2 = shade(t.bg, 2)
t.shade3 = shade(t.bg, 3)
t.shade4 = shade(t.bg, 4)
t.shade5 = shade(t.bg, 5)
t.shade6 = shade(t.bg, 6)
t.shade7 = shade(t.bg, 7)
t.shade8 = shade(t.bg, 8)
t.shade9 = shade(t.bg, 9)
t.shade10 = shade(t.bg, 10)
t.shade20 = shade(t.bg, 20)
t.shade25 = shade(t.bg, 25)
t.shade30 = shade(t.bg, 30)
-- t.shade40 = shade(t.bg, 40)
-- t.shade50 = shade(t.bg, 50)
-- t.shade60 = shade(t.bg, 60)
-- t.shade70 = shade(t.bg, 70)
-- t.shade80 = shade(t.bg, 80)
-- t.shade90 = shade(t.bg, 90)


t.grey3 = t.shade3.mix(t.primary, 3)
t.grey5 = t.shade5.mix(t.primary, 5)
t.grey10 = t.shade10.mix(t.primary, 10)
t.grey20 = t.shade20.mix(t.primary, 10)
t.grey25 = t.shade25.mix(t.primary, 10)
t.grey30 = t.shade30.mix(t.primary, 10)

t.white = hsl(0,0,100)

-- Call lush with our lush-spec.
-- ignore the "theme" variable for now
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    Normal { fg = t.fg }, -- normal text
    CursorLine { bg = t.grey3 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Whitespace { fg = t.grey10 },
    Comment { fg = t.comment },
    LineNr { fg = t.grey30 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { Comment }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Search { bg = t.search },
    IncSearch { bg = t.cursor.mix(t.bg, 10), fg = t.bg, gui = "bold" },
    CurSearch { Search, gui = "bold" },
    NormalFloat { bg = t.grey3 }, -- Normal text in floating windows.
    ColorColumn { Whitespace }, -- used for the columns set with 'colorcolumn'
    Conceal {}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor { bg = t.cursor, fg = t.bg }, -- character under the cursor
    lCursor { Normal }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM { Normal }, -- like Cursor, but used when in IME mode |CursorIM|
    Directory { fg = t.primary }, -- directory names (and other special names in listings)
    DiffAdd { bg = t.diffAdd }, -- diff mode: Added line |diff.txt|
    DiffChange { bg = t.diffChange }, -- diff mode: Changed line |diff.txt|
    DiffDelete { bg = t.diffDelete }, -- diff mode: Deleted line |diff.txt|
    DiffText { bg = t.diffText }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer { Normal }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor { Cursor }, -- cursor in a focused terminal
    TermCursorNC {}, -- cursor in an unfocused terminal
    ErrorMsg { fg = t.error }, -- error messages on the command line
    VertSplit { fg = t.grey30 }, -- the column separating vertically split windows
    Folded { bg = t.grey10, fg = t.bg }, -- line used for closed folds
    SignColumn { Normal }, -- column where |signs| are displayed
    FoldColumn { SignColumn }, -- 'foldcolumn'
    Substitute { IncSearch }, -- |:substitute| replacement text highlighting

    -- MatchParen { bg = t.punctuation, fg = t.bg }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    MatchParen { bg = t.punctuation, fg = t.white }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg { Normal }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { Normal }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg { fg = t.primary }, -- |more-prompt|
    NonText { fg = t.shade30 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalNC { Normal }, -- normal text in non-current windows
    Pmenu { bg = t.grey5 },
    PmenuSel { bg = t.selection }, -- Popup menu: selected item.
    PmenuSbar { bg = t.grey10 }, -- Popup menu: scrollbar.
    PmenuThumb { bg = t.grey25 }, -- Popup menu: Thumb of the scrollbar.
    Question { fg = t.primary }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { bg = t.primary, fg = t.white}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey   { fg = t.attribute }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { gui = "undercurl"  }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    -- StatusLine { Normal }, -- status line of current window
    -- StatusLineNC { Normal }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    Title { fg = t.primary }, -- titles for output from ":set all", ":autocmd" etc.
    Visual { bg = t.selection }, -- Visual mode selection
    VisualNOS { bg = t.type }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg { fg = t.warning }, -- warning messages
    WildMenu { bg = t.selection }, -- current match in 'wildmenu' completion

    Constant { fg = t.constant }, -- (preferred) any constant
    String { fg = t.string }, --   a string constant: "this is a string"
    Character { fg = t.attribute }, --  a character constant: 'c', '\n'
    Number { fg = t.number }, --   a number constant: 234, 0xff
    Boolean { fg = t.keyword }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10
    Identifier { fg = t.fg }, -- (preferred) any variable name
    Function { fg = t.method }, -- function name (also: methods for classes)
    Property { fg = t.property },
    Parameter { fg = t.parameter },
    Statement { fg = t.keyword }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    Operator { fg = t.punctuation }, -- "sizeof", "+", "*", etc.
    -- Keyword        { Statement }, --  any other keyword
    -- Exception      { }, --  try, catch, throw
    PreProc { fg = t.keyword }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.
    Type { fg = t.type }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef
    Special { Character }, -- (preferred) any special symbol
    -- SpecialChar {}, --  special character in a constant
    Tag { fg = t.tag, gui = "underline" }, --    you can use CTRL-] on this
    -- Delimiter {}, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements
    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold { gui = "bold" },
    Italic { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.

    -- LspDiagnosticsError               { }, -- used for "Error" diagnostic virtual text
    -- LspDiagnosticsErrorSign           { }, -- used for "Error" diagnostic signs in sign column
    -- LspDiagnosticsErrorFloating       { }, -- used for "Error" diagnostic messages in the diagnostics float
    -- LspDiagnosticsWarning             { }, -- used for "Warning" diagnostic virtual text
    -- LspDiagnosticsWarningSign         { }, -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsWarningFloating     { }, -- used for "Warning" diagnostic messages in the diagnostics float
    -- LspDiagnosticsInformation         { }, -- used for "Information" diagnostic virtual text
    -- LspDiagnosticsInformationSign     { }, -- used for "Information" signs in sign column
    -- LspDiagnosticsInformationFloating { }, -- used for "Information" diagnostic messages in the diagnostics float
    -- LspDiagnosticsHint                { }, -- used for "Hint" diagnostic virtual text
    -- LspDiagnosticsHintSign            { }, -- used for "Hint" diagnostic signs in sign column
    -- LspDiagnosticsHintFloating        { }, -- used for "Hint" diagnostic messages in the diagnostics float
    -- LspReferenceText                  { }, -- used for highlighting "text" references
    -- LspReferenceRead                  { }, -- used for highlighting "read" references
    -- LspReferenceWrite                 { }, -- used for highlighting "write" references

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.


    -- TSError              { }, -- For syntax/parser errors.
    sym("@punctuation") { fg = t.punctuation },
    sym("@punctuation.bracket") { fg = t.punctuation },
    sym("@punctuation.delimiter") { fg = t.punctuation },
    sym("@punctuation.special") { fg = t.punctuation },
    -- TSPunctDelimiter {}, -- For delimiters ie: `.`
    -- TSPunctBracket {}, -- For brackets and parens.
    -- TSPunctSpecial {}, -- For special punctutation that does not fall in the catagories before.
    -- TSConstant           { }, -- For constants
    sym("@constant.builtin") { fg = t.keyword },
    -- TSConstBuiltin { fg = t.keyword }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    sym("@string.escape") { Character },
    -- TSStringEscape { Character }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    -- TSFunction           { }, -- For function (calls and definitions).
    sym("@function") { fg = t.method },
    -- TSFuncBuiltin {}, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro {}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    sym("@parameter") { fg = t.parameter },
    -- TSParameter { fg = t.parameter }, -- For parameters of a function.
    -- TSParameterReference { }, -- For references to parameters of a function.
    -- TSMethod             { }, -- For method calls and definitions.
    sym("@field") { Property },
    -- TSField { fg = t.property }, -- For fields.
    sym("@property") { Property },
    -- TSProperty { fg = t.property }, -- Same as `TSField`.
    sym("@constructor") { fg = t.type },
    -- TSConstructor { Type }, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    sym("@label") { fg = t.label }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSLabel { fg = t.label }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    -- TSKeyword            { }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    -- TSType               { }, -- For types.
    sym("@type") { Type },
    sym("@type.builtin") { Statement },
    -- TSTypeBuiltin { Statement }, -- For builtin types (you guessed it, right ?).
    sym("@namespace") { Statement },
    -- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    sym("@annotation") { sym("@label") }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSAnnotation { TSLabel }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    sym("@text") { Normal },
    -- TSText { Normal }, -- For strings considered text in a markup language.
    sym("@text.strong") { Bold },
    -- TSStrong {}, -- For text to be represented with strong.
    sym("@text.italic") { Italic },
    -- TSEmphasis {}, -- For text to be represented with emphasis.
    sym("@text.underline") { Underlined },
    -- TSUnderline { underline = true }, -- For text to be represented with an underline.
    sym("@text.title") { Statement },
    -- TSTitle { Statement }, -- Text that is part of a title.
    sym("@text.literal") { Normal },
    -- TSLiteral            { Normal }, -- Literal text.
    TSURI { fg = t.tag, underline = true }, -- Any URI like a link or email.
    sym("@variable") { Normal }, -- Variable names that are defined by the languages, like `this` or `self`.
    -- TSVariable { Normal }, -- Any variable name that does not have another highlight.
    sym("@variable.builtin") { Statement }, -- Variable names that are defined by the languages, like `this` or `self`.
    -- TSVariableBuiltin {}, -- Variable names that are defined by the languages, like `this` or `self`.



    -- Language Overrides
    -- JSON
    sym("@label.json") { fg = t.property }, -- For labels: `label:` in C and `:label:` in Lua.
  }
end)
return theme

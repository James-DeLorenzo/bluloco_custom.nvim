local lush = require('lush')
local hsl = lush.hsl

-- colors {{{
local wine_red = hsl("#9c1e37")
local red = hsl("#ff0000")
local off_red = hsl("#f81141")
local rose = hsl("#fc4a6d")
local brown = hsl("#745b53")
local clay_orange = hsl("#fd7e57")
local peach = hsl("#ff936a")
local dandelion = hsl("#ffcc00")
local dark_dandelion = hsl("#ffa023")
local sun = hsl("#f9c859")
local yellow = hsl("#ffff00")
local dark_green = hsl("#237236")
local green = hsl("#3fc56b")
local lime_green = hsl("#92f535")
local baby_blue = hsl("#8bcdef")
local light_blue = hsl("#10b1fe")
local off_blue = hsl("#285bff")
local blue = hsl("#0000ff")
local light_purple = hsl("#9f7efe")
local magenta = hsl("#ff00ff")
local dark_grey = hsl("#636d83")
local grey = hsl("#abb2bf")
local light_grey = hsl("#cdd3e0")
local white = hsl("#f9f9f9")
local pure_white = hsl("#ffffff")
local blue_grey = hsl("#22252a")
local shadow_blue = hsl("#282c34")
local black = hsl("#000000")
-- }}}
-- vibrants {{{
local braker_blue = hsl("#28e3eb")
local burnt_orange = hsl("#ffa023")
local pink = hsl("#ff78ff")
local poison_green = hsl("#00ff95")
-- }}}
      -- `setlocal nocursorline`

-- lush funcs {{{
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
-- }}}

-- Call lush with our lush-spec.
-- ignore the "theme" variable for now
---@diagnostic disable: undefined-global
local theme = lush(function()
  -- require('feline').reset_highlights()
  return {
    -- It's recommended to disable wrapping with `setlocal nowrap`, each
    -- group in this tutorial is appended by it's description for ease of use,
    -- but the wrapping may be distracting.
    --
    -- lush-spec statements are in the form:
    --
    --   <HighlightGroupName> { bg = <hsl>|<string>,
    --                          fg = <hsl>|<string>,
    --                          sp = <hsl>|<string>,
    --                          gui = <string> },
    -- default groups {{{
    Normal       { fg = grey, bg = shadow_blue }, -- normal text
    Comment      { fg = dark_grey  }, -- any comment
    ColorColumn  { bg = Normal.bg.da(10)}, -- used for the columns set with 'colorcolumn'
    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { fg = black, bg = dandelion }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorLine   { bg = Normal.bg.li(5) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- Directory    { fg = green }, -- directory names (and other special names in listings)
    DiffAdd      { fg = green }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = light_blue }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = rose }, -- diff mode: Deleted line |diff.txt|
    -- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = blue }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor   { Cursor }, -- cursor in a focused terminal
    TermCursorNC { Cursor }, -- cursor in an unfocused terminal
    ErrorMsg     { fg = pure_white, bg = red }, -- error messages on the command line
    VertSplit    { bg = Normal.bg.li(12)}, -- the column separatin vertically split windows
    Folded       { bg = Normal.bg.li(10) }, -- line used for closed folds
    -- test fold {{{
        -- test nested fold {{{
        -- }}}
    -- }}}
    FoldColumn   {  }, -- 'foldcolumn'
    SignColumn   { Normal }, -- column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { Comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = Cursor.bg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = shadow_blue, bg = braker_blue }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg = red }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { bg = Normal.bg.li(6)}, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = green }, -- |more-prompt|
    NonText      { fg = blue }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    NormalFloat  { fg = grey, bg = blue_grey }, -- Normal text in floating windows.
    NormalNC     { Normal }, -- normal text in non-current windows
    Pmenu        { NormalFloat }, -- Popup menu: normal item.
    PmenuSel     { fg = white, bg = grey }, -- Popup menu: selected item.
    PmenuSbar    { bg = dark_grey }, -- Popup menu: scrollbar.
    PmenuThumb   { bg = white }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = green }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search       { }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey   { fg = magenta }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine   { fg = grey, bg = dark_grey }, -- status line of current window
    StatusLineNC { StatusLine }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { fg = Comment.fg, bg = Normal.bg.li(47) }, -- tab pages line, not active tab page label
    TabLineFill  { CursorLine }, -- tab pages line, where there are no labels
    -- TabLineSel   {  }, -- tab pages line, active tab page label
    -- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = light_blue }, -- Visual mode selection
    VisualNOS    { bg = light_blue.ro(180) }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = red }, -- warning messages
    Whitespace   { fg = Normal.bg.li(18) }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion
    -- }}}
    -- syntax HLs {{{
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg = light_purple }, -- (preferred) any constant
    String         { fg = dandelion }, --   a string constant: "this is a string"
    Character      { String }, --  a character constant: 'c', '\n'
    Number         { fg = pink }, --   a number constant: 234, 0xff
    Boolean        { fg = light_blue }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    Identifier     { fg = grey }, -- (preferred) any variable name
    Function       { fg = green }, -- function name (also: methods for classes)

    Statement      { fg = light_blue }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    PreProc        { fg = light_blue }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg = rose }, -- (preferred) int, long, char, etc.
    -- StorageClass   { fg = red }, -- static, register, volatile, etc.
    -- Structure      { fg = red }, --  struct, union, enum, etc.
    -- Typedef        { fg = br }, --  A typedef

    Special        { fg = baby_blue }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    Todo           { fg = pure_white, bg = dark_green }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- }}}
    -- LSP {{{
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
    
    -- }}}
    -- Tree-Sitter {{{
    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSError              { }, -- For syntax/parser errors.
    -- TSPunctDelimiter     { }, -- For delimiters ie: `.`
    -- TSPunctBracket       { }, -- For brackets and parens.
    -- TSPunctSpecial       { fg =  }, -- For special punctutation that does not fall in the catagories before.
    TSConstant           { fg = green }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    -- TSStringEscape       { }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    -- TSFunction           { }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSParameter          { fg = baby_blue }, -- For parameters of a function.
    -- TSParameterReference { fg = pink }, -- For references to parameters of a function.
    -- TSMethod             { }, -- For method calls and definitions.
    TSField              { fg = peach }, -- For fields.
    TSProperty           { TSField }, -- Same as `TSField`.
    -- TSConstructor        { }, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    TSLabel              { bg = poison_green }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    -- TSKeyword            { }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    TSType               { fg = grey }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    -- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSText               { }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    -- TSURI                { }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.
    -- }}}
    -- lightspeed {{{
    LightspeedLabel { fg = rose.li(10), gui = "bold, underline" },
    LightspeedLabelOverlapped { fg = wine_red, gui = "underline" },
    LightspeedLabelDistant { fg = baby_blue.li(30), gui = "bold, underline" },
    LightspeedLabelDistantOverlapped { fg = baby_blue, gui = "underline" },
    LightspeedShortcut { fg = pure_white, bg = magenta.ro(31), gui = "bold" },
    LightspeedShortcutOverlapped {LightspeedShortcut},
    LightspeedMaskedChar { Comment },
    LightspeedGreyWash { Comment },
    LightspeedUnlabeledMatch { fg = pure_white, gui = "bold" },
    LightspeedOneCharMatch {LightspeedShortcut},
    LightspeedUniqueChar {LightspeedUnlabeledMatch},
    LightspeedPendingOpArea {LightspeedShortcut},
    LightspeedCursor {Cursor},
    -- }}}
  }
end)
-- If you wish to use your theme in Vim, or without loading lush, you may export
-- your theme via `lush.export_to_buffer(parsed_lush_spec)`. The readme has
-- further details on how to do this.

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap:cursorline:number
--
--

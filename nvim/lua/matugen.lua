 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#141228',
    base02 = '#1c1934',
    base03 = '#656278',
    base04 = '#908caa',
    base05 = '#e0def4',
    base06 = '#e0def4',
    base07 = '#e0def4',
    base08 = '#eb6f92',
    base09 = '#31748f',
    base0A = '#9ccfd8',
    base0B = '#ebbcba',
    base0C = '#96d1e9',
    base0D = '#e99996',
    base0E = '#96dce9',
    base0F = '#beebf4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e0def4',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#656278',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#e0def4',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#656278',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#ebbcba',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#908caa',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#ebbcba' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#9ccfd8' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#31748f' })
  hi('TelescopeSelection',      { fg = '#e0def4',          bg = '#1c1934' })
  hi('TelescopeSelectionCaret', { fg = '#ebbcba',             bg = '#1c1934' })
  hi('TelescopeMatching',       { fg = '#ebbcba',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e0def4',          bg = '#000000' })
  hi('MiniPickBorder',         { fg = '#656278',             bg = '#000000' })
  hi('MiniPickPrompt',   { fg = '#e0def4',          bg = '#000000' })
  hi('MiniPickPromptPrefix',   { fg = '#ebbcba',             bg = '#000000' })
  hi('MiniPickBorderText',    { fg = '#000000',             bg = '#ebbcba' })
  hi('MiniPickMatchCurrent',      { fg = '#e0def4',          bg = '#1c1934' })
  hi('MiniPickPromptCaret', { fg = '#ebbcba',             bg = '#1c1934' })
  hi('MiniPickMatchRanges',       { fg = '#ebbcba',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M

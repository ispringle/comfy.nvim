local timer
local M = {
  wait = 5, -- minutes
  timer = timer,
}

function M.setup()
  local grp = vim.api.nvim_create_augroup("Screensaver", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = grp,
    callback = function()
      if not require("nvim-treesitter.parsers").has_parser() then
        return
      end
      timer = vim.loop.new_timer()
      timer:start(
        M.wait * 60000,
        0,
        vim.schedule_wrap(function()
          if timer:is_active() then
            timer:stop()
          end
          require("cellular-automaton").start_animation("game_of_life")
        end)
      )

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = grp,
        callback = function()
          if timer:is_active() then
            timer:stop()
          end
          if not timer:is_closing() then
            timer:close()
          end
        end,
        once = true,
      })
    end,
  })
end

return M

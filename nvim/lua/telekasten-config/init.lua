local M = {}

function M.setup()
  local home = vim.fn.expand("~/grok/")
  require('telekasten').setup({
    take_over_my_home = true,
    auto_set_filetype = true,

    home = home,
    dailies = home .. "/dailies",
    weeklies = home .. "/weeklies",
    templates = home .. "/templates",
    image_subdir = home .. "/images",

    extension = ".md",
    new_note_filename = "title-uuid",
    uuid_type = "%Y%m%d%H%M",
    uuid_sep = "-",

    follow_creates_nonexisting = true,
    dailies_creates_nonexisting = true,
    weeklies_creates_nonexisting = true,

    journal_auto_open = true,

    template_new_note = home .. '/templates/new_note.md',
    template_new_daily = home .. '/templates/daily.md',
    template_new_weekly= home .. '/templates/weekly.md',
    template_handling = "smart",

    image_link_style = "markdown",
    subdirs_in_links = true,
    new_note_location = "smart",
    rename_update_links = true,

    sort = "filename",

    plug_into_calendar = true,
    calendar_opts = {
        weeknm = 1,
        calendar_monday = 0,
        calendar_mark = 'left-fit',
    },


    close_after_yanking = false,
    insert_after_inserting = true,

    tag_notation = "yaml-bare",

    command_palette_theme = "dropdown",
    show_tags_theme = "dropdown",

    follow_url_fallback = nil,
  })
end

return M

# comfy.nvim

![Scrot!](https://user-images.githubusercontent.com/18722936/138169402-49a9175e-f435-4f64-bf8f-373a928abab1.png)

The C O M F Y configuration for Neovim

## Why Another Neovim Configuration?

When I had heard Neovim 0.5 allowed for a pure Lua configuration I jumped on that bandwagon _so_ hard! I first tried to port my original `comfy.vim` over to using Lua but for some reason I gave up and started to use `LunarVim`.
`LunarVim` was cool and all, I even made a few PRs (not sure if any were merged though...). At the time I was using `taskwarrior` + `bugwarrior`'s Jira integration for tracking and updating my tasks at work. But I got annoyed
with a bug in `bugwarrior` `<ironic.gif>` and ended up switching to org-mode. Well, if you use org-mode than you might as well just use emacs for everything, so I did. I ditched Neovim and went full on emacs with the DoomEmacs.
This wasn't my first time trying out emacs but it was my longest run at it. Ended up using emacs for a little under 9 months. I stopped one day and looked at the monster I had created. It was bloated, slow, crashed on a regular
basis, and had so much duct tape and hacks to smooth over ergonomic issues that I just threw in the towel and retreated to my first live, `vim`. I gave `LunarVim` another shot, but by this point they'd more or less created
their own neovim runtime with their `lvim` thing. I didn't like that and my old config didn't work anymore. Instead of relearning how `LunarVim` worked or trying out a new pre-configured configuration for Neovim I just decided
to write my own. And here it is -- `comfy.nvim`!

## What does comfy.nvim offer?

I want to make comfy.nvim a more or less dead-simple neovim >0.5 configuration that works out of the box with minimal bootstrapping. I hate how so many pre-configured configurations rely on their own configuration file to
parse what _you_ want neovim to do versus what they want it to do. So instead I just am using P U R E Lua to get the job done. I am trying to proiritize speed, comfy.vim took a solid few seconds to load and would choke up
now and then... so I don't want to redo that. I also am trying to avoid non-Lua plugins. Why? I don't know, just seems cool. At this time there is a single plugin that isn't at least using some `lua`, tpope's `repeat.vim`.

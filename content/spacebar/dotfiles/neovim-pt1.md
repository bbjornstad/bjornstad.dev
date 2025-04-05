+++
title = "nightowl.nvim"
description = "How to Make Neovim Do Everything, Part 1"
date = 2023-06-01

tags = ["Linux", "nightowl.nvim"]
+++

[ <!-- TODO --> ]:: # add hyperlinks

_Written in Memory of Bram Moolenaar, a soul most of us sadly never knew, but
whose dedication has touched all who come across Vim. May he rest in peace_

---

The almighty Neovim...a worthy opponent, feared by many for the treacherous
journey that awaits those sorry souls who seek to "close the program". Its
revered status is almost dragon-like, or rather more like a hydra, which is a
fitting moniker, given that one of the more popular plugins that exists in
historical record for the text editor is
[hydra.nvim](https://github.com/anuvyklack/hydra.nvim)

<!-- more -->

Many people think that Neovim is not worth spending so much effort configuring
when there are more convenient options available. Visual Studio Code is a solid
editor and more efficiently configurable---especially for someone who is not
already somewhat familiar with (Neo)vim, and therefore the proper usage
patterns, while the JetBrains family of IDEs have a cultish following.
Alternatively, other new editors are designed and implemented using more
sensible patterns, alternative languages, and optimizations that make the
end-user experience better, see [Helix](https://helix-editor.com).

While I hold Neovim quite close to heart, and do believe that it has provided me
an enormous boost in productivity, it has done so after extensive learning about
keymaps and to a lesser extent, tweaking custom configurations. I have been
using Vim/Neovim directly for nearly 6 years and have been exposed to the
bindings for the better part of 10, and still only consider myself a novice,
leaning on the intermediate side. The further reality is that most
of the benefits in productive throughput are the result of modal editing and the
specific vim-style keybindings. In most editors, both of these are typically
available through a single plugin, bridging the gap for users
who probably don't have the time or patience to configure every last section of
the editor's behavior (read: people whose time is actually worth something).

To me, it seems as though vim-derivatives are well suited to a selection of
different, somewhat unorthodox circumstances that occasionally rear their heads
during text editing. On the one hand, nearly every last parameter of the
behavior is available for configuration; this affords near limitless power, or
at least limitless in the sense of the least-common-divisor between one's Lua
abilities and one's physical hardware. Hence, considering especially that one's
brain (and therefore Lua abilities) are more malleable than we originally
thought as a species, it seems as though Neovim could perform strongly in
situations where the physical hardware capabilities are either extremely capped,
limited, or otherwise unadjustable by the user, or in cases where the physical
hardware capabilities are totally uncapped (relatively speaking).

Another reasonable section of the population of potential developers who might
be using Neovim is those who want to achieve a degree of minimalism in their
configurations that is not achievable with other editors, or by eking out the
best performance in comparison. All of that is well and good, of course; in
fact most would say it is the correct approach entirely and vim wasn't designed
with my use considerations in mind.

The typical way in which most people would choose to set up their editors is by
slowly but methodically including plugins that serve particular workflow
contexts. In contrast, I chose a maximalist approach; which is to say that
instead of starting from minimal and working up, I threw my editor with the
kitchen sink at the wall to see what sticks (the damage was minimal; the worst
was to the spaghetti, not my computer).

To be clear, this is not the most effective or efficient way of setting up the
editor. Choosing the more standard path described instead of the approach that
you are about to read more about is generally a better choice. But in case you
find yourself somewhere closer to my camp, or are simply just curious, please
remember to keep checking back here for the latest on learning _How to Make
Neovim Do Anything_.

---

## **_How to Make Neovim Do Anything_**: Part 1/?

If you are anything like me you know the struggle of learning about the
expansive plugin ecosystems for Unix software: there's always another plugin to
try, another delectable cream-puff of a behavioral modification or shortcut
binding to experiment with. It can get overwhelming, but at the same time, incredibly
satisfying. Neovim is quite possibly the worst offender in this regard (although
I'm sure die-hard old-head Unix users could come through the woodworks with more
plentiful examples). Not only is there the already venerable vim plugin
ecosystem which can be used, but an impressive selection of lua-implemented
plugins specific only to Neovim.

If you are newer to neovim, this is a good spot to decide on what balance of
vimscript-vs-nvim-lua plugins to settle on---in hopes of facilitating
consistency in specification which can help debugging efforts if needed. It is
my personal preference that lua-specific plugins are strongly preferred due to
Neovim's first-class lua integration, and hence performance improvements. With that
said, I do not have any backwards-compatibility or otherwise
cross-editor-compatibility that I need in my workflow, so your mileage may vary
on selecting this balance. It will also depend on the selection of plugins that
you are looking to include (naturally). Luckily, it does seem as though there
are replacement implementations in lua for many of the commonly used vimscript
plugins.

### LazyVim, lazy.nvim, and kickstart.nvim

Because of the aforementioned bent towards lua-specific implementations for
performance gains, it would make the most sense to choose a package
management system and initial framework which is implemented specifically for
lua. For a long while, the de-facto standard was packer.nvim (which I never
used, as I was still using vim-plug and a typical vim setup instead of neovim).
But now, the new kid on the block is lazy.nvim, written by none other than the
notorious Folke, who seems to be to neovim what Tim Pope is to vim (Quake
Announcer: godlike).

lazy.nvim is different from most other plugin managers in that lazy-loading of
plugins is automatically managed by lazy.nvim. This stands in contrast to
previous options, which all required defining the plugin startup-load order at
some capacity, somewhere in the configuration (e.g. using the `after` or `before`
keys from packer). I'm not exactly sure what Folke has done to achieve this, but
I can say that this strategy is very appealing given the fact that when you are
considering hundreds of plugins to build up the editing experience, startup
performance can seriously degrade without the lazy-loading component. Other
managers may have this functionality available, but lazy.nvim makes it by far
the easiest to configure and manage.

Which, through no small accident, brings us to the next fork in the road, as
Folke has also created the venerable LazyVim, which straddles between a pre-made
distribution (a la Nvchad, or LunarVim) and a plugin. It comes with a number of
default plugins, keybindings, and options which generally make sense for most
configurations. On the other side, there is also kickstart.nvim. This is also
built around lazy.nvim, but, in comparison to LazyVim, is substantially reduced
in scope and only includes the most minimal setup to get a configuration based
around individual lua files in the `lua/plugins` subdirectory of the
configuration.

The trade-off here is that the editing experience will start a bit more complete
out of the box with LazyVim, but slightly less flexible depending on what you
are planning on doing with your configuration. On the flip-side, kickstart will
offer you greater flexibility on account of very little having been set
beforehand in the base distribution, but this does mean that every detail of
implementation is going to be handmade/bespoke. Moreover, you could also eschew
either of these options, and simply build your own setup completely from scratch
using lazy.nvim as the package managing base.

Presently, for the purposes of this configuration, I decided to go with the more
complete LazyVim, namely because I found myself rewriting many of the default
specifications that are given in LazyVim while initially testing the base
options. However, I remain on the fence. I certainly think that LazyVim is a
reasonable place to start, but I have run into some small issues related to
remapping certain selections of keys away from the default setup, nor have I
liked some of the default selections for certain plugins (cough cough,
`neo-tree`). With that said, it could be better to go for the fully-bespoke
specification offered through other options, but unfortunately this would also
mean I have to take the time to set up the additional keybindings and options
that are the defaults in LazyVim. Plus, I'd be missing out on some of that
pure Folke-wizardry, as they are clearly a master of Lua where I clearly am
not.

[ <!-- TODO --> ]:: # this is probably prosaically fine but not really that
helpful yet on account of the fact that it is missing all documentation bits that
might be useful.

---

## LazyVim Installation

LazyVim is conveniently packaged up as both a neovim plugin and a repository
starter template. The latter handles setting up the initial configuration
without already having a plugin manager installed, while the former handles
keeping the base system up-to-date and in-sync with the upstream source. LazyVim
is accessible on [GitHub](https://github.com/LazyVim/LazyVim), as is the
[starter template](https://github.com/LazyVim/starter) which was used to create
nightowl.nvim. Alternatively, this is all accessible through the [project
website](https://lazyvim.org), which naturally is also the home of documentation
for LazyVim.

After cloning the starter template to my local machine at the neovim
configuration home location (default `$XDG_CONFIG_HOME/nvim` ~
`$HOME/.config/nvim`), there was little
else to do except begin with the specifications for the plugins that I
wanted to include in this configuration.

## LazyVim Configuration: Quirks, Notes, and Specifications

LazyVim is a clean, straightforward, and relatively flexible base
implementation.

# Vimwiki

![](images/vimlogo-small.png) This repository contains a [Vimwiki][1] instance
using [Markdown][2] syntax backed by Git. HTML rendering is provided by
[MDwiki][3]; content may be viewed online using a traditional web server or
offline using a script (see [below](#Offline_Viewing)).

## Installation

To initialize a new wiki instance, a clone of this repository can be made to
simplify setup:

    $ git clone git://github.com/sstallion/vimwiki-skel.git vimwiki && cd vimwiki
    $ git remote set-url origin <repository>
    $ git push -u origin master

Once initialized, `install.sh` should be called to install MDwiki and create the
appropriate symlink under `$HOME`:

    $ sh install.sh [instance]

Finally, [Vimwiki][1] should be installed if it is not already.

## Configuration

At a minimum, the `vimwiki` plugin must be configured with the wiki instance
location by adding the following to your `.vimrc`:

    let g:vimwiki_list = [{'path': '~/.vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

If multiple instances are installed, they must be added to this list as well:

    let g:vimwiki_list = [{'path': '~/.vimwiki-home', 'syntax': 'markdown', 'ext': '.md'}]
                       \  {'path': '~/.vimwiki-work', 'syntax': 'markdown', 'ext': '.md'}]

It is advised to disable global extension support to avoid having all Markdown
files treated as if they were part of the wiki by adding the following to your
`.vimrc`:

    let g:vimwiki_global_ext = 0

For more detail, see: `:help g:vimwiki_global_ext`.

## Compatibility

By default, Vimwiki does not add a file extension to generated wiki links, which
is incompatible with MDwiki. PR [#529] addresses this issue by adding a new
option `g:vimwiki_markdown_link_ext` to include the file extension. To correct
this issue, add the following to your `.vimrc`:

    let g:vimwiki_markdown_link_ext = 1

[#529]: https://github.com/vimwiki/vimwiki/pull/529

## External Wikis

From time to time, it can be useful to reference wikis belonging to other
repositories. Fortunately, the `git-submodule(1)` mechanism can be used to
reference these repositories from the wiki instance:

    $ git submodule add <repository> external/<name>

Once added, simply reference the page by adding a link to your wiki:

    [Link Text](external/<name>/<page>.md)

## Offline Viewing

If you wish to view the wiki offline using a browser, a simple HTTP server can
be started locally by calling `serve.sh` in the repository root (requires Python
2.x):

    $ sh serve.sh [port]
    Serving HTTP on 0.0.0.0 port 8080 ...

Content may then be viewed by visiting http://localhost:8080/ using your
browser.

## Contributing

Pull requests are welcome! If a problem is encountered using this repository,
please file an issue on [GitHub][4].

[1]: https://vimwiki.github.io/
[2]: https://daringfireball.net/projects/markdown/syntax
[3]: https://dynalon.github.io/mdwiki/
[4]: https://github.com/sstallion/vimwiki-skel/issues

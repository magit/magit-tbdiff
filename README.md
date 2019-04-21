[![License GPL 3][badge-license]](https://www.gnu.org/licenses/gpl-3.0.txt)
[![MELPA](https://melpa.org/packages/magit-tbdiff-badge.svg)](https://melpa.org/#/magit-tbdiff)

Magit-tbdiff is a Magit interface to [git-tbdiff] and
[git-range-diff], subcommands for comparing two versions of a topic
branch (or more generally two ranges).  When Magit-tbdiff was created,
only git-tbdiff, a third-party extension, existed.  However, recent
versions of Git include a tbdiff-inspired range-diff subcommand.
Using range-diff is recommended, and it will be used by default if
detected.

The [commentary] in magit-tbdiff.el provides an overview of
Magit-tbdiff commands.

![Magit-tbdiff screenshot](static/screenshot.png)

[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg
[commentary]: https://github.com/magit/magit-tbdiff/blob/master/magit-tbdiff.el#L24
[announcement]: https://public-inbox.org/git/87ip2pfs19.fsf@linux-k42r.v.cablecom.net/
[git-tbdiff]: https://github.com/trast/tbdiff
[git-range-diff]: https://git-scm.com/docs/git-range-diff

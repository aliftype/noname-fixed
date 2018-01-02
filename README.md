NoName Fixed
============

An Arabic fixed width font, a fork from [ALM Fixed][1].

Changes
-------

1. A special variant, “NoName Fixed Terminal”, for terminals that do not
   support OpenType text layout, also with tighter line spacing.
2. Curly quotes are actually curly.
3. Better shape of *lam-alef* that does not look like a regular initial/medial
   *meem* plus a regular final *alef*.
4. Many fixes to wrong glyph shapes.
5. Remove glyph outlines from white space glyphs, they should be blank.
6. Better Greek and Cyrillic glyphs from `UMTypewriter-Regular.otf`.
7. Added ẞ.
8. Make `U+06E1` (ARABIC SMALL HIGH DOTLESS HEAD OF KHAH) look like the Quranic
   mark it is supposed to be, not a literal dotless head of *khah*.
9. Remove `locl` feature substitutions that substitute glyphs for some Unicode
   characters with glyphs for other characters. Fonts shouldn’t be in the
   business of muddying the underlining text encoding.

[1]: https://ctan.org/pkg/almfixed

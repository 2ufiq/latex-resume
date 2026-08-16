# AGENTS.md

## Build

```bash
make pdf    # runs xelatex twice (needed for cross-references)
make clean  # removes aux/log/pdf
```

Requires `xelatex` (TeX Live with `fontspec`, `sourcesanspro`, `roboto`, `fontawesome5`).

## Structure

- `resume.tex` — main entry, loads `russell.cls` and includes `cv/*.tex`
- `russell.cls` — custom class (colors, fonts, layout). **Do not edit lightly.**
- `cv/*.tex` — section content (experience, skills, publications, etc.)
- `fonts/` — local Roboto + FontAwesome fonts

## Gotchas

**Font weight looks grey, not black.** The class defines `\bodyfont` (regular) and `\bodyfontlight` (light). ALL style commands must use `\bodyfont` for consistent black text. The original class used `\bodyfontlight` in: `\descriptionstyle`, `\skillsetstyle`, `\paragraphstyle`, `\entrydatestyle`, `\entrylocationstyle`, `\subentrydatestyle`, `\subentrylocationstyle`, `\subdescriptionstyle`, `\honorlocationstyle`, `\lettertitlestyle`, `\letterdatestyle`, `\lettertextstyle`, `\letterenclosurestyle`, and `cvitems` env. All were changed to `\bodyfont`.

**Color overrides must use `\AtBeginDocument`.** The class sets `\colorlet{text}{darkgray}` etc. To override, wrap in `\AtBeginDocument{}` in `resume.tex` so definitions take effect after class loading.

**Two-pass build required.** XeLaTeX must run twice for cross-references and page layout to settle.

## CV Sections

Sections use different environments:
- `cvlistsection` — Projects, Blogs, Conferences (explicit `\color{text}`, `\bodyfont`)
- `cvitems` — Bullet points inside `\cventry` (experience, education)
- `cvskill` — Skills table
- `cvpublication` — Publications with auto-numbering

All use `\color{text}` and `\bodyfont` for consistent black text.

## Debugging: Grey Text (resolved)

**Symptom:** Skills, experience bullets grey. Projects/blogs black.

**Failed attempts:**
1. Added `\AtBeginDocument` color overrides → no change
2. Changed `\definecolor` to `\colorlet{text}{black}` → no change
3. Added explicit `\color{text}` to `cvitems`/`cvskill` → no change

**Root cause:** Font weight, not color. `\sourcesansprolight` vs `\sourcesanspro` — same `#000000` hex, light weight renders grey on screen.

**Pattern:** `cvlistsection` (Projects/Blogs) explicitly sets `\bodyfont`. `cvskill`/`cvitems`/`descriptionstyle` used `\bodyfontlight`.

**Fix:** Changed `\bodyfontlight` → `\bodyfont` in `\skillsetstyle`, `\descriptionstyle`, `\paragraphstyle`, `\entrydatestyle`, `\entrylocationstyle`, `\subentrydatestyle`, `\subentrylocationstyle`, `\subdescriptionstyle`, `\honorlocationstyle`, `\lettertitlestyle`, `\letterdatestyle`, `\lettertextstyle`, `\letterenclosurestyle`, and `cvitems` env.

**Lesson:** When text looks grey, check font weight before color definitions.

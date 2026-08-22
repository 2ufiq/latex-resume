# AGENTS.md

## Build

```bash
make resume    # builds Resume_Taufiq.pdf (2-pass xelatex)
make cv        # builds CV_Taufiq.pdf (2-pass xelatex)
make cv-clean  # builds CV_Taufiqul_Hauqe_Khan.pdf (2-pass xelatex)
make view      # builds resume + opens PDF
make clean     # removes all aux/log/pdf artifacts
```

Requires `xelatex` (TeX Live with `fontspec`, `sourcesanspro`, `roboto`, `fontawesome5`).

## Structure

- `russell.cls` — shared LaTeX class at repo root. **Do not edit lightly.** Both `resume/` and `full-profile/` use it via `TEXINPUTS=..:`.
- `fonts/` — shared Roboto + FontAwesome fonts (referenced as `../fonts/` from subfolders)
- `resume/` — concise resume (2 pages): `resume.tex` + `sections/*.tex`
- `full-profile/` — academic-style CV (4-5 pages): `cv.tex` + `sections/*.tex`
- `clean-profile/` — clean CV variant: `cv-clean.tex` + `sections/*.tex`

## Build mechanics

- `TEXINPUTS=..:` in Makefile lets subfolder tex files find `russell.cls` at repo root
- `-output-directory=..` puts PDF/artifacts at repo root (not inside subfolder)
- Two-pass xelatex is required for cross-references and page layout

## Gotchas

**Font weight looks grey, not black.** The class defines `\bodyfont` (regular) and `\bodyfontlight` (light). All style commands must use `\bodyfont` for consistent black text. The original class used `\bodyfontlight` in many style commands — all were changed to `\bodyfont`.

**Color overrides must use `\AtBeginDocument`.** The class sets `\colorlet{text}{darkgray}` etc. To override, wrap in `\AtBeginDocument{}` in the tex entry file so definitions take effect after class loading.

**resume vs full-profile color override style differs.** `resume/resume.tex` uses `\AtBeginDocument{}` for color overrides. `full-profile/cv.tex` uses direct `\definecolor` calls (no `\AtBeginDocument`). Both work but follow different patterns.

## CV Sections

Section environments in `russell.cls`:
- `cvlistsection` — Projects, Blogs, Conferences (explicit `\color{text}`, `\bodyfont`)
- `cvitems` — Bullet points inside `\cventry` (experience, education)
- `cvskill` — Skills table
- `cvpublication` — Publications with auto-numbering

All use `\color{text}` and `\bodyfont` for consistent black text.

# Open Research Workflow

A practical guide to reproducible research using Quarto, Positron, GitHub, and Zenodo — with realistic kōura ecology examples.

## Live site

[olivierraven.github.io/open-research-workflow](https://olivierraven.github.io/open-research-workflow)

## What this is

A step-by-step guide covering:

1. Project setup (Day 1)
2. The two-file Quarto approach (analysis.qmd + index.qmd)
3. Version control with Git in Positron
4. Zenodo archiving and DOI reservation
5. Giving reviewers access during peer review
6. Permanently locking your version at acceptance

## How to render locally

```r
# Install Quarto: https://quarto.org
# Then in the terminal:
quarto render
```

Or open in Positron and click Render.

## File structure

- `index.qmd` — landing page
- `01-setup.qmd` through `06-acceptance.qmd` — workflow pages
- `slides.qmd` — RevealJS presentation version
- `cheatsheet.qmd` — quick reference
- `styles.css` — website styling
- `slides-custom.scss` — presentation styling
- `.github/workflows/publish.yml` — GitHub Pages auto-deploy

## License

Content: CC BY 4.0 | Code: MIT

## Cite as

Raven, O.V. (2026). Open Research Workflow: A practical guide to 
reproducible research using Quarto, Positron, GitHub, and Zenodo. 
Zenodo. https://doi.org/10.5281/zenodo.XXXXXXX

## About

Written by [Olivier V. Raven](https://scienceecosystem.org) 
as part of PhD research on kōura ecology at the University of Waikato, 
Aotearoa New Zealand.

# Latex4ML

A toolkit for creating professional LaTeX Beamer presentations about Machine Learning topics, powered by Claude Code subagents.

## Project Structure

```
Latex4ML/
├── .claude/
│   └── agents/
│       └── presentation-creator.md   # Subagent for creating presentations
├── templates/
│   ├── beamer/
│   │   ├── minimal.tex               # Minimal Beamer template
│   │   ├── ml-standard.tex           # Standard ML presentation template
│   │   └── ml-research.tex           # Research paper presentation template
│   └── styles/
│       └── ml-theme.sty              # Custom Beamer theme
├── examples/
│   └── neural-networks-intro.tex     # Example presentation
├── scripts/
│   └── compile.sh                    # Compile .tex to PDF
└── CLAUDE.md
```

## Subagents

### presentation-creator

Specialized subagent for creating LaTeX Beamer presentations from scratch.

**Invoke with:** `/agent:presentation-creator`

**Capabilities:**
- Creates complete LaTeX Beamer `.tex` files from a topic description
- Generates structured slides: title, agenda, content, conclusions, references
- Supports ML-specific content: equations, algorithms, neural network diagrams (TikZ), plots
- Applies appropriate Beamer themes and color schemes
- Ensures all LaTeX syntax is valid and compilable

**Usage example:**
```
/agent:presentation-creator Create a 20-slide presentation on Transformer architectures
for a graduate audience. Include the attention mechanism, multi-head attention,
positional encoding, and BERT/GPT comparisons.
```

## Quick Start

### 1. Generate a presentation

```bash
# Invoke the subagent from Claude Code
/agent:presentation-creator <your topic and requirements>
```

### 2. Compile to PDF

```bash
./scripts/compile.sh presentations/my-presentation.tex
```

### 3. Requirements

- `texlive-full` or equivalent LaTeX distribution
- Beamer package (included in texlive-full)
- `pdflatex` or `lualatex`

## LaTeX Compilation

```bash
# Single pass
pdflatex my-presentation.tex

# Full pass (for references and bibliography)
pdflatex my-presentation.tex
bibtex my-presentation
pdflatex my-presentation.tex
pdflatex my-presentation.tex
```

## Conventions

- All presentations go in `presentations/` (created automatically)
- Templates in `templates/beamer/` serve as starting points
- Custom styles in `templates/styles/`
- Output PDFs are gitignored (`*.pdf`, `*.aux`, `*.log`, etc.)

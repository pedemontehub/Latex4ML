# Latex4ML

A toolkit for generating professional PowerPoint (`.pptx`) presentations about Machine Learning topics, powered by Claude Code subagents and `python-pptx`.

## Project Structure

```
Latex4ML/
├── .claude/
│   └── agents/
│       └── presentation-creator.md   # Subagent for creating presentations
├── templates/
│   └── python/
│       ├── helpers.py                # Reusable slide builders & color palette
│       └── minimal.py                # Minimal presentation starter template
├── examples/
│   └── neural_networks_intro.py      # Full example: Intro to Neural Networks (ES)
├── presentations/                    # Output directory (gitignored *.pptx)
├── scripts/
│   └── compile.sh                    # Run a .py script to produce its .pptx
├── requirements.txt
└── CLAUDE.md
```

## Subagent: presentation-creator

Specialized Claude Code subagent that creates complete `.pptx` presentations from scratch.

**Invoke with:** `/agent:presentation-creator`

**What it does:**
1. Gathers your requirements (topic, audience, slide count, language)
2. Proposes a numbered slide outline for your review
3. Generates a Python script in `presentations/<name>.py` using `python-pptx`
4. Executes the script to produce `presentations/<name>.pptx`

**Example:**
```
/agent:presentation-creator
Crea una presentación de 20 slides sobre Transformers y mecanismo de atención
para estudiantes de posgrado en español. Incluye diagramas de arquitectura,
la ecuación de atención scaled dot-product, y comparación BERT vs GPT.
```

## Quick Start

### 1. Install dependencies

```bash
pip install -r requirements.txt
```

### 2. Generate a presentation via the subagent

```
/agent:presentation-creator <your topic and requirements>
```

### 3. Or run an existing script directly

```bash
python examples/neural_networks_intro.py
# → examples/neural_networks_intro.pptx

./scripts/compile.sh presentations/my_talk.py
# → presentations/my_talk.pptx
```

### 4. Use the minimal template as a starting point

```bash
cp templates/python/minimal.py presentations/my_talk.py
# edit presentations/my_talk.py
python presentations/my_talk.py
```

## Color Palette

| Name       | RGB           | Use                        |
|------------|---------------|----------------------------|
| ML_BLUE    | (0, 82, 147)  | Headers, primary elements  |
| ML_ORANGE  | (220, 100, 0) | Highlights, alerts         |
| ML_GREEN   | (0, 130, 70)  | Success, results           |
| ML_GRAY    | (80, 80, 80)  | Secondary text             |
| ML_DARK    | (20, 30, 50)  | Dark backgrounds           |
| ML_LIGHT   | (235, 242, 251)| Slide backgrounds         |

## Available Slide Types (helpers.py)

| Function              | Description                                      |
|-----------------------|--------------------------------------------------|
| `slide_title()`       | Title slide with dark background                |
| `slide_agenda()`      | Numbered agenda / table of contents             |
| `slide_bullets()`     | Bulleted list slide with header bar             |
| `slide_two_col()`     | Two-column comparison layout                    |
| `slide_figure()`      | matplotlib figure + optional bullets            |
| `slide_thank_you()`   | Closing slide with contact info                 |
| `render_equation()`   | Render a LaTeX math string as a figure          |
| `header_bar()`        | Blue header bar (used by all content slides)    |
| `footer_bar()`        | Slide number footer                             |

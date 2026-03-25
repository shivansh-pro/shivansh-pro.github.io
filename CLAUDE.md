# Resume Repository Rules

## Pre-Commit Checklist

Before every commit that touches resume content or formatting:

1. **Render both outputs:** Run `quarto render resume.qmd` to generate both PDF and DOCX
2. **Run validation:** Run `python validate_resume.py` to verify ATS compatibility
3. **Commit output files:** Both `_site/Resume-ShivanshSingh.pdf` and `_site/Resume-ShivanshSingh.docx` must be committed alongside source changes
4. **Do not commit preview images:** Temporary preview PNGs (`_preview_*.png`, `_pdf_preview_*.png`) must not be committed

## Content Rules

- **No em dashes or en dashes.** Do not use `--` (Quarto renders this as an em dash) or Unicode em/en dash characters. Use hyphens (`-`), commas, colons, periods, or parentheses instead.
- **No phone number** on the resume.
- **No tables in PDF/DOCX output.** Tables are allowed in HTML-only sections (`content-visible when-format="html"`). ATS systems scramble table structure.
- **No special Unicode** that may break ATS parsers (smart quotes, em/en dashes). The middle dot (`·`) in Core Competencies is acceptable.
- **Date ranges use hyphens:** `Nov 2018 - Jul 2025`, not `Nov 2018 -- Jul 2025`.

## Formatting Rules

- **PDF (Typst):** 9pt font, US Letter, margins 0.4in top/bottom, 0.65in sides
- **PDF tables (if ever needed):** 9pt text, 8pt padding, 0.2pt stroke with `#e0e0e0`
- **DOCX:** Must use proper Heading styles (Heading 1, Heading 2, Heading 3) via `reference.docx` template. ATS uses heading styles for section detection.
- **Three-format pattern:** Each section header and project entry must have HTML, DOCX, and Typst variants using `content-visible when-format` blocks.

## ATS Compatibility

- DOCX is the primary ATS-facing format. PDF is for human readers.
- Avoid multi-column layouts, text boxes, images, and graphics in PDF/DOCX.
- Use standard section headers: Professional Summary, Professional Experience, Education, Certifications, Side Projects.
- The `validate_resume.py` script checks: file integrity, text extractability, required keywords, section headers, forbidden characters, and DOCX heading styles.

## File Structure

- `resume.qmd` - Source file (Quarto markdown)
- `reference.docx` - DOCX template (heading styles, formatting)
- `_typst-meta.typ` - Typst PDF metadata/formatting
- `_meta.html` - HTML metadata (OG tags, ATS metadata)
- `style.css` - HTML styling
- `validate_resume.py` - ATS validation script
- `_site/` - Generated output (PDF, DOCX, HTML)

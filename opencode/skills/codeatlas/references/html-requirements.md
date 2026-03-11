# HTML Requirements

Required:
- Single file only (`codeatlas.html`)
- Works from `file://.../codeatlas.html`
- No runtime `fetch()` for local files
- No external JS/CSS URLs via `<script src="http(s)://...">` or `<link href="http(s)://...">`

Data embedding pattern:

```html
<script id="codeatlas-data" type="application/json">
{...}
</script>
```

Rendering requirements:
- Project title and source
- Module list/cards
- Relation table/list with beginner explanation
- Layered relationship graph view (SVG) with relation legend
- Detailed project framework flow graph (SVG) below the relationship graph
- Framework details table showing cross-layer relation mix, example routes, and impact hints
- Basic search/filter on module name

Validation checklist:
- Browser opens without blank loading state
- Embedded JSON exists and is parsed
- At least one module and one relation are rendered when data exists
- HTML has no `fetch(` token
- HTML has no external script/link URL refs

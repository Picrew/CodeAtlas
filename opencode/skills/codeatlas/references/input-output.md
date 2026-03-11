# Input / Output Spec

## Input

- `github_url`: public GitHub repository URL
- or `local_repo_path`: local repository path

## Output folder

`outputs/skill-runs/<run-id>/`

## Output files

1. `module-map.json`

Schema:

```json
{
  "project": "string",
  "source": "string",
  "modules": [
    { "name": "string", "role": "string" }
  ],
  "relations": [
    {
      "source": "string",
      "target": "string",
      "type": "imports|depends_on|calls|runtime_flow",
      "reason": "string"
    }
  ],
  "entrypoints": ["string"]
}
```

2. `codeatlas.html`
- single-file local-open HTML
- embedded JSON data
- layered module relation SVG visualization
- project framework flow SVG visualization
- beginner-friendly relation explanation in table content

3. `summary.md`
- concise architecture summary
- key relationships
- uncertainty notes
- output paths

# evidence_gap_map_exploration
Exploring options for creating an evidence gap map interactive viz

Example here : [https://developmentevidence.3ieimpact.org/egm/transportation-evidence-gap-map](https://developmentevidence.3ieimpact.org/egm/transportation-evidence-gap-map)

Trying first to use Shiny + plotly
- scatter plot with labelled "boxes"
- columns for "outcomes" rows for "interventions"
- each box has a central point for the summary,
- additional points may give high, medium, low confidence reviews? or in progress reviews?
- this size of each point indicates the number in the review
- click/hover on point opens detailed tooltip, ideally the tooltip is another div with clickable entries for each paper

(Running in R Studio)
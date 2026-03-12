#set document(title: "Shivansh Singh - Senior Data Engineer", author: "Shivansh Singh")

// Shrink only the long architecture heading so it fits on one line
// Use a length-based check: only that heading is long enough to wrap
#show heading.where(level: 1): it => {
  let r = repr(it.body)
  if r.len() > 80 {
    block(above: 21pt)[
      #text(size: 14pt, weight: "bold")[#upper(it.body)]
      #v(-3pt)
      #line(length: 100%, stroke: 0.4pt + rgb("#d0d0d0"))
    ]
  } else {
    it
  }
}

// Make table styling cleaner: subtle outlines, full width
#set table(stroke: 0.2pt + rgb("#e0e0e0"))
#show table.cell.where(y: 0): set text(weight: "bold", size: 8.5pt)

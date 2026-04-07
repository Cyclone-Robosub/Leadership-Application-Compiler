#let first = sys.inputs.at("first", default: "[First]")
#let last = sys.inputs.at("last", default: "[Last]")
#let preferred = sys.inputs.at("preferred", default: "[Preferred]")
#let discord = sys.inputs.at("discord", default: "[Discord]")
#let pronouns = sys.inputs.at("pronouns", default: "[Pronouns]")
#let year = sys.inputs.at("year", default: "[Year]")
#let major = sys.inputs.at("major", default: "[Major]")
#let roles = sys.inputs.at("roles", default: "[Roles]")
#let essay-1 = sys.inputs.at("essay-1", default: lorem(300))
#let essay-2 = sys.inputs.at("essay-2", default: lorem(400))
#let essay-3 = sys.inputs.at("essay-3", default: lorem(300))
#let closing = sys.inputs.at("closing", default: lorem(15))

#let image-path = "resumes/" + preferred + "-" + last + "_RoboSub-Resume.pdf"

#let name = {
  first + if preferred == first {" "}
  else {" \"" + preferred + "\" "} + last
}

#set document(
  author: name,
  title: "Leadership Application for " + first + " \"" + preferred + "\" " + last
)



#set text(
  font: "Lato",
  11pt
)

// #show grid.cell.where(x: 1): set align(right)

#set page(
  paper: "us-letter",
  margin: (
    top: 1.5in,
    bottom: .5in,
    rest: 1in
  ),
  header: [
    #grid(
      align: top,
      columns: (1fr, auto),
      [
        #text(fill: blue.darken(50%), weight: "bold", name) \ 
        #emph[#pronouns] \
        #year #major
        // #discord
      ],
      [
        #roles
      ]
    )
  ]
)

// #set footnote(numbering: "*")
#set par(justify: true)


= Project Experience #footnote[Think of a time in which you took leadership over a technical project. What were some of the successes and challenges that you faced during the project? How did you approach said challenges, and what were the outcomes? 

Please use the opportunity to talk about the technical and/or administrative aspects of the project as well as your leadership. We are looking for evidence that you took ownership of a project and were an active decision maker up to its completion. ]

#essay-1

#pagebreak()
= Conflict Navigation #footnote[Discuss a time when you encountered conflict with a peer and how you overcame it. What tools did you use to navigate the conflict? What realizations helped lead to the resolution?

Here, we want to see that you are capable of working with others, even when you disagree. While our work is technical, it is common and expected that we become emotional, especially in high stress situations. What we want to know is how do you deal with that? 
]

#essay-2

#pagebreak()
= Project Proposal #footnote[Think of a project or mission that you would like to spearhead in RoboSub for the coming year. How have your previous experiences prepared you for this? What will you do to see the project to competition?

While the team is no longer in its infancy, we are always looking for new projects and ways improve team member experiences. If you have ever had an idea for what you want to do with the club, we want to hear it!

This is the place to mention any relevant skills or experiences that you think will make you a capable leader. This project doesn't have to be technically oriented, but rather suited to what you are good at. 
]

#essay-3

#page(
  height: auto,
  width: auto,
  margin: 0pt,
  header: none,
  image(image-path, page: 1)
)

// #pagebreak()
#if closing != none and closing != "\n" and closing != " "  [
  #set page(height: auto, margin: (bottom: 1in))
  = Closing Thoughts
  #closing
]
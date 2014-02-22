{Step} = zootorial

module.exports =
  id: "wise-tut"
  firstStep: "welcome"
  length: 9 
  steps:
    welcome: new Step
      number: 1
      header: t7e 'span', 'tutorial.welcome.header'
      details: t7e 'span', 'tutorial.welcome.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center center #canvas-container center center"
      next: "flipbook"

    flipbook: new Step
      number: 2
      header: t7e 'span', 'tutorial.flipbook.header'
      details: t7e 'span', 'tutorial.flipbook.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "left center #canvas-container .play right center"
      className: "arrow-left"
      next: { 'click button.play': 'explain1' }

    explain1: new Step
      number: 2
      header: t7e 'span', 'tutorial.explain1.header'
      details: t7e 'span', 'tutorial.explain1.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center top #question center bottom"
      next: 'explain2'

    explain2: new Step
      number: 3
      header: t7e 'span', 'tutorial.explain2.header'
      details: t7e 'span', 'tutorial.explain2.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center top #question center bottom"
      next: "scrub"

    scrub: new Step
      number: 4
      header: t7e 'span', 'tutorial.scrub.header'
      details: t7e 'span', 'tutorial.scrub.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center top #timeline center bottom"
      className: "arrow-up"
      next: {"mouseup #timeline input" : "survey"}

    survey: new Step
      number: 5
      header: t7e 'span', 'tutorial.survey.header'
      details: t7e 'span', 'tutorial.survey.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center top #timeline p:last-child center 1.8"
      className: "arrow-up"
      next: "good"

    good: new Step
      number: 5
      header: t7e 'span', 'tutorial.good.header'
      details: t7e 'span', 'tutorial.good.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center bottom #canvas-container center bottom"
      next: {"click #finish" : "guide"}

    guide: new Step
      number: 6
      header: t7e 'span', 'tutorial.guide.header'
      details: t7e 'span', 'tutorial.guide.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center top #guide center bottom"
      className: "arrow-up"
      next: {"click #guide" : -> "guide2"}

    guide2: new Step
      number: 7
      header: t7e 'span', 'tutorial.guide2.header'
      details: t7e 'span', 'tutorial.guide2.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "right top #classify right top"
      className: "arrow-left"
      next: {"click .close" : "talk"}

    talk: new Step
      number: 8
      header: t7e 'span', 'tutorial.talk.header'
      details: t7e 'span', 'tutorial.talk.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center top #talk center bottom"
      className: 'arrow-up'
      next: "end"

    end: new Step
      number: 9
      header: t7e 'span', 'tutorial.end.header'
      details: t7e 'span', 'tutorial.end.details'
      nextButton: t7e 'span', 'tutorial.nextButton'
      attachment: "center center #canvas-container center center"

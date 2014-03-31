{Step} = zootorial

module.exports =
  id: 'wise-callout'
  firstStep: "callout"
  length: 1
  steps:
    callout: new Step
      number: 1
      header: t7e 'span', 'tutorial.callout.header'
      details: t7e 'span', 'tutorial.callout.details'
      attachment: "center top #guide center bottom"
      className: "arrow-up"
      next: {"click #guide" : -> }

{Step} = zootorial

module.exports =
  id: "wise-tut"
  firstStep: "welcome"
  length: 5
  steps:
    welcome: new Step
      number: 1
      header: "Welcome to WISE ZOO"
      details: "Help us search for starts with hidden disks of dust around them, similar to the asteroid belt. These starts show us where to look for planetary systems, and teach us how they form."
      attachment: "center center #canvas-container center center"
      next: "flipbook"

    flipbook: new Step
      number: 2
      header: "Using the Interface"
      details: "We find new debris disk stars by looking at flipbooks of images of the star taken with different telescopes. You won't see a disk or ring directly. Click the Play button to start the flipbook."
      attachment: "right center #play left center"
      next: { 'click button#play': 'explain1' }

    explain1: new Step
      number: 2
      header: "Using the Interface"
      details: "The ideal debris disk star does not move around from image to image, does not break up into two or more objects. It's pure, clean, and round."
      attachemnt: "center top #canvas-container center bottom"
      next: 'explain2'

    explain2: new Step
      number: 3
      header: "Using the Interface"
      details: "On some frames in the flipbook you will see a red circle. For a star to be a debris disk. It's should be entirely contained within the circle."
      attachment: "center top #canvas-container center bottom"
      next: "scrub"

    scrub: new Step
      number: 4
      header: "The Scrub Bar"
      details: "Sometimes you'll need to look at individual frames more closely. You can use this scrub bar to move through images individually. Try it out by clicking and dragging it back a forth. Release the mouse button when you're done."
      attachment: "center top #timeline center bottom"
      next: {"mouseup #timeline input" : "good"}

    good: new Step
      number: 5
      header: "Classify"
      details: "After you watch the flipbook at least once. You can select a classification for the star. This is a good candidate since it is round and entirely contained within the circle. Go ahead selected 'Good Candidate' then click Finish."
      attachment: "center center #canvas-container center center"
      next: {"click #finish" : "guide"}

    guide: new Step
      number: 6
      header: "Guide"
      details: "There are a variety of reason that an object may not end up being a good candidate. We're interested in what some of bad subject are. We have example of all the possible classifications in a guide accessible by clicking on this button. Open it up!"
      attachment: "center top #guide center bottom"
      next: {"click #guide" : "guide2"}

    guide2: new Step
      number: 7
      header: "Guide"
      details: "To see a flipbook play through hover over it with your mouse. Don't forget to scroll all the way to the bottom of the guide to see all the examples. When you're done click 'Close Guide' to return the classification."
      attachment: "left center #example-guide right center"
      next: {"click .close" : "end"}

    end: new Step
      number: 8
      header: "Good Luck"
      details: "And that's all there is to it! Have fun classifying!"
      attachment: "center center #canvas-container center center"
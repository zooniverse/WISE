{Step} = zootorial

module.exports =
  id: "wise-tut"
  firstStep: "welcome"
  length: 9 
  steps:
    welcome: new Step
      number: 1
      header: "Welcome to Disk Detective"
      details: "Help us search for stars with hidden disks of dust around them, similar to the asteroid belt. These stars show us where to look for planetary systems and how they form."
      attachment: "center center #canvas-container center center"
      next: "flipbook"

    flipbook: new Step
      number: 2
      header: "Using the Interface"
      details: "We find new debris disk stars by looking at flipbooks of images of the star taken with different telescopes. You won't see a disk or ring directly. Click the Play button to start the flipbook."
      attachment: "left center #canvas-container .play right center"
      className: "arrow-left"
      next: { 'click button.play': 'explain1' }

    explain1: new Step
      number: 2
      header: "Using the Interface"
      details: "The ideal debris disk star does not move from image to image and does not break into two or more objects. It's pure, clean, and round-ish."
      attachment: "center top #question center bottom"
      next: 'explain2'

    explain2: new Step
      number: 3
      header: "Using the Interface"
      details: "For a star to be a debris disk, it should mostly be contained within the red circle."
      attachment: "center top #question center bottom"
      next: "scrub"

    scrub: new Step
      number: 4
      header: "The Scrub Bar"
      details: "Sometimes you'll need to look at individual frames more closely. You can use the scrub bar to move through images individually. Try it out by clicking and dragging it back and forth. Release the mouse button when you're done."
      attachment: "center top #timeline center bottom"
      className: "arrow-up"
      next: {"mouseup #timeline input" : "survey"}

    survey: new Step
      number: 5
      header: "Different Surveys"
      details: "When you watch through the flipbook, you should pay attention to what survey each image is from. You'll be looking for different problems in images from different surveys. For example non-circular objects in images from the DSS2 and 2 MASS surveys."
      attachment: "center top #timeline p:last-child center 1.8"
      className: "arrow-up"
      next: "good"

    good: new Step
      number: 5
      header: "Classify"
      details: "After you watch the flipbook at least once. You can select a classification for the star. This is a good candidate since it is round and entirely contained within the circle. Go ahead and select 'Good Candidate' then click 'Finish'."
      attachment: "center bottom #canvas-container center bottom"
      next: {"click #finish" : "guide"}

    guide: new Step
      number: 6
      header: "Guide"
      details: "There are a variety of reasons that an object may not end up being a good candidate. We're interested in what the bad subjects are. We have examples of all the possible classifications in a guide accessible by clicking on this button. Open it up!"
      attachment: "center top #guide center bottom"
      className: "arrow-up"
      next: {"click #guide" : -> "guide2"}

    guide2: new Step
      number: 7
      header: "Guide"
      details: "You can click 'Compare' next to an example to see how each image from the example next to the current subject. Don't forget to scroll all the way to the bottom of the guide to see all the examples. When you're done click 'Close Guide' to return to the classification."
      attachment: "right top #classify right top"
      className: "arrow-left"
      next: {"click .close" : "talk"}

    talk: new Step
      number: 8
      header: "Talk"
      details: "If you ever have a question about a subject, or want to talk about something interesting you saw, clicking here will take you to the discussion page for the current subject." 
      attachment: "center top #talk center bottom"
      className: 'arrow-up'
      next: "end"

    end: new Step
      number: 9
      header: "Good Luck"
      details: "And that's all there is to it! Have fun classifying!"
      attachment: "center center #canvas-container center center"

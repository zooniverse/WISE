PROJECT_NAME="Disk Detective"

module.exports = 
  title: PROJECT_NAME
  open_menu: "Menu"
  close_menu: "Close Menu"
  menu:
    classify: "Classify"
    science: "Science"
    about: "About"
    team: "Team"
    talk: "Discuss"
    blog: "Blog"
    share: "Share"

  guide:
    close: "Close Guide"
    keyboard: "Blah!"

  examples:
    close: "close"
    good: "An example of a good candidate--it looks round at all wavelengths and stays close to the plus sign."
    nebula: "The object is extended beyond the red circle in the WISE images. It's probably a Nebula."
    galaxy: "This is an example of a candidate that is not round in the DSS and 2MASS images. It's probably a Galaxy."
    shift: "This object moves between images. It is near the cross in the DSS and 2MASS images, but is more distant at longer ones. Sometimes you may see a very minute shift between frames. This is usually acceptable provided it looks like an otherwise good candidate."
    empty: "In the WISE images, there is no object in the red circle."
    multi: "This example has multiple objects in the DSS and 2MASS images"
    multiple: "This candidate has multiple problems--it is not round in the DSS and 2MASS image, and it extends beyond the circle in the WISE images. It also has multiple sources within the circle."

  index:
    header: "Find the Birthplace of Planets"
    intro: "Scientists are combing our galaxy looking for stars that could be harbouring planet-forming disks. They need your help to explain this puzzling part of stellar evolution!"
    classify: "Start Classifying!"
    sub_head1: "What is WISE looking for?"
    wise: "WISE is a NASA mission surveying the whole sky in infrared. This project is looking at stars to find dusty debris disks, similar to our asteroid field. These disks suggest that these stars are in the early stages of forming planetary systems. Learning more about these stars can tell us how our Solar System formed."
    sub_head2: "How will my contribution help?"
    computers: "Computers often confuse debris disks around stars with other astronomical objects. We need your help to sort out what stars actually have these disks from Galaxies and Nebulae.</p>"
    sub_head3: "Want to know more?"
    more: """You can learn more about the project on the <a href="#/about">About</a> and <a href="#/science">Science</a> pages. Or you can get to <a href="#/classify">classifying</a>.</p>"""

  classify:
    question: "What best describes the object you see? <small>(May select more than one)</small>"
    multi: "Multiple objects in the Red Circle"
    shift: "Changes position between images"
    extended: "Extended beyond circle in WISE images"
    empty: "Empty circle in WISE images"
    oval: "Not round in DSS2 and 2MASS images"
    good: "None of the Above/Good candidate"
    finish: "Finish"

  science_page: """<h2>Science</h2>
          <p>A few billion stars in our Galaxy host disks of rock, dust and sometimes gas that are nurseries for planets. Disk Detectives aims to find these special stars, surround by disks, so we can learn more about where planets are and how they form.</p>

<p>A star surrounded by a disk can be tricky to spot, but an important clue is that the radiation coming from the star is augmented by radiation coming from the disk, which glows in infrared light. NASA’s WISE mission surveyed the whole sky at infrared wavelengths to help find these disks, and the targets you will look at in Disk Detectives have all been pre-selected to be extra bright in infrared light.  In particular, the objects you will look at are anomalously bright at WISE’s “W4” band, which corresponds to light with a wavelength of 22 microns, about the width of very fine piece of human hair.</p>

<p>But disks are not the only kind of celestial object that glows bright in the infrared. Galaxies, asteroids, active galactic nuclei, and interstellar dust all emit at these wavelengths. So we need to examine all these disk candidates by eye to make sure they really are stars, and not some other kind of interloper.  </p>

<p>The disks we want to find fall into two categories: debris disks and YSO disks.</p>

<p><strong>YSO disks</strong> encircle young stars, less then about 5 million years old. “YSO” stands for “Young Stellar Object”.  These disks are mostly made of gas--the gas out of which giant planets like Jupiter form. They also contain some planetesimals and some dust, which radiates the infrared light we see.  Most YSO disks are found in or near clusters of young stars.</p>

<p><strong>Debris Disks</strong> resemble the asteroid belt or the Kuiper belt in our solar system. They take the form of belts of rocky and icy planetesimals, mixed in with dust produced when the planetesimals collide, but they contains little or no gas.  They are found around older stars, 5 milllion yearrs old and older. Some of the brightest stars in the sky, like Vega and Fomalhaut, host debris disks.</p>"""

  about_page: """<h2>About</h2>
<p>Finding planets around other stars is hard.  But there’s an important trick we can use to study extrasolar planets that also teaches us about where the planets come from.</p>

<p>Planets form from vast clouds of gas, dust, and chunks of rock---clouds that take the shape of disks with stars in the center.   We can find out where planets are forming and where planets probably remain today by searching for stars that are surrounded by these disks. Finding for these disks, called “debris disks” or “YSO disks” depending on their age and gas content,  has been a major quest of astronomers for the last three decades.</p>

<p>NASA’s WISE mission probably made images of thousands of debris disks and YSO disks.  Alas, these disks are buried among images of millions of other kinds of astronomical objects like galaxies and nebulae, and mixed in with images that contain artifacts created by the telescope itself.  In Disk Detectives, you will help astronomers find these disks, homes for extrasolar planets.</p>"""
 
  team_page: """<h2>Team</h2>
<h3>Scientists</h3>
<p><a href="http://www.stsci.edu/~debes">John Debes</a> is an ESA/AURA Astronomer at the Space Telescope Science Institute.  He works on the COS/STIS Instrument team and studies dust around stars both young and very old in the quest for understanding the nature of rocky planets around other stars.</p>

<p>Luisa Rebull is a Associate Research Astronomer at the Spitzer Science Center (SSC), Infrared Processing and Analysis Center (IPAC), California Institute of Technology. She does a lot of different things at IPAC, including working with the Spitzer and WISE archives, and running the NASA/IPAC Teacher Archive Research Project (NITARP), which partners small groups of educators with a research astronomer for a year-long research project.</p>

<p>Deborah Padgett is a NASA Research Astrophysicist at the Goddard Space Flight Center. She is a science team member for the Wide-field Infrared Survey Explorer (WISE). Her primary science interests are the evolution of dusty disks around young stars and how they become the diversity of worlds we are starting to detect around other stars.</p>

<p>Kevin Schawinski is an Assistant Professor at the ETH Zurich in Switzerland. He works on galaxies, black holes and has been with the Zooniverse since the beginning. </p>

<p><a href="http://asd.gsfc.nasa.gov/Marc.Kuchner/">Marc Kuchner</a>, an astrophysicist at NASA Goddard Space Flight Center, loves to look at pictures of planetary systems and make models explaining what they look like.  Kuchner got his PhD from Caltech in 2001 and went on to study at Harvard-Smithsonian Center for Astrophysics and Princeton.  He's known for introducing the world to Water Worlds and Carbon Planets, and for inventing optics for planet finding that will be part of the James Webb Space Telescope.</p>

<p><a href="http://asd.gsfc.nasa.gov/Michael.McElwain/">Michael McElwain</a> is a research astrophysicist at NASA’s Goddard Space Flight Center in Greenbelt, MD.  His research focuses on directly imaging exoplanets and their circumstellar disks to improve our understanding of planet formation.  Michael is also designing new science cameras for a next generation space mission to find life on Earth-like planets.</p>

<h3>Developers</h3>
<p>Edward Paget joined Adler's Zooniverse Team as a software developer in August 2012. He previously worked as a freelance programmer and photographer. Ed graduated from Northwestern University with a major in Radio/TV/Film.</p>

<p>Heath van Singel is the UX/UI Designer for projects at the Zooniverse where he works to craft thoughtful and engaging user experiences. Apart from design Heath also enjoys illustration, a good sci-fi or fantasy novel, and trips back to Michigan.</p>"""

  footer:
    text: "The Zooniverse is a collection of web-based Citizen Science projects that use the efforts of volunteers to help researchers deal with the flood of data that confronts them."
    button: "Visit Zooniverse.org"

module.exports = 
  menu:
    open_menu: "Menu"
    close_menu: "Close Menu"
    classify: "Classify"
    science: "Science"
    about: "About"
    team: "Team"
    talk: "Talk"
    blog: "Blog"
    share: "Share"
    stats: """You've made <span class="session-count"></span> classifications this session<span class="total"> and <span class="total-count"></span> in total<span>.
      """

  index:
    header: "We need your help to discover the birthplace of planets in never-before seen data!"
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
    shift: "Object Moves Off the Crosshairs"
    extended: "Extended beyond circle in WISE images"
    empty: "Empty circle in WISE images"
    oval: "Not round in DSS2 or 2MASS images"
    good: "None of the Above/Good candidate"
    finish: "Finish"
    pull_left: "Shorter"
    pull_right: "Longer"
    keyboard_shortcuts: "Keyboard Shortcuts"

  guide:
    title: "Spotter's Guide"
    close: "Close Guide"
    compare: "Compare"
    subject: "Subject"
    playback:
      header: "Playback"
      options:
        play_pause: "<strong>Space:</strong> Play/Pause"
        loop: "<strong>l:</strong> Loop"
        next_frame: "<strong>Up Arrow:</strong> Next Frame"
        previous_frame: "<strong>Down Arrow:</strong> Previous Frame"
    classify:
      header: "Classifying"
      options:
        mark_multiple: "<strong>1:</strong> Mark Multiple Sources"
        mark_shifting: "<strong>2:</strong> Mark Shifting Source"
        mark_extended: "<strong>3:</strong> Mark Extended Source"
        mark_empty: "<strong>4:</strong> Mark Empty Source"
        mark_non_round: "<strong>5:</strong> Mark Non-round Source"
        mark_good: "<strong>6:</strong> Mark Good Source"
        submit: "<strong>Enter:</strong> Submit Classification"
    interface:
      header: "Interface"
      options:
        toggle_guide: "<strong>g:</strong> Toggle Guide"
        start_tutorial: "<strong>t:</strong> Start Tutorial"
        toggle_favorite: "<strong>f:</strong> Toggle Favorite"

  examples:
    close: "close"
    good: 
      label: "Good Candidate"
      description: "An example of a good candidate--it looks round-ish at all wavelengths and stays close to the plus sign."
    good_artifact:
      label: "Good Candidate (with artifact)"
      description: "Another example of a good candidate. It is round in all wavelengths, but has a cross pattern caused by the telescope."
    nebula:
      label: "Extended Example (Nebula)"
      description: "The object is extended beyond the red circle in the WISE images. It's probably a Nebula."
    galaxy:
      label: "Non-Round Target (Galaxy)"
      description: "This is an example of a candidate that is not round in the DSS or 2MASS images. It's probably a Galaxy."
    shift:
      label: "Shifting Subject"
      description: "This object moves substantially between images. It is on the crosshairs in the DSS2 and 2MASS images, but off the crosshairs in the WISE 4 image."
    multi:
      label: "Multi Objects"
      description: "This example has multiple objects in the DSS and 2MASS images"
    multiple:
      label: "Multiple Problems"
      description: "This candidate has multiple problems--it is not round in the DSS and 2MASS image, and it extends beyond the circle in the WISE images. It also has multiple sources within the circle."

  tutorial:
    nextButton: "Continue"
    welcome:
      header: "Welcome to Disk Detective"
      details: "Help us search for stars with hidden disks of dust around them, similar to the asteroid belt. These stars show us where to look for planetary systems and how they form."
    flipbook:
      header: "Using the Interface"
      details: "We find new debris disk stars by looking at flipbooks of images of the star taken with different telescopes. You won't see a disk or ring directly.<br><br>Click the Play button to start the flipbook."
    explain1:
      header: "Using the Interface"
      details: "The ideal debris disk star does not move from image to image and does not break into two or more objects. It is a single mostly round source."
    explain2:
      header: "Using the Interface"
      details: "For a star to have a debris disk, it should mostly be contained within the red circle."
    scrub:
      header: "The Scrub Bar"
      details: "Sometimes you'll need to look at individual frames more closely. You can use the scrub bar to move through images individually.<br><br>Try it out by clicking and dragging it back and forth. Release the mouse button when you're done."
    survey:
      header: "Different Surveys"
      details: "As you go through the flipbook, you should pay attention to what survey each image is from. You'll be looking for different features in images from different surveys. For example, non-circular objects in images from the DSS2 and 2MASS surveys is a sign that it's not a disk."
    good:
      header: "Classify"
      details: "After you watch the flipbook at least once, you can select a classification for the star. This is a good candidate since it is round and entirely contained within the circle. Go ahead and select 'None of the Above/Good Candidate', then click 'Finish'."
    guide:
      header: "Guide"
      details: "There are a variety of reasons that an object may not end up being a good candidate. We're interested in what the bad subjects are. We have examples of all the possible classifications in a guide accessible by clicking on this button. Open it up!"
    guide1: 
      header: "Source Artifacts"
      details: "Some good sources may have a cross-like artifact caused by the lens of the telescope viewing them. They're stil good candidates!"
    guide2:
      header: "Guide"
      details: "You can click 'Compare' to see an example image for that classification next to the current subject. Don't forget to scroll all the way to the bottom of the guide to see all the examples. When you're done, click 'Close Guide' to return to the classification."
    talk:
      header: "Talk"
      details: "If you ever have a question about a subject, or want to talk about something interesting you saw, clicking here will take you to the discussion page for the current subject." 
    end:
      header: "Good Luck"
      details: "And that's all there is to it! Have fun classifying!"
    callout:
      header: "New Items in the Guide!"
      details: "We've added another example of a good candidate to the guide. Check it out!"

  science_page:
    header: "Looking for the homes of planets..."
    intro_1: "Planets form and grow in rotating disks of gas, dust, and chunks of rock around young stars. Sometimes disks of rock and dust persist in a planetary system throughout the life of the star. Finding these disks, birthplaces and homes of planets, has been a major quest of astronomers for the last three decades. In Disk Detective, you can join us on this quest."
    intro_2: """A star surrounded by a disk can be tricky to spot, but an important clue is that the radiation coming from the star is augmented by radiation from the dust in the disk.  A NASA satellite mission called <a href="http://www.nasa.gov/mission_pages/WISE/main/">WISE (Wide-Field Infrared Survey Explorer)</a> has <a href="http://wise2.ipac.caltech.edu/docs/release/allwise/">just finished making maps</a> of the entire sky in mid-infrared wavelengths--the most powerful survey for dusty disks ever made. These maps likely contain images of thousands of new disks, ready to be discovered amongst the thousands of galaxies, nebulae, and other objects"""
    intro_3: "The disks we aim to find fall into roughly two categories: debris disks and Young Stellar Object (YSO) disks. Both YSO disks and debris disks contain large amounts of dust, so they both shine brightly in infrared wavelengths. We hope you join us in the hunt!"
    yso_disks:
      title: "YSO Disks"
      block_1: """“YSO” stands for “Young Stellar Object”.  These young stars, generally less than five million years old and often encircled by disks, are mostly found in clusters. Their disks are mostly made of gas--the gas out of which giant planets like Jupiter form. They also contain some planetesimals and some dust, which radiates the infrared light we see."""
      block_2: """Here is a close-up shot of a YSO disk named <a href="http://adsabs.harvard.edu/abs/1996ApJ...473..437B">“HH 30”</a> made by the Hubble Space Telescope.  The disk is oriented edge-on, so what we see is a dark band of dust between two cones of light from the curved disk surfaces. A jet of gas, colored bright green here, flows out of the disk plane."""
      block_3: """The WISE images you will look at won’t have this much detail; the disks you will see will be contained in a single point of light.  But the disk candidates that you help find will eventually provide targets for Hubble and for other telescopes, like NASA’s <a href="http://www.jwst.nasa.gov/">James Webb Space Telescope</a> which can make more spectacular images like the HH 30 image."""
    debris_disks:
      title: "Debris Disks"
      block_1: "Debris Disks resemble the asteroid belt or the Kuiper belt in our solar system, though they can be much more massive. They take the form of belts of rocky and icy planetesimals, mixed in with dust produced when the planetesimals collide, but they contains little or no gas.  They are found around older stars, 5 million years old and older. Some of the brightest stars in the sky, like Vega and Fomalhaut, host debris disks."
      block_2: """The Hubble Space Telescope has also captured spectacular images of debris disks. like the <a href="http://arxiv.org/abs/0811.1994">one around Fomalhaut</a> shown here. Fomalhaut is much closer to the Earth than HH 30, so this image reveals even more details than the HH 30 image; it shows that the debris forms a narrow eccentric ring. The shape of this ring has led astronomers to believe that there are hidden planets in the system sculpting the ring.  Again, you won’t see images like this in Disk Detective. But your work will help us take more pictures like this of disks with future telescopes."""
    call_to_action:
      title: "We need YOUR Help"
      block_1: "Disks are not the only kind of celestial object that glows bright in the infrared. Galaxies, asteroids, active galactic nuclei, and interstellar clouds of dust all emit at these wavelengths. Computer algorithms designed to automatically search for disks are easily thrown off by these sources of confusion, so we need to examine all these disk candidates by eye to make sure they really are stars with disks, and not some other kind of interloper.  Also, computer programs can only detect what we tell them to measure.  But you can do much more than that. With a large all-sky data set and your curiosity, the possibilities for unexpected discoveries are vast."
    about_the_images:
      title: "The Images"
      block_1: "NASA’s WISE mission surveyed the whole sky in four different infrared wavelengths. The targets you will look at in Disk Detective have all been pre-selected to be extra bright in infrared light.  In particular, the objects you will look at are anomalously bright at WISE’s “W4” band, which corresponds to light with a wavelength of 22 microns, about the width of very fine piece of human hair."
      block_2: """You will see mid-infrared images from WISE, and also images of the same sources take at near-infrared and optical wavelengths. The optical images, and some of the near-infrared images come from the <a href="http://archive.stsci.edu/dss/index.html">Digitized Sky Survey (DSS2)</a>, a collection of digital images from the <a href="http://www.astro.caltech.edu/palomar/sot.html">Palomar Observatory</a> and the <a href="http://www.aao.gov.au/ukst/">Anglo-Australian Observatory</a>. The rest of the near-infrared images come from the <a href="http://www.ipac.caltech.edu/2mass/">Two Micron All Sky Survey (2MASS)</a> which used two automated 1.3 meter telescopes one at Mt. Hopkins, AZ, and one at <a href="http://www.ctio.noao.edu/noao/">Cerro Tololo Inter-American Observatory (CTIO)</a>, Chile."""
      block_3: "Looking at each of these images is important because they help us see what kinds of other objects are potentially contaminating our search. But another interesting way to examine the same data is to plot how bright these sources as a function of wavelength.  A plot like this, a crude kind of spectrum, is called a “Spectral Energy Distribution” or “SED” for short.   When you click on the SED button, you will see the SED for the source you just looked at.  The quantity plotted, “lambda f lambda”, tells you the relative amount of power coming from the object at each wavelength, from about 1 to 22 microns."
    your_work:
      title: "What your classifications do"
      block_1: """We will try to directly image extrasolar planets around the closest and brightest disks you find using large telescopes like the Hubble Space Telescope and the James Webb Space Telescope. For example, the image above shows the HR 8799 planetary system, imaged with the Gemini North telescope by <a href="http://arxiv.org/abs/0811.2606">Christian Marois et al.</a>  Before these planets were discovered, HR 8799 was considered to be a prime hunting ground for planets because of its debris disk."""
      block_2: """For other disks, we will make images like the ones above that teach us about the environment where planets form. Why are these disks asymmetric?  What causes planets to migrate around inside disks? Those are some of the questions images like these can help answer. To see more images of disks up close, go to <a href="http://www.circumstellardisks.org/">cirumstellardisks.org</a>."""
      block_3: "Other candidates will be part of a census of stars that we will follow-up with smaller telescopes to understand the distribution of disks in the Galaxy and as a function of stellar age and stellar mass. An important reason for such a census is the possibility of identifying disks in unusual places. For example, most YSO disks are found in or near clusters of young stars; our own solar system probably formed in such an environment. But in Disk Detective, you may be able to identify some YSOs outside of these typical locations. Likewise, most known debris disks orbit stars that are similar to our sun, in terms of the stage of the stellar life cycle they are in. But you may find debris disks in the WISE data set around stars much more evolved than our own sun, helping astronomers understand the prospects for life around these stars and distant future of our own solar system."

  about_page:
    title: "About"
    block_1: "Finding planets around other stars is hard. But there’s an important trick we can use to study extrasolar planets that also teaches us about where the planets come from."
    block_2: "Planets form from vast clouds of gas, dust, and chunks of rock---clouds that take the shape of disks with stars in the center. We can find out where planets are forming and where planets probably remain today by searching for stars that are surrounded by these disks. Finding these disks, called “debris disks” or “YSO disks” depending on their age and gas content, has been a major quest of astronomers for the last three decades."
    block_3: "NASA’s WISE mission probably made images of thousands of debris disks and YSO disks. Alas, these disks are buried among images of millions of other kinds of astronomical objects like galaxies and nebulae, and mixed in with images that contain artifacts created by the telescope itself. In Disk Detective, you will help astronomers find these disks, homes for extrasolar planets."
    block_4: """Disk Detective is the first NASA led and funded Zooniverse project. It is also the first NASA led and funded crowdsourcing project whose main goal is to produce publishable scientific results. It was built using seed money from NASA's Science Innovation Fund. See the White House’s second <a href="http://www.whitehouse.gov/blog/2013/12/06/united-states-releases-its-second-open-government-national-action-plan">Open Government National Action Plan</a> for more information on the U.S. federal government’s commitment to crowdsourcing and open data."""
    block_5: """<img src="img/nasa_logo.gif" height="150" alt="NASA Logo" />This material is based upon work supported by NASA under grant number NNX13AG53G. Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Aeronautics and Space Administration (NASA)."""
    image_credits: "Image Credits:"
    credits_1: "This project makes use of data products from the Wide-field Infrared Survey Explorer (WISE), the Two Micron All Sky Survey (2MASS), the Digitized Sky Survey (DSS) and the Sloan Digital Sky Survey (SDSS)."
    credits_2: "The Wide-field Infrared Survey Explorer (WISE) is a joint project of the University of California, Los Angeles, and the Jet Propulsion Laboratory/California Institute of Technology, and NEOWISE, which is a project of the Jet Propulsion Laboratory/California Institute of Technology. WISE and NEOWISE are funded by the National Aeronautics and Space Administration."
    credits_3: "The Two Micron All Sky Survey is a joint project of the University of Massachusetts and the Infrared Processing and Analysis Center/California Institute of Technology, funded by the National Aeronautics and Space Administration and the National Science Foundation."
    credits_4: "The Digitized Sky Survey was produced at the Space Telescope Science Institute under U.S. Government grant NAG W-2166. The images of these surveys are based on photographic data obtained using the Oschin Schmidt Telescope on Palomar Mountain and the UK Schmidt Telescope. The plates were processed into the present compressed digital form with the permission of these institutions."
    credits_5: "Funding for the SDSS and SDSS-II has been provided by the Alfred P. Sloan Foundation, the Participating Institutions, the National Science Foundation, the U.S. Department of Energy, the National Aeronautics and Space Administration, the Japanese Monbukagakusho, the Max Planck Society, and the Higher Education Funding Council for England. The SDSS Web Site is http://www.sdss.org/.  The SDSS is managed by the Astrophysical Research Consortium for the Participating Institutions. The Participating Institutions are the American Museum of Natural History, Astrophysical Institute Potsdam, University of Basel, University of Cambridge, Case Western Reserve University, University of Chicago, Drexel University, Fermilab, the Institute for Advanced Study, the Japan Participation Group, Johns Hopkins University, the Joint Institute for Nuclear Astrophysics, the Kavli Institute for Particle Astrophysics and Cosmology, the Korean Scientist Group, the Chinese Academy of Sciences (LAMOST), Los Alamos National Laboratory, the Max-Planck-Institute for Astronomy (MPIA), the Max-Planck-Institute for Astrophysics (MPA), New Mexico State University, Ohio State University, University of Pittsburgh, University of Portsmouth, Princeton University, the United States Naval Observatory, and the University of Washington."
    irsa_credit: "This research has made use of the NASA/ IPAC Infrared Science Archive, which is operated by the Jet Propulsion Laboratory, California Institute of Technology, under contract with the National Aeronautics and Space Administration."

  team_page:
    title: "Team"
    scientists:
      title: "Scientists"
      marc_kuchner: """<a href="http://en.wikipedia.org/wiki/Marc_Kuchner">Marc Kuchner (PI)</a>, an astrophysicist at NASA Goddard Space Flight Center, loves to look at pictures of planetary systems and make models explaining what they look like. Kuchner earned his PhD from Caltech in 2001 and went on to study at Harvard-Smithsonian Center for Astrophysics and Princeton. He's known for introducing the world to Water Worlds and Carbon Planets, and for inventing optics for planet finding that will be part of the James Webb Space Telescope."""
      john_debes: """<a href="http://www.stsci.edu/~debes">John Debes</a> is an ESA/AURA Astronomer at the Space Telescope Science Institute.  He works on the COS/STIS Instrument team and studies dust around stars both young and very old in the quest for understanding the nature of rocky planets around other stars."""
      michael_mcelwain: """<a href="http://asd.gsfc.nasa.gov/Michael.McElwain/">Michael McElwain</a> is a research astrophysicist at NASA’s Goddard Space Flight Center in Greenbelt, MD.  His research focuses on directly imaging exoplanets and their circumstellar disks to improve our understanding of planet formation.  Michael is also designing new science cameras for a next generation space mission to find life on Earth-like planets."""
      deborah_padgett: """<a href="http://science.gsfc.nasa.gov/sed/index.cfm?fuseAction=people.jumpBio&&iPhonebookId=31795 ">Deborah Padgett</a> is a NASA Research Astrophysicist at the Goddard Space Flight Center. She is a science team member for the Wide-field Infrared Survey Explorer (WISE). Her primary science interests are the evolution of dusty disks around young stars and how they become the diversity of worlds we are starting to detect around other stars."""
      luisa_rebull: """<a href="http://web.ipac.caltech.edu/staff/rebull/">Luisa Rebull</a> is a Associate Research Astronomer at the Spitzer Science Center (SSC), Infrared Processing and Analysis Center (IPAC), California Institute of Technology. She does a lot of different things at IPAC, including working with the Spitzer and WISE archives, and running the NASA/IPAC Teacher Archive Research Project (NITARP), which partners small groups of educators with a research astronomer for a year-long research project."""
      kevin_schawinski: """<a href="http://www.astro.ethz.ch/people/kevinsc">Kevin Schawinski</a> is an Assistant Professor at the ETH Zurich in Switzerland. He works on galaxies, black holes and has been with the Zooniverse since the beginning."""
      thayne_currie: """<a href="http://www.astro.utoronto.ca/~currie">Thayne Currie</a> is currently a McLean Postdoctoral Fellow in the Department of Astronomy and Astrophysics at the University of Toronoto. His research primarily focuses on directly imaging and characterizing young extrasolar planets around nearby stars, many of which are surrounded by debris disks like those we seek to identify from Disk Detective."""
      alissa_bans: """<a href="http://astro.uchicago.edu/~abans/index.html">Alissa Bans</a> received her PhD in Astronomy and Astrophysics from the University of Chicago, and is currently a postdoctoral scholar at the Adler Planetarium. Her research focuses on how solar systems form and evolve, particularly she focuses on the role of large-scale magnetic fields and also matching theory with observations. In addition to astronomy research, part of her role at the Adler Planetarium is engaging the public through education and outreach, including working with Zooniverse citizen science projects."""
    developers:
      title: "Developers"
      edward_paget: """<a href="http://twitter.com/edpaget">Edward Paget</a> joined Adler's Zooniverse Team as a software developer in August 2012. He previously worked as a freelance programmer and photographer. Ed graduated from Northwestern University with a major in Radio/TV/Film."""
      heath_van_singel: """<a href="https://twitter.com/heathvs">Heath van Singel</a> is the UX/UI Designer for projects at the Zooniverse where he works to craft thoughtful and engaging user experiences. Apart from design Heath also enjoys illustration, a good sci-fi or fantasy novel, and trips back to Michigan."""

  footer:
    text: "The Zooniverse is a collection of web-based Citizen Science projects that use the efforts of volunteers to help researchers deal with the flood of data that confronts them."
    button: "Visit Zooniverse.org"

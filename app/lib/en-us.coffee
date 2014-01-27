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
    compare: "Compare"
    playback: """<h4>Playback</h4>
            <ul>
              <li><strong>Space:</strong> Play/Pause</li>
              <li><strong>l:</strong> Loop</li>
              <li><strong>Up Arrow:</strong> Next Frame</li>
              <li><strong>Down Arrow:</strong> Previous Frame</li>
            </ul>"""
    classify: """ 
            <h4>Classifying</h4>
            <ul>
              <li><strong>1:</strong> Mark Multiple Sources</li>
              <li><strong>2:</strong> Mark Shifting Source</li>
              <li><strong>3:</strong> Mark Extended Source</li>
              <li><strong>4:</strong> Mark Empty Source</li>
              <li><strong>5:</strong> Mark Non-round Source</li>
              <li><strong>6:</strong> Mark Good Source</li>
              <li><strong>Enter:</strong> Submit Classification</li>
            </ul>
    """
    interface:"""
            <h4>Interface</h4>
            <ul>
              <li><strong>g:</strong> Toggle Guide</li>
              <li><strong>t:</strong> Start Tutorial</li>
              <li><strong>f:</strong> Toggle Favorite</li>
            </ul>
    """
  examples:
    close: "close"
    good: "An example of a good candidate--it looks round-ish at all wavelengths and stays close to the plus sign."
    nebula: "The object is extended beyond the red circle in the WISE images. It's probably a Nebula."
    galaxy: "This is an example of a candidate that is not round in the DSS or 2MASS images. It's probably a Galaxy."
    shift: "This object moves substantially between images. It is on the crosshairs in the DSS2 and 2MASS images, but off the crosshairs in the WISE 4 image."
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
    shift: "Object Moves Off the Crosshairs"
    extended: "Extended beyond circle in WISE images"
    empty: "Empty circle in WISE images"
    oval: "Not round in DSS2 or 2MASS images"
    good: "None of the Above/Good candidate"
    finish: "Finish"

  science_page: """<h2>Science</h2>
          <p>A few billion stars in our Galaxy host disks of rock, dust and sometimes gas that are nurseries for planets. Disk Detectives aims to find these special stars, surround by disks, so we can learn more about where planets are and how they form.</p>

<p>A star surrounded by a disk can be tricky to spot, but an important clue is that the radiation coming from the star is augmented by radiation coming from the disk, which glows in infrared light. NASA’s WISE mission surveyed the whole sky at infrared wavelengths to help find these disks, and the targets you will look at in Disk Detective have all been pre-selected to be extra bright in infrared light.  In particular, the objects you will look at are anomalously bright at WISE’s “W4” band, which corresponds to light with a wavelength of 22 microns, about the width of very fine piece of human hair.</p>

<p>But disks are not the only kind of celestial object that glows bright in the infrared. Galaxies, asteroids, active galactic nuclei, and interstellar dust all emit at these wavelengths. So we need to examine all these disk candidates by eye to make sure they really are stars, and not some other kind of interloper.  </p>

<p>The disks we want to find fall into two categories: debris disks and YSO disks.</p>

<p><strong>YSO disks</strong> encircle young stars, less then about 5 million years old. “YSO” stands for “Young Stellar Object”.  These disks are mostly made of gas--the gas out of which giant planets like Jupiter form. They also contain some planetesimals and some dust, which radiates the infrared light we see.  Most YSO disks are found in or near clusters of young stars.</p>

<p><strong>Debris Disks</strong> resemble the asteroid belt or the Kuiper belt in our solar system. They take the form of belts of rocky and icy planetesimals, mixed in with dust produced when the planetesimals collide, but they contains little or no gas.  They are found around older stars, 5 milllion yearrs old and older. Some of the brightest stars in the sky, like Vega and Fomalhaut, host debris disks.</p>"""

  about_page: """<h2>About</h2>
<p>Finding planets around other stars is hard.  But there’s an important trick we can use to study extrasolar planets that also teaches us about where the planets come from.</p>

<p>Planets form from vast clouds of gas, dust, and chunks of rock---clouds that take the shape of disks with stars in the center.   We can find out where planets are forming and where planets probably remain today by searching for stars that are surrounded by these disks. Finding these disks, called “debris disks” or “YSO disks” depending on their age and gas content,  has been a major quest of astronomers for the last three decades.</p>

<p>NASA’s WISE mission probably made images of thousands of debris disks and YSO disks.  Alas, these disks are buried among images of millions of other kinds of astronomical objects like galaxies and nebulae, and mixed in with images that contain artifacts created by the telescope itself.  In Disk Detective, you will help astronomers find these disks, homes for extrasolar planets.</p>

<p>Disk Detective is the first NASA led and funded Zooniverse project. It is also the first NASA led and funded crowdsourcing project whose main goal is to produce publishable scientific results. It was built using seed money from NASA's Science Innovation Fund. See the White House’s second <a href="http://www.whitehouse.gov/blog/2013/12/06/united-states-releases-its-second-open-government-national-action-plan">Open Government National Action Plan</a>for more information on the U.S. federal government’s commitment to crowdsourcing and open data.</p>

<p><img src="img/nasa_logo.gif" height="150" alt="NASA Logo" />This material is based upon work supported by NASA under grant number NNX13AG53G. Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Aeronautics and Space Administration (NASA).</p>

<h3>Image Credits:</h3>
<p>This project makes use of data products from the Wide-field Infrared Survey Explorer (WISE), the Two Micron All Sky Survey (2MASS), the Digitized Sky Syrvey (DSS) and the Sloan Digital Sky Survey (SDSS).</p>

<p>The Wide-field Infrared Survey Explorer (WISE) is a joint project of the University of California, Los Angeles, and the Jet Propulsion Laboratory/California Institute of Technology, and NEOWISE, which is a project of the Jet Propulsion Laboratory/California Institute of Technology. WISE and NEOWISE are funded by the National Aeronautics and Space Administration.</p>

<p>The Two Micron All Sky Survey is a joint project of the University of Massachusetts and the Infrared Processing and Analysis Center/California Institute of Technology, funded by the National Aeronautics and Space Administration and the National Science Foundation.</p>

<p>The Digitized Sky Survey was produced at the Space Telescope Science Institute under U.S. Government grant NAG W-2166. The images of these surveys are based on photographic data obtained using the Oschin Schmidt Telescope on Palomar Mountain and the UK Schmidt Telescope. The plates were processed into the present compressed digital form with the permission of these institutions.</p>

<p>Funding for the SDSS and SDSS-II has been provided by the Alfred P. Sloan Foundation, the Participating Institutions, the National Science Foundation, the U.S. Department of Energy, the National Aeronautics and Space Administration, the Japanese Monbukagakusho, the Max Planck Society, and the Higher Education Funding Council for England. The SDSS Web Site is http://www.sdss.org/.  The SDSS is managed by the Astrophysical Research Consortium for the Participating Institutions. The Participating Institutions are the American Museum of Natural History, Astrophysical Institute Potsdam, University of Basel, University of Cambridge, Case Western Reserve University, University of Chicago, Drexel University, Fermilab, the Institute for Advanced Study, the Japan Participation Group, Johns Hopkins University, the Joint Institute for Nuclear Astrophysics, the Kavli Institute for Particle Astrophysics and Cosmology, the Korean Scientist Group, the Chinese Academy of Sciences (LAMOST), Los Alamos National Laboratory, the Max-Planck-Institute for Astronomy (MPIA), the Max-Planck-Institute for Astrophysics (MPA), New Mexico State University, Ohio State University, University of Pittsburgh, University of Portsmouth, Princeton University, the United States Naval Observatory, and the University of Washington. </p>"""
  team_page: """<h2>Team</h2>
          <h3>Scientists</h3>
          <p><a href="http://en.wikipedia.org/wiki/Marc_Kuchner">Marc Kuchner (PI)</a>, an astrophysicist at NASA Goddard Space Flight Center, loves to look at pictures of planetary systems and make models explaining what they look like. Kuchner earned his PhD from Caltech in 2001 and went on to study at Harvard-Smithsonian Center for Astrophysics and Princeton. He's known for introducing the world to Water Worlds and Carbon Planets, and for inventing optics for planet finding that will be part of the James Webb Space Telescope.</p>

          <p><a href="http://www.stsci.edu/~debes">John Debes</a> is an ESA/AURA Astronomer at the Space Telescope Science Institute.  He works on the COS/STIS Instrument team and studies dust around stars both young and very old in the quest for understanding the nature of rocky planets around other stars.</p>

          <p><a href="http://asd.gsfc.nasa.gov/Michael.McElwain/">Michael McElwain</a> is a research astrophysicist at NASA’s Goddard Space Flight Center in Greenbelt, MD.  His research focuses on directly imaging exoplanets and their circumstellar disks to improve our understanding of planet formation.  Michael is also designing new science cameras for a next generation space mission to find life on Earth-like planets.</p>

          <p><a href="http://science.gsfc.nasa.gov/sed/index.cfm?fuseAction=people.jumpBio&&iPhonebookId=31795 ">Deborah Padgett</a> is a NASA Research Astrophysicist at the Goddard Space Flight Center. She is a science team member for the Wide-field Infrared Survey Explorer (WISE). Her primary science interests are the evolution of dusty disks around young stars and how they become the diversity of worlds we are starting to detect around other stars.</p>

          <p><a href="http://web.ipac.caltech.edu/staff/rebull/">Luisa Rebull</a> is a Associate Research Astronomer at the Spitzer Science Center (SSC), Infrared Processing and Analysis Center (IPAC), California Institute of Technology. She does a lot of different things at IPAC, including working with the Spitzer and WISE archives, and running the NASA/IPAC Teacher Archive Research Project (NITARP), which partners small groups of educators with a research astronomer for a year-long research project.</p>

          <p><a href="http://www.astro.ethz.ch/people/kevinsc">Kevin Schawinski</a> is an Assistant Professor at the ETH Zurich in Switzerland. He works on galaxies, black holes and has been with the Zooniverse since the beginning.</p>


          <p><a href="http://astro.uchicago.edu/~abans/index.html">Alissa Bans</a> received her PhD in Astronomy and Astrophysics from the University of Chicago, and is currently a postdoctoral scholar at the Adler Planetarium. Her research focuses on how solar systems form and evolve, particularly she focuses on the role of large-scale magnetic fields and also matching theory with observations. In addition to astronomy research, part of her role at the Adler Planetarium is engaging the public through education and outreach, including working with Zooniverse citizen science projects.</p>

          <h3>Developers</h3>
          <p>Edward Paget joined Adler's Zooniverse Team as a software developer in August 2012. He previously worked as a freelance programmer and photographer. Ed graduated from Northwestern University with a major in Radio/TV/Film.</p>

          <p>Heath van Singel is the UX/UI Designer for projects at the Zooniverse where he works to craft thoughtful and engaging user experiences. Apart from design Heath also enjoys illustration, a good sci-fi or fantasy novel, and trips back to Michigan.</p> """

  footer:
    text: "The Zooniverse is a collection of web-based Citizen Science projects that use the efforts of volunteers to help researchers deal with the flood of data that confronts them."
    button: "Visit Zooniverse.org"

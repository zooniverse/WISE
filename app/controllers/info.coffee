{Controller} = require 'spine'

class Info extends Controller
  constructor: ->
    super

  finderChartUrl: (subject) ->
    """
      http://irsa.ipac.caltech.edu/applications/finderchart/#id=Hydra_finderchart_finder_chart&DoSearch=true&subsize=0.08333333400000001&thumbnail_size=medium&sources=DSS,SDSS,twomass,WISE&UserTargetWorldPt=#{subject.coords[0]};#{subject.coords[1]};EQ_J2000&TargetPanel.field.targetName=HIP%20#{subject.metadata.hip_id}&SimpleTargetPanel.field.resolvedBy=nedthensimbad&dss_bands=poss1_blue,poss1_red,poss2ukstu_blue,poss2ukstu_red,poss2ukstu_ir&SDSS_bands=u,g,r,i,z&twomass_bands=j,h,k&wise_bands=1,2,3,4&projectId=finderchart&searchName=finder_chart&startIdx=0&pageSize=0&shortDesc=Finder%20Chart&isBookmarkAble=true&isDrillDownRoot=true&isSearchResult=true
    """

  render: (subject) =>
    @$('.ra').text subject.coords[0].toFixed(2)
    @$('.dec').text subject.coords[1].toFixed(2)

    if subject.metadata.hip_id isnt null
      @$('.hip').show()
      @$('.hip').text subject.metadata.hip_id
    else
      @$('.hip').hide()

    @$('.finder-chart').attr 'href', @finderChartUrl(subject)

  setupSubject: (subject) ->
    @render(subject)

module.exports = Info

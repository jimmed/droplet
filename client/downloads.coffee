Template.downloads.download = => 
  sort = [['status', 'asc'],['download.progress', 'desc']]
  _.map @Downloads.find({}, { sort: sort }).fetch(), (item) ->
    item.class = -> 
      switch item.status
        when 'completed' then 'success'
        when 'downloading' then 'info'
        when 'pending' then 'warning'
        when 'failed' then 'danger'
        else 'default'

    item.icon = ->
      switch item.metadata?.type
        when 'film' then 'film'
        when 'series', 'episode' then 'desktop'
        when 'album', 'song' then 'music'

    item.title = -> 
      item.metadata?.title or 'Awaiting metadata...'

    item.subtitle = ->
      data = item.metadata || {}
      switch data.type
        when 'film'
          data.tagline or data.releaseDate.getFullYear()
        when 'series'
          if data.season then "Season #{data.season}"
        when 'episode'
          [
            "S#{'0' if data.season < 10}#{data.season}" if data.season
            "E#{'0' if data.episode < 10}#{data.episode}" if data.episode
            " " if data.season or data.episode
            data.episodeTitle if data.episodeTitle
          ].join ''
        when 'album'
          data?.albumArtist or 'Album'
        when 'song'
          data?.artist or data?.album
        else 'Other'

    item.panelImage = ->
      images = item.metadata?.images || {}

      JSON.stringify (images.screenshot or images.background or images.banner or images.frontCover or '')

    item.displayProgressBar = ->
      item.status in ['downloading', 'error', 'paused']

    return item
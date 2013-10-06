Downloads = global.Downloads

Meteor.startup ->
  Downloads._collection.remove()
  if Downloads.find().count() is 0
    Downloads.insert item for item in [
      { 
        status: 'completed'
        metadata:
          title: 'This Is The End'
          type: 'film'
          source: 'themoviedb.org'
          releaseDate: new Date '12 June 2013'
          rating: 6.5
          summary: "While attending a party at James Franco's house, Seth Rogen, Jay Baruchel and many other celebrities are faced with the apocalypse."
          images:
            background: 'http://d3gtl9l2a4fn1j.cloudfront.net/t/p/original/9hCFCrQELiiu1Mpod9Y1iFzMWtq.jpg'
            poster: 'http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w185/1rMzHyOsk1b1ddcFJgMSB6kOASu.jpg'
          url: 'http://www.themoviedb.org/movie/109414-this-is-the-end'
        download:
          progress: 100
          type: 'torrent'
      }
      { 
        status: 'downloading'
        metadata:
          title: 'Spaced'
          type: 'series'
          season: 1
          source: 'thetvdb.com'
          releaseDate: new Date '24 September 1999'
          rating: 8
          summary: "Spaced is a sitcom like no other. The premise is simple enough: Daisy (Jessica Stevenson) and Tim (Simon Pegg) are out of luck and love, so pretend to be a couple in order to rent a flat together."
          images:
            background: 'http://thetvdb.com/banners/fanart/original/72658-2.jpg'
            frontCover: 'http://thetvdb.com/banners/_cache/posters/72658-1.jpg'
          url: 'http://thetvdb.com/index.php?tab=series&id=72658'
        download: 
          progress: 5.3
          type: 'torrent'
      }
      { 
        status: 'downloading'
        metadata:
          title: 'Green Wing'
          season: 1
          episode: 3
          type: 'episode'
          episodeTitle: 'Lodgers'
          images: 
            screenshot: 'http://thetvdb.com/banners/_cache/episodes/78899/298489.jpg'
            banner: 'http://thetvdb.com/banners/graphical/78899-g2.jpg'
            background: 'http://thetvdb.com/banners/fanart/original/78899-1.jpg'
          source: 'thetvdb.com'
        download:
          progress: 95
          type: 'torrent'
      }
      { 
        status: 'downloading'
        metadata:
          title: 'Cult'
          albumArtist: 'Savant'
          type: 'album'
          images:
            frontCover: 'http://s.pixogs.com/image/R-4715914-1373202474-8700.jpeg'
        download:
          progress: 35
          type: 'http'
      }
    ]

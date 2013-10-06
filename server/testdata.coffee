Downloads = global.Downloads

Meteor.startup ->
  Downloads._collection.remove()
  if Downloads.find().count() is 0
    Downloads.insert item for item in [
      { 
        name: 'Awesome Movie'
        content:
          type: 'film'
        download:
          eta: 2.46 * 60 * 60
          progress: 30
          type: 'torrent'
      }
      { 
        name: 'Cool TV Series'
        content:
          type: 'series'
        download:
          eta: 1.23 * 60 * 60
          progress: 5.3
          type: 'torrent'
      }
      { 
        name: 'New Album Release'
        content:
          type: 'album'
        download:
          eta: 35 * 60
          progress: 70
          type: 'http'
      }
    ]

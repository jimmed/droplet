Downloads = window.Downloads

# Configure Router
Meteor.Router.add
  '/downloads': 'downloads'
  '/': 'downloads'

# Configure Toolbar
Template.toolbar.title = -> 'Droplet'
Template.toolbar.menuItem = -> [
  {
    url: '/'
    text: 'Downloads'
    active: Meteor.Router.page() is 'downloads'
    count: Downloads.find().count()
  }
]

Template.downloads.download = -> Downloads.find().fetch()
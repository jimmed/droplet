# Configure Toolbar
Template.toolbar.title = -> 'Droplet'
Template.toolbar.menuItem = => [
  {
    url: '/'
    text: 'Downloads'
    active: Meteor.Router.page() is 'downloads'
    count: @Downloads.find().count()
  }
]
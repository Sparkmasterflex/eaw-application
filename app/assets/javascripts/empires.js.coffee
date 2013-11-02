$ ->
  window.Empire = Backbone.Model.extend
    urlRoot: '/empires'
    
  window.Empires = Backbone.Collection.extend
    model: Empire
    url: '/empires'
    
    initialize: (options) ->
      this.url = "/games/#{options.game_id}/empires"

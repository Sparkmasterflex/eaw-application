$ ->
  window.Piece = Backbone.Model.extend
    urlRoot: '/pieces'
    # initialize: (options) ->
    #   this.urlRoot = "/empires/#{options.empire_id}/pieces"
      
  window.Pieces = Backbone.Collection.extend
    model: Piece
    url: '/pieces'
    
    initialize: (options) ->
      this.url = "/empires/#{options.empire_id}/pieces"

    filterWithIds: (ids) ->
      _(this.models.filter (c) -> _.contains(ids, c.id))

    destroy_from_ids: (ids) ->
      this.filterWithIds(ids).each (model) -> model.destroy()
      
window.get_empire_pieces = (empire_id) ->
  pieces = new Pieces({empire_id: empire_id})
  $.when(pieces.fetch()).then () ->
    window.flash.returnPieces JSON.stringify(pieces.toJSON())
  
  

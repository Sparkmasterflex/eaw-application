$ ->
  window.Game = Backbone.Model.extend
    urlRoot: '/games'

  $('a.start').click (e) ->
    game_id = $('#game').data('game')
    window.game = new Game
      id: game_id
    $.when(game.fetch()).then () ->
      window.stage = new Stage {id: game.get('stage_id')}
      
      $.when(stage.fetch()).then () -> start_up_game game, stage
            
    false

  $('ul.stats li').hide()
  $('ul.stats li.percent').show()
  $('.enemy a.add').click (e) ->
    $ul = $(e.target).parents('.enemy').find('ul.stats')
    $lis = $ul.find('li:not(.percent)')
    if $ul.hasClass 'expanded'
      $lis.fadeOut 150, () -> $ul.animate {height: "21px"}, 150
      $ul.removeClass 'expanded'
    else
      $ul.animate
        height: "85px"
      , 150, 'swing', () -> $lis.fadeIn(150)
      $ul.addClass 'expanded'

    false

  
getID = (swfID) ->
  if navigator.appName.indexOf("Microsoft") != -1
  then window[swfID];
  else document[swfID];


start_up_game = (game, stage) ->
  game_json =
    game: game.toJSON()
    stage: stage.toJSON()
  
  flashvars =
    json: JSON.stringify(game_json)
  
  params = 
    allowFullScreenInteractive: true

  attributes = {}
  swf_path = $('#game').data('path')
  $('#game').html """
    <p>You need flash</p>
  """
  swfobject.embedSWF(swf_path, "game", "1200", "800", "9.0.0", "expressInstall.swf", flashvars, params, attributes);
  window.flash = getID('game')


window.saveMapSection = (params) ->
  window.stage.set(params.column, params.value)
  window.stage.save() if params.column is 'section_5'


window.savePiece = (params) ->
  console.log params
  console.log params.empire_id
  if params.id
    piece = new Piece {id: params.id}
    $.when(piece.fetch()).then () -> piece.save(params)
  else
    piece = new Piece()
    piece.save params,
      wait: false,
      success: () ->
        setTimeout () ->
          attrs = 
            emp_id: piece.get('empire_id')
            n: piece.get('name')
            id: piece.get('id')
          window.flash.set_id JSON.stringify(attrs)
        , 500



window.saveEmpire = (params) ->
  return false unless params.id?
  
  # Find any all pieces for empire
  pieces = new Pieces {empire_id: params.id}
  # destroy all that Flash passes
  pieces.fetch
    success: (collection) -> collection.destroy_from_ids params.destroying
  
  # find empire and update
  empire = new Empire {id: params.id}
  $.when(empire.fetch()).then () -> 
    empire.set
      agents_count: params.agents_count
      armies_count: params.armies_count
      cities_count: params.cities_count
      treasury: params.treasury
      # need to add war_with and peace_with
    empire.save()
  
# so far only turn needs to be updated here... ?
window.saveGame = (turn) ->
  window.game.set {turn: parseInt(turn)}
  window.game.save()

window.get_empires = () ->
  game_str = JSON.stringify(window.game.toJSON())
  empires = new Empires
    game_id: window.game.get('id')
  $.when(empires.fetch()).then () ->
    emp_arr = empires.toArray()
    i = 0
    interval = setInterval () ->
      if i < emp_arr.length
        window.flash.setup_empire(JSON.stringify(emp_arr[i].toJSON()), game_str)
        i++
      else
        window.game.save({status: 50})
        clearInterval(interval)
    , 2000    


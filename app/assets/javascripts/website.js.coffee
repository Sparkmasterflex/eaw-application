$ ->
  # click 'play' button and display login
  $('li.dropdown a').click (e) ->
    $link = $(e.target)
    $('form.small-signin').slideToggle 'fast'
    if $link.hasClass 'clicked'
      $link.removeClass 'clicked'
    else
      $link.addClass 'clicked'
    false

  $('a.thumb').colorbox
    rel: $(this).attr 'rel'
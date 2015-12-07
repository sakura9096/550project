#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require underscore
#= require backbone
#= require message-bus
#= require masonry/jquery.masonry
#= require masonry/jquery.imagesloaded.min
#= require_tree .
#= require_self

AppView = Backbone.View.extend
  initialize: ->
    @initNotification()


  initNotification: () ->
    return if not App.access_token?
    return if App.access_token.length < 5
    MessageBus.start()
    MessageBus.callbackInterval = 1000
    MessageBus.subscribe "/notifications_count/#{App.access_token}", (json) -> 
      span = $(".notification-count span")
      link = $(".notification-count a")
      new_title = "new"
      if json.count > 0
        span.show()
        alert("New notification")
        link.addClass("new")
        document.title = new_title
      else 
        span.hide()
        link.removeClass("new")
      span.text(json.count)
    true


window.App = 
  access_token : ""


$(document).ready ->
  window._appView = new AppView()
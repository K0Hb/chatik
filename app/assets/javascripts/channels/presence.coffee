App.presence = App.cable.subscriptions.create "ActualChannel",
  connected: ->
    console.log('ActualChannel connected')

  disconnected: ->
    console.log('ActualChannel disconnected')

  received: (data) ->
    console.log('ActualChannel received')

    App.presence.users_online(data.users)

  users_online: (users) ->
    if (users.length > 0)
      all_users = users.map((user) -> "<span class='text-success ml-2'>#{user.nickname}</span>").join('')
      text =
        "<div>
          <h4 class='text-info'>Now users are online</h4>
            #{all_users}
        </div>"

      $('.online_users').html(text)

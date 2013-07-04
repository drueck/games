$ ->
	handleToggleEditModeClick()

handleToggleEditModeClick = ->
	$('#toggle-edit-mode').on 'click', (e) ->
		toggleEditMode()

showDeleteLinksIfInEditMode = ->
	if $('#toggle-edit-mode').html() == 'Done Editing'
		showRemoveGameLinks()

toggleEditMode = ->
	if $('#toggle-edit-mode').html() == 'Edit List'
		turnOnEditMode()
	else
		turnOffEditMode()

turnOnEditMode = ->
	$('#toggle-edit-mode').html('Done Editing')
	showRemoveGameLinks()

turnOffEditMode = ->
	$('#toggle-edit-mode').html('Edit List')
	hideRemoveGameLinks()

showRemoveGameLinks = ->
	$('.remove-game-link').show()

hideRemoveGameLinks = ->
	$('.remove-game-link').hide()

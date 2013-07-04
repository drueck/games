$ ->
	handleToggleEditModeClick()

handleToggleEditModeClick = ->
	$('#toggle-edit-mode').on 'click', (e) ->
		e.preventDefault()
		toggleEditMode()
		return false

toggleEditMode = ->
	if $('#toggle-edit-mode').hasClass('edit-mode')
		turnOffEditMode()
	else
		turnOnEditMode()

turnOnEditMode = ->
	$('#toggle-edit-mode').addClass('edit-mode')
	showRemoveGameLinks()

turnOffEditMode = ->
	$('#toggle-edit-mode').removeClass('edit-mode')
	hideRemoveGameLinks()

showRemoveGameLinks = ->
	$('.remove-game-link').show()

hideRemoveGameLinks = ->
	$('.remove-game-link').hide()

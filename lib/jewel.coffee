Function::clone = ->
	clone = ->
	for property of @
		clone[property] = @[property] if @hasOwnProperty property
	
	clone.prototype = @prototype
	clone

class Jewel
	@define: (selector, options = {}) ->
		model = do Model.clone
		model::selector = model.selector = selector
		model::options = model.options = options
		model.__defineGetter__ 'all', ->
			do model.find
		model::model = model.model = model
		model

class Model
	constructor: ->
		
	init: (element) ->
		if element instanceof HTMLElement
			@element = element
			if @options.keys
				for key of @options.keys
					e = $(element).find @options.keys[key]
					@[key] = e.html()
		else
			for key of element
				@[key] = element[key]
	
	@find: (options = {}) ->
		items = $(@selector).children()
		results = undefined
		if items.length > 0
			if options.skip or options.limit
				i = 0
				results = []
				loop
					break if not items[i]
					
					if i >= (options.skip or -1) and i < (options.limit or items.length)
						model = new @model
						model.init items[i]
						results.push model
					i++
		
		results = items if not results
		results
	
	fields: ->
		notFields = ['init', 'save', 'remove', 'selector', 'options', 'model']
		fields = {}
		for key of @
			fields[key] = @[key] if -1 is notFields.indexOf key
		fields
	
	save: ->
		if not @element then @create() else @update()
	
	create: ->
		@element = $ @options.template @fields()
		@element.prependTo @selector
	
	update: ->
		fields = @fields()
		
		for key of fields
			$(@element).find(@options.keys[key]).html(fields[key])
	
	remove: ->
		do $(@element).remove
	
	@remove: ->
		do $(@selector).remove
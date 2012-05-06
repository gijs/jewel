Post = Jewel.define 'div.posts',
	keys:
		title: 'h1'
		body: 'p',
	template: (fields) ->
		"<div class=\"post\"><h1>#{ fields.title }</h1><p>#{ fields.body }</p></div>"

describe 'Jewel', ->
	it 'should fetch all posts', ->
		expect(Post.all.length).to.be 2
	
	it 'should fetch first post', ->
		expect(Post.find(limit: 1)[0].title).to.be 'First post'
	
	it 'should fetch second post', ->
		expect(Post.find(skip: 1)[0].title).to.be 'Second post'
	
	it 'should create new post', ->
		post = new Post
		post.title = 'Third post'
		post.body = 'Third content'
		post.save()
		expect(Post.find(limit: 1)[0].title).to.be 'Third post'
	
	it 'should update third post', ->
		post = Post.find(limit: 1)[0]
		post.title = 'Latest post'
		post.save()
		expect(Post.find(limit: 1)[0].title).to.be 'Latest post'
	
	it 'should remove second post', ->
		Post.find(skip: 1)[0].remove()
		expect(Post.all.length).to.be 2
	
	it 'should remove all posts', ->
		Post.remove()
		expect(Post.all.length).to.be 0
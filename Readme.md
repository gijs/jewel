# Jewel

Operate with DOM elements like they're ActiveRecord models.

# Getting Started

**Dependencies**

- jQuery

**Compatability**

- Safari
- Google Chrome
- Firefox
- Opera
- IE - not tested

**Include Jewel** (0.7kb minified and gzipped):

```html
<!-- jQuery must be included before that -->
<script src="jewel.min.js"></script>
```

# Usage

Let's say we have such HTML:

```html
<div id="posts">
	<div class="post">
		<h1>First title</h1>
		<p>First body</p>
	</div>
	<div class="post">
		<h1>Second title</h1>
		<p>Second body</p>
	</div>
</div>
```

Now, we need to define *Post* model:

```javascript
var Post = Jewel.define('#posts', { // selector for a wrapper element
	keys: {
		title: 'h1', // selector for title, h1 in our case. Will be used as #posts .post h1
		body: 'p', // selector for body. Will be used as #posts .post p
	},
	template: function(fields){ // function that returns HTML for new posts, you can use custom templating engine here.
		return "<div class=\"post\"><h1>" + fields.title + "</h1><p>" + fields.body + "</p></div>"
	}
});
```

That's it! We can start doing cool stuff:

```javascript
// Finding all posts
var posts = Post.all;

// Finding first post
var post = Post.find({ limit: 1 })[0];

// Finding second post

post = Post.find({ skip: 1 })[0];
post.title; // "Second title"

// Updating post

post.title = 'Last post';
post.save();

// Removing post

post.remove();

// Removing all posts

Post.remove();

// Creating new one

post = new Post;
post.title = 'Latest post';
post.body = 'Latest content';
post.save(); // will be prepended to #posts
```

# Tests

Run tests by opening **test/test.hmtl** in browser.

# Contributing

- Fork
- Write code, build using ```grunt```
- Write tests for the code
- Commit & push
- Send pull request

# License

(The MIT License)

Copyright (c) 2011 Vadim Demedes sbioko@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
global css html
	ff:sans

tag app
	data = null
	count = 2

	css button p:2 4 ml:2 fs:lg bgc:purple6 bd:1px solid gray3 rd:3px c:white
	css label fs:lg us:none
	css pre p:1 max-height:500px max-width:300px ofy:scroll bd:1px solid gray5
	css #count-input w:50px ta:center p:2 fs:lg
	def retrieve
		let res = await window.fetch("/?count={count}", {headers: {'Content-Type': 'application/json'}})
		data = await res.json!

	<self>
		<header>
			<svg[w:200px h:auto us:none] src='./scrimba.svg'>
			<h1[us:none]> "API to get a set of random hex color codes"
			<p[us:none]> "Send a request to this url {<code> document.location.href} with url param count = number of colors to get and 'Content-Type': 'application/json' header."
			<hr>
			<form$form action='/' methoD="GET" @submit.prevent=retrieve>
				<label for="count-input"> "Count: "
				<input id="count-input" type="number" min="0" max="25" step="1" bind=count>
				<button> "Request data"
			if data
				<pre contenteditable=true> JSON.stringify(data,null,2)

imba.mount <app>
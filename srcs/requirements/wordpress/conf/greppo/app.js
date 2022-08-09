// Get the GitHub username input form
const gitHubForm = document.getElementById('gitHubForm');

// Listen for submissions on GitHub username input form
gitHubForm.addEventListener('submit', (e) => {

	// Prevent default form submission action
	e.preventDefault();

	// Get the GitHub username input field on the DOM
	let usernameInput = document.getElementById('usernameInput');

	// Get the value of the GitHub username input field
	let gitHubUsername = usernameInput.value;

	// Run GitHub API function, passing in the GitHub username
	requestUserRepos(gitHubUsername);

})


function requestUserRepos(username) {

	// Create new XMLHttpRequest object
	const xhr = new XMLHttpRequest();

	// GitHub endpoint, dynamically passing in specified username
	const url = `https://api.github.com/users/${username}/repos`;

	// Open a new connection
	xhr.open('GET', url, true);

	// Process request
	xhr.onload = function() {

		// Parse API data into JSON
		const data = JSON.parse(this.response);
		let root = document.getElementById('userRepos');
		while (root.firstChild) {
			root.removeChild(root.firstChild);
		}

		if (data.message === "Not Found") {

			let ul = document.getElementById('userRepos');
			let li = document.createElement('li');
			li.classList.add('list-group-item')

			if (!username) {
				li.innerHTML = (`
					<p><FONT COLOR="RED"><strong><center>Plase enter username</color></center></strong></p>`);
			} else {
				li.innerHTML = (`
					<p><FONT COLOR="RED"><strong><center>No account exists with username:</strong></FONT> ${username}</center></p>`);
			}

			ul.appendChild(li);
		} else {

			let ul = document.getElementById('userRepos');

			let p = document.createElement('p');
			p.innerHTML = (`<p><strong><center>Number of Public Repos:${data.length}</center></p>`)
			ul.appendChild(p);

			// Loop over each object in data array
			for (let i in data) {

				let li = document.createElement('li');
				li.classList.add('list-group-item')
				li.innerHTML = (`
				<p><strong>Repo Name:</strong> ${data[i].name}</p>
				<p><strong>Description:</strong> ${data[i].description}</p>
				<p><strong>Language:</strong> ${data[i].language}</p>
				<p><strong>URL:</strong> <a href="${data[i].html_url}">${data[i].html_url}</a></p>`);

				ul.appendChild(li);
			}
		}
	}
	// Send the request to the server
	xhr.send();
}

let button = document.getElementById("random_button");
let body = document.getElementById("content_area");
  button.addEventListener('click', () => {
    fetch('http://localhost:4567/random_article.json')
 .then(response => {
   if (response.ok) {
     return response;
   } else {
     let errorMessage = `${response.status} (${response.statusText})`,
         error = new Error(errorMessage);
     throw(error);
   }
 })
 .then(response => response.text())
 .then(body => {
   console.log("The body of the response from the fetch call:");
   console.log(body);
   let bodyParsed = JSON.parse(body);
   console.log("The body of the response from the fetch call:")
   console.log (bodyParsed);
 })
   .catch(error => console.error(`Error in fetch: ${error.message}`));
 })

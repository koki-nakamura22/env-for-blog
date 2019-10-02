/*
  This js file is for individual users to modify the scripts for their personal site,
  or for the implementation of features specifically for their site. Anything that
  is an official part of the theme (ex. Pull Requests) should be included in main.js
  and follow the formatting and style given.
*/

(function addTitleToCodeBlock() {
  let list = document.body.getElementsByClassName("highlight");

  for (i = 0; i <= list.length - 1; i++) {
    let code = list[i].firstElementChild.firstElementChild;
    let codeName = code ? code.className.split(":")[1] : null;

    if (codeName) {
      let div = document.createElement("div");
      div.textContent = codeName;
      div.classList.add("code-name");
      code.parentNode.insertBefore(div, code);
    }
  }
}());

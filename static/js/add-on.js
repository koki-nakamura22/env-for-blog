/*
  This js file is for individual users to modify the scripts for their personal site,
  or for the implementation of features specifically for their site. Anything that
  is an official part of the theme (ex. Pull Requests) should be included in main.js
  and follow the formatting and style given.
*/

/* For the title of code block. */
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

/* For the Copy button. */
(() => {
  'use strict';

  if(!document.queryCommandSupported('copy')) {
    return;
  }

  function flashCopyMessage(el, msg) {
    el.textContent = msg;
    setTimeout(() => {
      el.textContent = "Copy";
    }, 1000);
  }

  function selectText(node) {
    let selection = window.getSelection();
    let range = document.createRange();
    if (node.childElementCount === 2) {
      // Skip the title.
      range.selectNodeContents(node.children[1]);
    } else {
      range.selectNodeContents(node);
    }
    selection.removeAllRanges();
    selection.addRange(range);
    return selection;
  }

  function addCopyButton(containerEl) {
    let copyBtn = document.createElement("button");
    copyBtn.className = "highlight-copy-btn";
    copyBtn.textContent = "Copy";

    let codeEl = containerEl.firstElementChild;
    copyBtn.addEventListener('click', () => {
      try {
        let selection = selectText(codeEl);
        document.execCommand('copy');
        selection.removeAllRanges();

        flashCopyMessage(copyBtn, 'Copied!')
      } catch(e) {
        console && console.log(e);
        flashCopyMessage(copyBtn, 'Failed :\'(')
      }
    });

    containerEl.appendChild(copyBtn);
  }

  // Add copy button to code blocks
  let highlightBlocks = document.getElementsByClassName('highlight');
  Array.prototype.forEach.call(highlightBlocks, addCopyButton);
  document.querySelectorAll(".highlight pre").forEach((el) => {
    el.style.backgroundColor = "";
  });
})();

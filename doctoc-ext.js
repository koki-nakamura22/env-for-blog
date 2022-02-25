const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

for (let i = 2; i < process.argv.length; i++) {
  const filePath = path.join(__dirname, process.argv[i]);
  if (fs.existsSync(filePath)) {
    execSync(`doctoc ${filePath}`);
    fs.readFile(filePath, "utf8", function (err, data) {
      if (err) throw err;
      // Line head
      data = data.replace(
        /(- )(\[.*?\]\(.*?\)$)/gm,
        '$1<font color="#1111cc">$2'
      );
      // Line tail
      data = data.replace(/(- <.*?>\[.*?\]\(.*\))/gm, "$1</font>");
      fs.writeFile(filePath, data, function (err) {
        if (err) throw err;
        console.log(`${process.argv[i]} completed`);
      });
    });
  } else {
    console.log(`\x1b[31m${filePath} was not found.`);
  }
}

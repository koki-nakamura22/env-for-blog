const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

const fontDir = "static/fonts/hackgen/HackGen";
const outputDir = "static/img/og";
const configFilePath = "tcargen.yml";

for (let i = 2; i < process.argv.length; i++) {
  const filePath = path.join(__dirname, process.argv[i]);
  if (fs.existsSync(filePath)) {
    const commandStr = `tcardgen --fontDir ${fontDir} --output ${outputDir} --config ${configFilePath} ${filePath}`;
    execSync(commandStr);
  } else {
    console.error(`\x1b[31m${filePath} was not found.`);
  }
}

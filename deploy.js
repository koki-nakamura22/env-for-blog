const path = require("path");
const { execSync } = require("child_process");

const execSyncWithConsoleLog = (command) => {
  try {
    const stdout = execSync(command);
    const stdoutStr = stdout.toString();
    if (0 < stdoutStr.length) console.log(stdoutStr);
    return 0;
  } catch (error) {
    console.log(`\x1b[31m${error.message}`);
    return error.status;
  }
};

const zeroPadding = (num, len) => {
  return ("000" + num).slice(-len);
};

const getNowStr = () => {
  const d = new Date();
  const fullYear = d.getFullYear();
  const month = zeroPadding(d.getMonth() + 1, 2);
  const date = zeroPadding(d.getDate(), 2);
  const hours = zeroPadding(d.getHours(), 2);
  const minutes = zeroPadding(d.getMinutes(), 2);
  const seconds = zeroPadding(d.getSeconds(), 2);
  const timezoneOffset = zeroPadding(d.getTimezoneOffset() / -60, 2);
  const timezoneOffsetRemainder = zeroPadding(d.getTimezoneOffset() % -60, 2);
  return `${fullYear}-${month}-${date} ${hours}:${minutes}:${seconds} +${timezoneOffset}:${timezoneOffsetRemainder}`;
};

const sourcePath = process.cwd();

try {
  // Go to this script file directory.
  process.chdir(__dirname);

  // Build the project.
  execSyncWithConsoleLog("hugo");

  // Go to public directory.
  process.chdir(path.join(__dirname, "public"));

  // Add changes to git.
  execSyncWithConsoleLog("git add .");

  // Commit.
  const commitResultStatus = execSyncWithConsoleLog(
    `git commit -m "Site updated: ${getNowStr()}"`
  );
  if (0 !== commitResultStatus) {
    console.log(
      "\x1b[31mProbably your branch is up to date with 'origin/master'. Or some other errors happened."
    );
    process.exit(1);
  }

  // Push source and build repos.
  execSyncWithConsoleLog("git push origin master");

  console.log("\x1b[36mThe web page has been updated!");
} finally {
  // Return to the path before executing this script.
  process.chdir(sourcePath);
}

# https://stackoverflow.com/questions/2808177/how-can-i-git-clone-from-another-machine
print $repo = `git clone sshhost:~/yourprojects/yourfolder`;
$commit = 2;
$n = $commit - 1;
print $showCommit = `git show HEAD~$n`;


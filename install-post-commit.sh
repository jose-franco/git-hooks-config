#!/bin/sh

jenkins_root="http://localhost:8080/"
gitdir=.git
hooksdir=$gitdir/hooks

remote_repo=`cat $gitdir/config | grep url | awk '{print $3}'`
invoke_url="$jenkins_root/git/notifyCommit?url=$remote_repo"
echo "jenkins_root:  $jenkins_root"
echo "repo:  $remote_repo"
 
 rightval="$invoke_url"
cat > $hooksdir/post-commit <<- EOF
#!/bin/sh
curl -k -O  $invoke_url
EOF
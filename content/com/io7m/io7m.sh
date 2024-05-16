#!bash

p=$1
v=$2

[ -d $p ] || mkdir $p
cat canonmill/com.io7m.canonmill-2.1.0.buildspec | sed -e "s/canonmill/$p/" | sed -e "s/2.1.0/$v/" | sed -e 's/ -Dassembly.skipAssembly//' > $p/com.io7m.$p-$v.buildspec

echo "./rebuild.sh content/com/io7m/$p/com.io7m.$p-$v.buildspec"
echo "git add $p ; git commit -m 'add com.io7m.$p $v' ; git push"
echo "bin/add-new-release.sh content/com/io7m/$p/com.io7m.$p-$v.buildspec $v"

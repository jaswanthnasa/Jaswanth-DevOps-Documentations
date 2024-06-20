#!bin/bash
cat << EOF > package-list.txt
curl
git
EOF

for package in $(cat package-list.txt)
do
#echo "$i installed "
if rpm -q package-name --quiet; then
    echo "Package $package is installed."
else
    echo "Package $package is not installed."
fi
done

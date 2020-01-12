
for i in `find ${PWD} -name "*.jar"`; do
  jar -tf $i | grep -qs $1 && echo $i
done
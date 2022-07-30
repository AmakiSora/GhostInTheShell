# 流程控制
# if
if [ $a = $b ]
then
   echo 1
elif [ $a = $b ]
then
   echo 2
else
   echo 3
fi

echo -------------------------------------------------------

# case
n=1
case $n in
    1)  echo '111'
    ;;
    2)  echo '222'
    ;;
    3)  echo '333'
    ;;
    4)  echo '444'
    ;;
    *)  echo 'other'
    ;;
esac

echo -------------------------------------------------------

s="a"
case "$s" in
   "a") echo "aaaa"
   ;;
   "b") echo "bbbb"
   ;;
   "c") echo "cccc"
   ;;
esac

echo -------------------------------------------------------

# for
for i in 1 2 3 4 5
do
    echo "i-> $i"
done

echo -------------------------------------------------------

for str in This is a string
do
    echo $str
done

# 无限循环
# for (( ; ; ))

echo -------------------------------------------------------

# while
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done

echo -------------------------------------------------------

# 无限循环
i=5
while true
do
   if [ $i = 1 ]
   then
      echo "i -> 1"
      let "i--"
      continue
   elif [ $i = 0 ]
   then
      echo "exit"
      break
   else
      echo $i
      let "i--"
   fi
done

echo -------------------------------------------------------

# until
a=0
until [ ! $a -lt 5 ]
do
   echo $a
   a=`expr $a + 1`
done

echo -------------------------------------------------------

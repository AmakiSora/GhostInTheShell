# shell基础知识
:<<随意字符,结尾也要加
特殊的多行注释
随意字符,结尾也要加
# 变量声明(注意,=号前后不能有空格)
a="hello"
b=1
c=2
d=world

# 无符号和双引号会转义字符串,单引号不会
e=$a$d
f='$a$d'
g="$a$d"
h=$a'$a'$d'$d'

# 变量调用
echo $a
echo $b
echo $a+$b
echo $c+$b
echo $a $d
echo $e
echo $f
echo $g
echo $h

echo -------------------------------------------------------

# 获取变量长度
echo a的长度为:${#a}
# 字符串截取
echo 截取的字符串为:${a:1:3}

# 只读变量(不能删除或写入)
url="127.0.0.1"
readonly url
# url="233"
echo 只读变量为:$url

# 删除变量
unset a
echo 删除后值为:$a

echo -------------------------------------------------------

# bash支持一维数组(不支持多维数组),并且没有限制数组大小
# 数组间元素用空格隔开
l=("1" 2 '3' $d)
echo 数组0号位置:${l[0]}
echo 数组1号位置:${l[1]}
echo 数组2号位置:${l[2]}
echo 数组3号位置:${l[3]}
echo 获取3号位置元素长度:${#l[3]}
echo 获取所有的元素:${l[@]}
echo 获取数组元素个数${#l[@]}
echo 获取数组元素个数${#l[*]}

echo -------------------------------------------------------

# 算术运算符
a=233
b=227
# 
echo 加法:`expr $a + $b`
echo 减法:`expr $a - $b`
echo 乘法:`expr $a \* $b`
echo 除法:`expr $a / $b`
# 判断是否相等,不等0,相等1
echo 判断是否相等:`expr $a == $b`
echo 判断是否不相等:`expr $a != $b`

echo -------------------------------------------------------

# 关系运算符
# 关系运算符只支持数字,不支持字符串,除非字符串的值是数字
# -eq 检测两个数是否相等，相等返回 true
if [ $a -eq $b ]
then
   echo "$a -eq $b : a 等于 b"
else
   echo "$a -eq $b: a 不等于 b"
fi
# -ne 检测两个数是否不相等，不相等返回 true
if [ $a -ne $b ]
then
   echo "$a -ne $b: a 不等于 b"
else
   echo "$a -ne $b : a 等于 b"
fi
# -gt 检测左边的数是否大于右边的，如果是，则返回 true
if [ $a -gt $b ]
then
   echo "$a -gt $b: a 大于 b"
else
   echo "$a -gt $b: a 不大于 b"
fi
# -lt 检测左边的数是否小于右边的，如果是，则返回 true
if [ $a -lt $b ]
then
   echo "$a -lt $b: a 小于 b"
else
   echo "$a -lt $b: a 不小于 b"
fi
# -ge 检测左边的数是否大于等于右边的，如果是，则返回 true
if [ $a -ge $b ]
then
   echo "$a -ge $b: a 大于或等于 b"
else
   echo "$a -ge $b: a 小于 b"
fi
# -le 检测左边的数是否小于等于右边的，如果是，则返回 true
if [ $a -le $b ]
then
   echo "$a -le $b: a 小于或等于 b"
else
   echo "$a -le $b: a 大于 b"
fi
# ! 非运算，表达式为 true 则返回 false，否则返回 true
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a == $b: a 等于 b"
fi
# -a 与运算，两个表达式都为 true 才返回 true
if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a 小于 100 且 $b 大于 15 : 返回 true"
else
   echo "$a 小于 100 且 $b 大于 15 : 返回 false"
fi
# -o 或运算，有一个表达式为 true 则返回 true
if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a 小于 100 或 $b 大于 100 : 返回 true"
else
   echo "$a 小于 100 或 $b 大于 100 : 返回 false"
fi
# && 逻辑的 AND
if [[ $a -lt 100 && $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi
# || 逻辑的 OR
if [[ $a -lt 100 || $b -gt 100 ]]
then
   echo "返回 true"
else
   echo "返回 false"
fi

echo -------------------------------------------------------

# 字符串运算符
a="abc"
b="efg"
# = 检测两个字符串是否相等，相等返回 true
if [ $a = $b ]
then
   echo "$a = $b : a 等于 b"
else
   echo "$a = $b: a 不等于 b"
fi
# != 检测两个字符串是否不相等，不相等返回 true
if [ $a != $b ]
then
   echo "$a != $b : a 不等于 b"
else
   echo "$a != $b: a 等于 b"
fi
# -z 检测字符串长度是否为0，为0返回 true
if [ -z $a ]
then
   echo "-z $a : 字符串长度为 0"
else
   echo "-z $a : 字符串长度不为 0"
fi
# -n 检测字符串长度是否不为 0，不为 0 返回 true
if [ -n "$a" ]
then
   echo "-n $a : 字符串长度不为 0"
else
   echo "-n $a : 字符串长度为 0"
fi
# 检测字符串是否不为空，不为空返回 true
if [ $a ]
then
   echo "$a : 字符串不为空"
else
   echo "$a : 字符串为空"
fi

echo -------------------------------------------------------

# 文件测试运算符
file="./helloworld.sh"

if [ -r $file ]
then
   echo "文件可读"
else
   echo "文件不可读"
fi

if [ -w $file ]
then
   echo "文件可写"
else
   echo "文件不可写"
fi

if [ -x $file ]
then
   echo "文件可执行"
else
   echo "文件不可执行"
fi

if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi

if [ -d $file ]
then
   echo "该路径是目录"
else
   echo "该路径不是目录"
fi

if [ -s $file ]
then
   echo "文件不为空"
else
   echo "文件为空"
fi

if [ -e $file ]
then
   echo "文件存在"
else
   echo "文件不存在"
fi

echo -------------------------------------------------------

# echo用法
echo "hello world!"
# 显示转义字符
echo "\"hello world!\""
# 显示变量
echo $file
# 显示换行
echo -e "H \n W"
echo "hello world!"
# 显示不换行
echo -e "H \c W"
echo "hello world!"
# 输出到文件
echo "hello world" > file
# 执行命令并打印
echo 'pwd'

echo -------------------------------------------------------
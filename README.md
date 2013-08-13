用其它语言去解决haskell 99道习题。
http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems

都能解决了。初级修炼也就完成了。

最终目标是我个人能用3种语言解决这些问题。ruby, scheme, haskell。

yp快来参与，语言不限。

格式： 把文件按 id.lang_suffix 就可以了。 比如 03.rb, 03,hs, 03.scm, 03.js, 03.py

解题可以偷懒。比如第一题 

(*) Find the last element of a

myLast [1,2,3,4]
4

如果你语言支持， myLast.last 这种也算对。


是的。第一遍做的时候只要有正确答案即可。而不需要

def my_last list
	*init, last = list
	if init.empty?
		last
	else
		list.shift
		my_last list 
	end
end


共勉！ ；） 

in_f = open(ARGV[0], "r")

i = 0
pos =[] 
# ファイルの一行ずつの読み込み
for line in in_f
  i = i + 1
#   p line.to_i()
  pos[line.to_i()] = i 
end


# 最後の行
last_line = i

# 交点カウント
cross_count = 0

# 認識済み交点
find_points = {} 

# 交点を数える
for i in 1 .. last_line
  #debug
  cur_from = i
  cur_to   = pos[i]
  # p "#{j} ->  #{pos[j]}"
  for j in 1 .. last_line
   from = j
   to   = pos[j] 
   # 交差するとはどういう事象？
   if (cur_from < from && cur_to > to) || (cur_from > from && cur_to < to) 
     # 交差した。交差ポイントコレクションにあるか？
     if cur_from < from
       key = "#{cur_from},#{from}"
     else
       key = "#{from},#{cur_from}"
     end
     if find_points[key] != true
       # debug
       p "交差したポイント #{key}"
       cross_count = cross_count + 1
       find_points[key] = true
     end
   end
  end
end

p "結果交点の数 : #{cross_count}"

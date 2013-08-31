in_f = open(ARGV[0], "r")

i = 0
pos =[] 
# ファイルの一行ずつの読み込み
for line in in_f
  i = i + 1
  p line.to_i()
  pos[line.to_i()] = i 
end

cross_count = 0

# 交点を数える
for j in 1 .. i
  #debug
  # p "#{j} ->  #{pos[j]}"

  from = j
  to   = pos[j]

  if from > to 
    swap = from
    from = to
    to = swap
  end
  # from から to までに開始点になってる箇所すべて(自分以外)を回す
  for k in from .. to
    if k != j
      p "#{j} の交点可能性 #{k}"
      # k が検査中の開始点より上の場合
      if k > j
        # 上に進んでくパターンなので、降ってくる線を検出する
        if k > pos[k]
          p "#{j} スタートの奴は、#{k} スタートの奴と交差する。"
          cross_count = cross_count + 1
        end
      else
        # 下へ進んでくパターンなので、登ってくるものを検出する
        if k < pos[k]
          p "#{j} スタートの奴は、#{k} スタートの奴と交差する。"
        end
      end

    end
  end
end

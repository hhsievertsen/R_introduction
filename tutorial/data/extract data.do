
wid, indicators(sptinc) areas(_all) perc(p0p50 p50p90 p90p100 p90p99 p99p100) ages(992) pop(j) clear
drop age pop variable
levelsof percentile,local(a)

foreach v in `a'{
	gen `v'=value if percentile=="`v'"
}
drop percentile
collapse (mean) p* ,by(country year)

export delimited using "C:\Users\hs17922\Dropbox\Work\Teaching\Economic Data\2019_2020\rtutorial\RIntro\data\widfull.csv", replace

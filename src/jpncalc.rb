#!/usr/bin/env ruby

# 一番目の引数が数値でない場合はエラー
unless ARGV[0] =~ /^[0-9]+$/
	puts 'ARGV error'
	exit 1
end

def moneycalc(money, max)
	result = 0
	count = 1 
	until money - max * count < 0
		count += 1
		result += 1
	end
	return result
end

def moneyrest(money, max)
	return money - moneycalc(money, max) * max
end

jpn10000 = moneycalc ARGV[0].to_i, 10000
jpn5000 = moneycalc moneyrest(ARGV[0].to_i, 10000), 5000
jpn1000 = moneycalc moneyrest(ARGV[0].to_i, 5000), 1000
jpn500 = moneycalc moneyrest(ARGV[0].to_i, 1000), 500
jpn100 = moneycalc moneyrest(ARGV[0].to_i, 500), 100
jpn50 = moneycalc moneyrest(ARGV[0].to_i, 100), 50
jpn10 = moneycalc moneyrest(ARGV[0].to_i, 50), 10
jpn5 = moneycalc moneyrest(ARGV[0].to_i, 10), 5
jpn1 = moneycalc moneyrest(ARGV[0].to_i, 5), 1

puts <<-"EOB"
10000円札: #{jpn10000}枚
5000円札: #{jpn5000}枚
1000円札: #{jpn1000}枚
500円玉: #{jpn500}枚
100円玉: #{jpn100}枚
50円玉: #{jpn50}枚
10円玉: #{jpn10}枚
5円玉: #{jpn5}枚
1円玉: #{jpn1}枚
EOB

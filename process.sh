#!/usr/bin/env bash

echo "Unzipping into submissions/"
unzip submissions.zip -d submissions >/dev/null 2>&1 
echo "Unzipped."

rm submissions/[a-q]*
rm submissions/r[a-n]*
rm submissions/s[p-z]*
rm submissions/[t-z]*

students=$(ls submissions | cut -d "_" -f 1 | uniq)


mkdir submissions/students/
touch submissions/students/err_log.log


#########
# split submissions into student dirs
#########

echo "moving submissions into student dirs"
for i in $students
  do 
	mkdir submissions/students/_"$i"
	mv submissions/"$i"* submissions/students/_"$i"
	num_pies=$(ls submissions/students/_"$i"/*py | wc -l)
	num_pdf=$(ls submissions/students/_"$i"/*pdf | wc -l)
	if [ "$num_pies" -ne 1 ]
	then
		echo "$i" submitted "$num_pies" "python files" >>  submissions/students/err_log.log
	fi
	if [ "$num_pdf" -ne 1 ]
	then
		echo "$i" submitted "$num_pdf" "pdf files" >>  submissions/students/err_log.log
	fi
  done

echo "Moved"
########


####################
# Create HTML files
###################
for i in $students
  do
	echo "Now running" "$i" 
	cd submissions/students/_"$i"
	python *py  &> output.txt
	img_files=$(ls *.png)
	pdf_files=$(ls *.pdf)
	touch index.html
	echo "<!DOCTYPE html><html> <head> <meta charset=\"utf-8\">" >> index.html
	echo "<title>" "$i" "</title> </head> <body> <h1>" "$i"  "</h1> " >> index.html
	echo "<div class=\"row\" style=\"display:flex;\" >" >> index.html
		echo "<div class=\"column\" style=\"display: 70% ;\" >" >> index.html
			echo "<ol>" >> index.html
				for pdf in $pdf_files
  				do
					echo "<li>" "$pdf"  "</li>" >> index.html
				done 
			echo "</ol>" >> index.html
			for pdf in $pdf_files
  			do 
				echo "<embed src=\""$pdf"\" " >> index.html
					echo " width=\"750\" height=\"3000\" alt=\"pdf\" " >> index.html
					echo " pluginspage=\"http://www.adobe.com/products/acrobat/readstep2.html\">" >> index.html
			done
		
		echo "</div>" >> index.html
		echo "<div class=\"column\" style=\"display: 30% ;\" >" >> index.html
			for im in $img_files
  			do 
				echo "$im" "<br />"  >> index.html
				echo "<img src=\""$im"\" /><hr /><br /> "  >> index.html
			done
			echo "<div style=\"border: 1px solid #000; margin: 5px;\"><h2>txt output from python</h2><pre>" >> index.html
			cat output.txt   >> index.html
			echo "</pre></div>" >> index.html
		echo "</div>" >> index.html
	echo "</div>" >> index.html

	cd ../../..
	 
  done

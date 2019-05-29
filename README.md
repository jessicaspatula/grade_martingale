
running process.sh will result in a subfolder for each student in your local envirnoment. each student's martingale.py file will be executed in their directory and the resulting png files should also be there. you can view these images directly or view index.html in a web browser to see the pdf side by side with the generated images.


NOTE: this script was written on mac OS and should also work in a linux environment. 
If you are using Windows, I recommend performing these steps on buffet. After you run on buffet, transfer the created submissions/ dir to your local machine to view the html and png files.

# instructions for use

## modify process.sh for your student subset

you'll want to modify the following lines in process.sh  to remove all student records that you are not grading. this will allow the script to run much faster

Here I am removing the subfolders for students whose last names start with a though q, etc.
```
rm submissions/[a-q]*
rm submissions/r[a-n]*
rm submissions/s[p-z]*
rm submissions/[t-z]*
```

## run the script

Download the bulk project submissions.zip file from Canvas
move the zip file into the same directory as process.sh
make sure you have execute permission for process.sh
then run

``` ./process.sh ```


monitor the output 

* if a submission takes more than ~30 seconds to run, CTRL-C to quit the exectution of that student's python script
* if matplotlib images pop up, note the student name, and close the graph windows so that process.sh can continue on to the next student script

## view student submission

in a web browser, navigate to the submissions/ directory and then to each student's index.html file
You will see the following arrangement:

![](demo.png?raw=true)


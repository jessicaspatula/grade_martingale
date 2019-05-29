## modify process.sh for your student subset

you'll want to modify the following lines to remove all student records that you are not grading. this will allow the script to run much faster


```
rm submissions/[a-q]*
rm submissions/r[a-n]*
rm submissions/s[p-z]*
rm submissions/[t-z]*
```

## run the script

Download the bulk project zip file from Canvas
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

![][demo.png?raw=true]


CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
FILE='./student-submission/ListExamples.java'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f $FILE ]]
then
    cp GradeServer.java Server.java TestListExamples.java student-submission/ListExamples.java grading-area 
    cd grading-area
    javac -cp $CPATH *.java 2> errors.txt
    if [[ $? -eq 0 ]]
    then
        java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > result.txt

    else
        echo 'ListExamples.java failed to compile, please check your code'
        exit
    fi
    else 
        echo 'ListExamples.java not found, please resubmit with the correct file'
fi
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

#!/bin/bash


#marco:the current working directory should be saved in some manner

marco () {

foo=$(pwd)

}


#polo: cd's you back to the directory where you executed marco

polo () {

cd $foo

}


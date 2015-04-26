---
title       : Capstone Project
subtitle    : Predicting the next word using a n-gram model
author      : Nicholas Tang
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

 * Our application will predict the next word, given a set of previous text

> * The data to build the prediction model is provided by [HC Corpora ](http://www.corpora.heliohost.org/)  
  
> * We select a small sample size (2.5%) to train the data. We sample the data randomly.  
    
> * The prediction model is built using n-grams. For convenience, we only sample a small size of the data
  
> * After creating the model, the application will take the text input and will convert it into the same format as our trained data set. 
  
> * The final result is obtained by running the converted input through our prediction model, and displays the predicted word based on those inputs


--- .class #id 

## Data Processing

Before beginning the training process, we clean the data as follows

> * Remove all swear words in the text that will be used for training

> * Remove all words with special characters (unicode)

> * Remove all stop words in the text (eg common words like is, I, etc)

> * Convert special acronyms (eg U.S.)

> * Separate the training set into 2 samples, where 0.9 will decide the closed book vocabulary. Words that do not appear in the entire training set will be set to <unk> or unknown, to model unknown vocabularies

--- .class #id 

## Algorithm

Using a subset of the given corpus (2.5% of each data set), we train as follows

> * The input string is fed into the algorithm will be initially prepared for evaluation by removing/converting texts to the one similarly used for training

> * The text will then be broken into string tokens (similarly to ngrams). It will then be evaluated against the model to see if this similar text has been seen/modelled before starting from 6 words

> * If it has been seen before based on the previous 6 words, return the most frequent word

> * If it has not been seen before, try the last 5 words (backoff model), and return the most frequent word. Repeat until 0, where we will simply return the most frequently used word in the entire corpus

--- .class #id 

## Results and performance

The data was subsequently tested on both the known, and the unknown

> * Accuracy against the trained sample: 76%

> * Accuracy against the test sample: 4%

> * Size of data model in memory : 107.7Mb

> * Size of vocabulary : 7.3MB

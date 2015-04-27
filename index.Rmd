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

## Model creation

The following are some of the steps taken for the model creation

* Remove all swear words in the text that will be used for training

* Remove all words with special characters (unicode)

* Convert special acronyms (eg U.S.)

* Create special classes &lt;number&gt;, &lt;money&gt;, &lt;link&gt; to indicate money, numbers and links

* Find the most frequent words in the entire corpus, and use it as the benchmark for creating the &lt;unknown&gt; class

* Retain only the most frequent output for a certain sequence of words to improve memory usage

* Divide model from the strings, and simply create the model using indexes to refer to the exact string

* Vocab is stored in a hashtable for quick access

--- .class #id 

## Algorithm

* The input string is fed into the algorithm will be initially prepared for evaluation by removing/converting texts to the one similarly used for training (removing punctuations etc)

* The text will then be broken into string tokens (similarly to ngrams). It will then be evaluated against the model to see if this similar text has been seen/modelled before, return the most frequently seen output for this sequence

* If it has not been seen before, try the last 4 words (backoff model), and return the most frequent word. Repeat until 0, where we will simply return the most frequently used word found from the training

--- .class #id 

## Results and performance

The data was subsequently tested on both the known, and the unknown

* Accuracy against the trained sample: 80%

* Accuracy against the test sample: 10%

* Size of data model in memory : 93.5Mb (Optimized to store only integers)

* Size of vocabulary : 7.3MB

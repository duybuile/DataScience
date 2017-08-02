Capstone Project - Data Science Specialisation
========================================================
author: Duy Bui
date: Aug 16th 2015

Overview
========================================================

The **Capstone project** deliverable as the final assignment from the *Data science specialisation* course is a replica of **Swiftkey** app on the web where users could predict next word based on what they already typed in.

As an indicative of knowledge accumulated from the course, the completion of the final assignment includes: 
- Shinyapps 
- Text mining
- Predictive model and algorithm

Shinyapps
========================================================

The shinyapps could be found on the following [shinyapp link]. 

1. Description:
  - Users wait until data loaded and input sentence box appeared to type in
  - The most 5 predictable word will instantly appear
  - The tab *"About"* shows some info of the app

2. User experience improvement:
  - Discard the "Submit" button so that prediction is instant
  - Data loading at the initial stage

[shinyapp link]:https://duybuile.shinyapps.io/swiftkeyapp

Predictive model and Algorithm
========================================================

1. **Data**: only *10%* of each data file (twitter, blog and news) is used for predictive model 
2. **Model**: The model uses 2-gram, 3-gram and 4-gram. 5-gram was presumably added to increase the accuracy however it doubled the size of the memory usage which causes app delays. That is why we stop at 4-gram.
3. **Algorithm**:*[Stupid backoff algorithm]*
  - A recursive search from the 4-gram, 3-gram to 2-gram. If number of found words is smaller than 5, it continues to search at the lower n-gram level. Otherwise, it stops. 
  - Quick, simple, easy to install (no complex probability calculation requirements) and suitable for small apps (Swift Keys)
[Stupid backoff algorithm]:http://www.aclweb.org/anthology/D07-1090.pdf

Model Improvement
========================================================

The model continued to be improved as follows:

1. **Improve accuracy**
  - Profanity filter (not only for training data but also for user input)
  - Replace shorthand writing. *Eg: I'd = I would*
2. **Increase performance**
  - Remove terms in any n-gram where frequency is 1. N-gram dataset size is reduced by **80%**, which significantly increases performance (This also increases the accuracy of predicted words.)
  - 5 most frequent words from 1-gram are used in case no words could be found from higher-gram data set

Summary
========================================================
The app is a presentation of compreshensive knowledge accumulated from the data science course. For further improvement: 
  - Increase the shorthand writing dictionary
  - Use *Amazon Cloud* service for robust computation
    1. Afford more complicated algorithm
    2. More data for training set 
  - Hash table to compress data before loading them to server
  - Explore data from external sources 
